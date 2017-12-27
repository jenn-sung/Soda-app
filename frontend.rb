require 'Unirest'
require 'pp'

p "Welcome to my soda shop!"
p "Choose an option!"

p "[1] See all of my sodas!"
p "[2] See a particular soda"
p "[3] Create a soda option"
p "[4] Update a soda option"

user_input = gets.chomp

if user_input == '1'
  p "See all of my sodas!"
  response = Unirest.get("localhost:3000/v1/sodas")
  sodas = response.body
elsif user_input == '2'
  p "Enter the id of soda you would like to see"
  soda_id = gets.chomp
  response = Unirest.get("localhost:3000/v1/sodas/#{soda_id}")
  pp response.body 
elsif user_input == '3'
  the_params = {}
  p "Enter the name"
  the_params[:name] = gets.chomp
  p "Enter the flavor"
  the_params[:flavor] = gets.chomp
  p "Enter true if it's carbonated or false if it's not"
  the_params[:carbonated] = gets.chomp
  p "Enter the price"
  the_params[:price] = gets.chomp
  response = Unirest.post("localhost:3000/v1/sodas", parameters: the_params)
  pp response.body
elsif user_input == '4'
  the_params = {}
  p "Enter the id of the soda you want to update"
  soda_id = gets.chomp
  p "Enter the name of the soda"
  the_params[:name] = gets.chomp
  p "Enter the flavor of the soda"
  the_params[:flavor] = gets.chomp
  p "Enter true if it's carbonated or false if it's not"
  the_params[:carbonated] = gets.chomp
  p "Enter the price of the soda"
  the_params[:price] = gets.chomp
  response = Unirest.patch("localhost:3000/v1/sodas/#{soda_id}", parameters: the_params)
  pp response.body
end