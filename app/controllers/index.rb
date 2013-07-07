get '/' do
  @posts = Post.all
  erb :index
end

get '/private' do

  if current_user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

get '/sessions/:id' do
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  redirect '/'
end



#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :sign_up
  end
end

get '/user/:id/profile' do
  if params[:id].to_i == session[:user_id]
    @user = User.find(params[:id])
    erb :profile
  else
    redirect '/'
  end
end

#-------------- POSTS -----------------

get '/post/create/new' do
  erb :create_post
end

get '/post/find/:post_id' do
  @post = Post.find(params[:post_id])
  erb :show_post
end

post '/post/new/create' do
  puts params
  Post.create(params)
end
