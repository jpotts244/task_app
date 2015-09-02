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
h = Message.create({title:"Hello,",content:"how are you",attachment:"no attach",sender_id: c.id})
m1 = Message.create({title:"Hi",content:"I hope you are well. I just shared the below task with you, If you have any further question, please let me know.",attachment:"no attach",sender_id: d.id})
m2 = Message.create({title:"Good Morning",content:"How are you? Can we talk later on to discuss how we are going to organize this. Many thanks.",attachment:"no attach",sender_id: d.id})
m3 = Message.create({title:"Ahoj",content:"Can you make sure this task is completed on time?",attachment:"no attach",sender_id: a.id})
m4 = Message.create({title:"Welcome,",content:"I hope you are well. Here are the list of outstanding tasks we have to complete. Let me know if you have any question.",attachment:"no attach",sender_id: b.id})
m5 = Message.create({title:"Hi,",content:"Do You have any suggestion how should we approach this?",attachment:"no attach",sender_id: c.id})

Messaging.create(user:a,message:g);
Messaging.create(user:a,message:h);
Messaging.create(user:b,message:h);
Messaging.create(user:c,message:h);
Messaging.create(user:d,message:h);
Messaging.create(user:a,message:m1);
Messaging.create(user:b,message:m2);
Messaging.create(user:c,message:m3);
Messaging.create(user:d,message:m4);
Messaging.create(user:b,message:m5);