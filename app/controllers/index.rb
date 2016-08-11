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
  @comment.save
  # binding.pry
  if request.xhr?
    erb :'/questions/_comment', locals:{c: @comment}, layout: false
  else
    redirect "/questions/#{params[:question_id]}"
  end
end

post '/answers' do
  @answer = Answer.new(params[:answer])
  @answer.user_id = session[:user_id]
  @answer.save
  # binding.pry
  if request.xhr?
    erb :'/questions/_answer', locals:{a: @answer}, layout: false
  else
    redirect "/questions/#{params[:answer][:question_id]}"
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
