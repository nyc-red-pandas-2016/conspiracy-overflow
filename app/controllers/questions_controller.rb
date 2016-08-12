get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    redirect '/users/login'
  end
end

get '/tags/questions/:tag' do
  @questions = Tag.find(params[:tag]).questions
  erb :'index'
end

post '/questions' do
  q = Question.new(params[:question])
  q.title.downcase!
  tags = params[:tags].split(" ")
  tags.each do |t|
    if Tag.find_by(name: t)
      q.tags << Tag.find_by(name: t)
    else
      q.tags << Tag.new({name: t})
    end
  end
  current_user.questions << q
  redirect "/questions/" + q.id.to_s
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @author = User.find(@question.user_id)
  @answers = @question.answers
  if @question.best_answer_id
    answers_array = @answers.to_a
    best_answer = answers_array.select { |a| a.id == @question.best_answer_id }[0]
    answers_array.delete(best_answer)
    answers_array.unshift(best_answer)
    @answers = answers_array
  end
  erb :'questions/index'
end

post '/questions/best-answer' do
  a = Answer.find(params[:answerid])
  q = a.question
  q.best_answer_id = params[:answerid]
  q.save
  redirect "/questions/" + q.id.to_s
end
