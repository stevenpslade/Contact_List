## TODO: Implement CSV reading/writing
require 'csv'

# Gets listed contacts from contact.csv
def get_contact
  File.open("contact.csv").readlines.each do |line|
  puts line
  end
end

def set_contact(input)
  file = File.open("contact.csv", "a")
  file.puts input
  file.close 
end