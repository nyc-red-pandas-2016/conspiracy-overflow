get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ['Invalid email/password']
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.clear

  redirect '/'
end

get '/users' do
#possible list of users.
end

get '/users/:id' do
  if current_user
    @user = User.find_by(id: params[:id])
    erb :'users/show'
  else
    redirect '/users/login'
  end
end
