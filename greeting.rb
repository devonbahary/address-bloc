# greeting.rb

ARGV.each_with_index do |arg, index|
  next if index == 0
  puts "#{ARGV[0]} #{arg}"
end