# address_book.rb

require_relative 'entry'
require "csv"

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
  
  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end
  
  def binary_search(name)
    # establish initial lower/upper search boundaries
    lower = 0
    upper = entries.length - 1
    
    # loop through search
    while lower <= upper
      # define midpoint between current lower/upper search boundaries
      mid = (lower + upper) / 2
      mid_name = entries[mid].name
      
      # return if name is midpoint, but if..
      #   midpoint is higher than name..
      #     ..establish new upper boundary just below current midpoint
      #   midpoint is lower than name..
      #     ..establish new lower boundary just above current midpoint
      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end
    
    # return 'nil' if nothing found
    return nil
  end
  
  def iterative_search(name)
    # iterate through EACH entry until a match is found
    for entry in entries
      return entry if entry.name == name 
    end
    
    # return 'nil' if nothing found
    return nil
  end
  
end