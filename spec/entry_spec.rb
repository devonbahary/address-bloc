# entry_spec.rb

require_relative '../models/entry'

RSpec.describe Entry do
  
  # initializer tests
  describe "attributes" do
    # D.R.Y.
    # => prevents us from repeating 'entry = Entry.new(...)' for each test
    let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') }
    
    
    # 'it' => test #1
    it "responds to name" do 
      expect(entry).to respond_to(:name)
    end
    
    it "reports its name" do
      expect(entry.name).to eq('Ada Lovelace')
    end
    
    # 'it' => test #2
    it "responds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end
    
    it "reports its phone number" do
      expect(entry.phone_number).to eq('010.012.1815')
    end
    
    # 'it' => test #3
    it "responds to email" do
      expect(entry).to respond_to(:email)
    end
    
    it "reports its email" do
      expect(entry.email).to eq('augusta.king@lovelace.com')
    end
    
  end
  
  # Entry string conversion test
  describe "#to_s" do 
    it "prints an entry as a string" do
      entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
      expect(entry.to_s).to eq(expected_string)
    end
  end
  
end    