# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@timetracker1.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

user1 = User.create!(name: 'user1', email: 'testuser1@tracker1.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
user2 = User.create!(name: 'user2', email: 'testuser2@tracker1.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

project1 = Project.create!(name: "DineOut Mobile App", desc: "Food Ordering System", planned_hours: 8, status: "In Progress", start_date: "2017-10-25 00:00:00", end_date: "2017-10-26 00:00:00") if Rails.env.development?
project2 = Project.create!(name: "BookAir", desc: "Travel Market Place", planned_hours: 12, status: "Closed", start_date: "2017-10-25 00:00:00", end_date: "2017-10-26 00:00:00") if Rails.env.development?

ProjectsUser.create!(project_id: project1.id, user_id: user1.id )  if Rails.env.development?
ProjectsUser.create!(project_id: project1.id, user_id: user2.id )  if Rails.env.development?
ProjectsUser.create!(project_id: project2.id, user_id: user1.id )  if Rails.env.development?