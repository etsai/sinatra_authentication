helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    User.find(session[:user_id]) if session[:user_id]
  end

end


# @user = User.find_by_email(params[:user][:email])
#     puts @user.id
#     puts @user
#     session[:user_id] == @user.id ? true : false



