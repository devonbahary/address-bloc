# address_bloc.rb

require_relative 'controllers/menu_controller'


# create a controller instance
menu = MenuController.new

# clear the command line
system "clear"

puts "Welcome to AddressBloc!"

# display the menu
menu.main_menu