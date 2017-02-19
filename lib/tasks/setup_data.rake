
task :setup_data => :environment do 
	
	Role.create(name: "admin")
	Role.create(name: "manager")
	Role.create(name: "user")

	
	user = User.create(email: "admin@gmail.com", password: "secret123")
	user.roles.push(Role.first) 
	user.roles.push(Role.last) 

	user1 = User.create(email: "manager@gmail.com", password: "secret123")
	user.roles.push(Role.second)
	user.roles.push(Role.last)

	user2 = User.create(email: "manager1@gmail.com", password: "secret123")
	user.roles.push(Role.second)
	user.roles.push(Role.last)


	user = User.create(email: "1@gmail.com", password: "secret123")
	user.roles.push(Role.last)

end

