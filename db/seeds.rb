# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all
Tasking.delete_all
Message.delete_all
Messaging.delete_all

msgcontent = "<p>Thanks for taking to time to sign up with us!</p>"+
	"<p>Here at TaskApp we strive to help our users organize their personal calendars and their lives!</p>"+
	"<p>Congrats on becoming a member of the TaskApp community!</p>"+
	"<h4>Cheers!</h4>"+
	"<p>The TaskApp Team</p>"

a = User.create({name:"Reyes",email:"reyes@test.com",password:"reyes"})
b = User.create({name:"Xi",email:"xi@test.com",password:"xi"})
c = User.create({name:"Jackie",email:"jackie@test.com",password:"jackie"})
d = User.create({name:"Viki",email:"viki@test.com",password:"viki"})


e = Task.create({title:"task1",content:"it's a task",duedate:"today",location:"nyc"})
f = Task.create({title:"task2",content:"it's another task",duedate:"tomorrow",location:"brooklyn"})

Tasking.create(user:a,task:e)
Tasking.create(user:a,task:f)
Tasking.create(user:b,task:f)

g = Message.create({title:"Welcome to task manager",content: msgcontent})
h = Message.create({title:"hi",content:"how are you",attachment:"no attach",sender_id: 3})

Messaging.create(user:a,message:g);
Messaging.create(user:a,message:h);
Messaging.create(user:b,message:h);
Messaging.create(user:c,message:h);
Messaging.create(user:d,message:h);