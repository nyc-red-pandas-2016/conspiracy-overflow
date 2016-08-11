get '/' do
  @questions = Question.search(params[:search])
  erb :"index"
end

post '/search' do
  redirect "/?search=#{params[:search][:input]}"
end

post '/comments' do
  @comment = Comment.new(params[:comment])
  @comment.user_id = session[:user_id]
  p params
  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    #display errors
  end
end

post '/answers' do
  @answer = Answer.new(params[:answer])
  @answer.user_id = session[:user_id]
    p params
  if @answer.save
    redirect "/questions/#{params[:answer][:question_id]}"
  else
    #display errors
  end
end

get '/session' do
  session.inspect
end

post '/votes' do
  # binding.pry
  votable_id = params[:vote][:votable_id].to_i
  unless Vote.find_by({user_id: current_user.id, votable_id: votable_id})
    current_user.votes << Vote.new(params[:vote])
    redirect '/'
  end
  redirect '/'
end
