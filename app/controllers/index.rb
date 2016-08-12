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
  if request.xhr?
    params[:vote][:user_id] = current_user.id
    votable = nil
    if params[:vote][:votable_type] == "Question"
      votable = Question.find(params[:vote][:votable_id])
    elsif params[:vote][:votable_type] == "Answer"
      votable = Answer.find(params[:vote][:votable_id])
    elsif params[:vote][:votable_type] == "Comment"
      votable = Comment.find(params[:vote][:votable_id])
    end
    if Vote.find_by(params[:vote])
      "already voted"
    else
      current_user.votes << Vote.new(params[:vote])
      votable.votes.length
    end
  end
end
