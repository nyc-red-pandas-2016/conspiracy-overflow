elizabeth = User.create({name: "Elizabeth", email: "ejlefever@gmail.com", password: "password"})
dave = User.create({name: "Dave", email: "dave@gmail.com", password: "password"})
wolfgang = User.create({name: "Wolfgang", email: "wolf@gang.com", password: "password"})
amir = User.create({name: "Amir", email: "amir@amir.amir", password: "password"})


q = Question.new({title: "Help", body: "Where am I?"})
q.title.downcase!
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

q = Question.new({title: "Do you think roller skates?", body: "I sometimes think roller skates, but not all the time."})
q.title.downcase!
q.tags << Tag.new({name: "yaknow"})
q.tags << Tag.new({name: "rollerbladeorskates?"})
elizabeth.questions << q
q.answers << Answer.new({user_id: 4, body: "I always think that."})
q.comments << Comment.new({user_id: 2, body: "I don't even know where I am"})

q = Question.new({title: "Why?", body: "Really tho."})
q.title.downcase!
dave.questions << q
a = Answer.new({user_id: 3, body: "Dave you're drunk"})
q.answers << a
a.comments << Comment.new({user_id: 2, body: "Wolfgang you're drunk too"})