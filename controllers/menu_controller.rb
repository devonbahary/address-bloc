# menu_controller.rb

require_relative '../models/address_book'

class MenuController
  attr_reader :address_book
  
  def initialize
    @address_book = AddressBook.new
  end
  
  # Main Menu 
  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    puts "[6 - View Entry Number n]"
    print "Enter your selection: "
    
    selection = gets.to_i
    
    # selection processing and loop
    case selection
      when 1 # View all entries
        system "clear"
        view_all_entries
        main_menu
      when 2 # Create an entry
        system "clear"
        create_entry
        main_menu
      when 3 # Search for an entry
        system "clear"
        search_entries
        main_menu
      when 4 # Import entries from a CSV
        system "clear"
        read_csv
        main_menu
      when 5 # Exit
        puts "Good-bye!"
        exit(0) # '(0)' signals the program is exiting w/o error
      when 6 # View entry number 'n'
        system "clear"
        view_entry_n
        main_menu 
      else 
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end
  
  # view entries one-at-a-time w/'entry_submenu' processing
  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    
    system "clear"
    puts "End of entries"
  end
  
  # take in user input and 'add_entry' to 'address_book'
  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp
    
    address_book.add_entry(name, phone_number, email)
    
    system "clear"
    puts "New entry created"
  end
  
  def search_entries
  end
  
  def read_csv
  end
  
  def view_entry_n
    print "Enter entry number: "
    selection = gets.chomp
    
    if selection.to_i > 0 && selection.to_i <= address_book.entries.size
      system "clear"
      puts address_book.entries[selection.to_i - 1].to_s
      gets
      system "clear"
    else 
      puts "#{selection} is not a valid entry number"
      view_entry_n
    end
    
  end
  
  # 'view_all_entries' single entry processing
  def entry_submenu(entry)
    # submenu options
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    
    selection = gets.chomp
    
    case selection
      when 'n'
      when 'd'
      when 'e'
      when 'm'
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end

  
end