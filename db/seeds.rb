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
q.tags << Tag.find_by(name: "tequila")
q.tags << Tag.new({name: "philosophy"})
q.title.downcase!
dave.questions << q
a = Answer.new({user_id: 3, body: "Dave you're drunk"})
q.answers << a
a.comments << Comment.new({user_id: 2, body: "Wolfgang you're drunk too"})

q = Question.new({title: "Tearin up my heart?", body: "It's tearin up my heart when I'm with you. But when we are apart, I feel it too. And no matter what I do I feel the same? I feel the pain?"})
q.title.downcase!
q.tags << Tag.find_by(name: "tequila")
q.tags << Tag.new({name: "backstreetsbackALRIGHT"})
elizabeth.questions << q
q.answers << Answer.new({user_id: 4, body: "I want it that way"})
q.comments << Comment.new({user_id: 2, body: "You are my fire"})
q.comments << Comment.new({user_id: 1, body: "My one desire"})
a = Answer.new({user_id: 4, body: "Dirty pop"})
q.answers << Answer.new({user_id: 1, body: "I don't care who you are. Where you been. Don't care what you did. As long as you love me"})
q.answers << Answer.new({user_id: 3, body: "Show me the meaning of being lonely."})
a = Answer.new({user_id: 2, body: "It's gonna be may"})
q.answers << a
a.comments << Comment.new({user_id: 2, body: "**me"})
a = Answer.new({user_id: 4, body: "Dirty pop"})
