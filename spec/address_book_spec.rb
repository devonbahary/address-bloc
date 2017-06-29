#address_book_spec.rb

require_relative '../models/address_book'

RSpec.describe AddressBook do
  
  # initializer tests
  describe "attributes" do 
    
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
    
    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end
    
    it "initializes entries as empty" do 
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
    
  end
  
  # 'add_entry'
  describe "#add_entry" do
    
    it "adds only one entry to the address book" do 
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      
      expect(book.entries.size).to eq(1)
    end
    
    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]
      
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
    
  end
  
  
  # 'remove_entry'
  describe '#remove_entry' do 
    
    it "removes only one entry from the address book" do 
      # create an AddressBook of entries size 1
      book = AddressBook.new 
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      
      # confirm 'remove_entry' removes 1 entry
      expect(book.entries.size).to eq(0)
    end
  end
  
end