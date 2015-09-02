# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Task.delete_all
Message.delete_all
Messaging.delete_all

a = User.create({name:"Reyes",email:"reyes@test.com",password:"reyes"})
b = User.create({name:"Xi",email:"xi@test.com",password:"xi"})
c = User.create({name:"Jackie",email:"jackie@test.com",password:"jackie"})
d = User.create({name:"Viki",email:"viki@test.com",password:"viki"})


e = Task.create({title:"task1",content:"it's a task",duedate:"today",location:"nyc"})
f = Task.create({title:"task2",content:"it's another task",duedate:"tomorrow",location:"brooklyn"})
taskone = Task.create({title:"Go Food",content:"it's another task",duedate:"tomorrow",location:"brooklyn"})



Tasking.create(user:a,task:e)
Tasking.create(user:a,task:f)
Tasking.create(user:b,task:f)


g = Message.create({title:"hi",content:"how are you",attachment:"no attach",sender_id: 3})
h = Message.create({title:"Welcome to task manager",content:"Hi, feel free to explore the website.",attachment:"no attach"})


Messaging.create(user:a,message:g);
Messaging.create(user:a,message:h);
Messaging.create(user:b,message:h);
Messaging.create(user:c,message:h);
Messaging.create(user:d,message:h);