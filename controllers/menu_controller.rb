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
    puts "[6 - Delete all entries]"
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
      when 6 # Delete all entries
        system "clear"
        detonate
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
    print "Search by name: "
    name = gets.chomp
    
    match = address_book.binary_search(name)
    system "clear"
    
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end
  
  def read_csv
    print "Enter CSV file to import: "
    file_name = gets.chomp
    
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end
    
    begin
      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
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
        delete_entry(entry)
      when 'e'
        edit_entry(entry)
        entry_submenu(entry)
      when 'm'
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
    end
  end
  
  def delete_entry(entry)
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end
  
  def edit_entry(entry)
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
    
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
    
    puts "Updated entry:"
    puts entry
  end
  
  def search_submenu(entry)
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    
    selection = gets.chomp
    
    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end
  
  def detonate
    address_book.entries.clear
    puts "All entries removed"
  end
  
end