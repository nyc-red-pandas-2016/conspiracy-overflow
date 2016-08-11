get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    redirect '/users/login'
  end
end

post '/questions' do
  q = Question.new(params[:question])
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
  erb :'questions/index'
end
