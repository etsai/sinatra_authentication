get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])

  if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/"
  else
    @error = "Incorrect Email/Password Combination"
    erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
  redirect "/"
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @user = User.create(params[:user])
    if @user.valid?
      session[:user_id] = @user.id
      redirect "/"
    else
      @incorrect_sign = @user.errors.full_messages
      erb :sign_up
    end
end
