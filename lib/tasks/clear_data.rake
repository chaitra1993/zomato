task :clear_data => :environment do 
	Role.delete_all
	User.delete_all
	Permission.delete_all
	Restaurant.delete_all
end