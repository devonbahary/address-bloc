# address_book.rb

require_relative 'entry'

class AddressBook
  attr_accessor :entries
  
  def initialize
    @entries = []
  end
  
  def add_entry(name, phone_number, email)
    # find proper index for entry (sorted by name, lexicographically)
    index = 0
    entries.each do |entry| 
      if name < entry.name 
        break
      end
      index += 1
    end
    # add entry in proper position
    entries.insert(index, Entry.new(name, phone_number, email))
  end
  
end