get '/' do
  @questions = Question.all
  erb :"index"
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
