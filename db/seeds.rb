elizabeth = User.create({name: "Elizabeth", email: "ejlefever@gmail.com", password: "password"})
dave = User.create({name: "Dave", email: "dave@gmail.com", password: "password"})
wolfgang = User.create({name: "Wolfgang", email: "wolf@gang.com", password: "password"})
amir = User.create({name: "Amir", email: "amir@amir.amir", password: "password"})


q = Question.new({title: "Help", body: "Where am I?"})
q.tags << Tag.new({name: "help"})
q.tags << Tag.new({name: "confused"})
q.tags << Tag.new({name: "tequila"})
q.tags << Tag.new({name: "whoami"})
elizabeth.questions << q
q.votes << Vote.new({user_id: 1})
q.votes << Vote.new({user_id: 4})

a = Answer.new({user_id: 2, body: "Where are any of us?"})
q.answers << a
a.votes << Vote.new({user_id: 2})
a.votes << Vote.new({user_id: 3})

c = Comment.new({user_id: 3, body: "I don't even know where I am"})
q.comments << c
a.comments << Comment.new({user_id: 4, body: "I am at home."})

c.votes << Vote.new({user_id: 1})


