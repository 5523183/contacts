require File.dirname(__FILE__)+"/../lib/contacts"

login = ARGV[0]
password = ARGV[1]
client_id = ARGV[2]
client_secret = ARGV[3]

p Contacts::Gmail.new(login, password,{:client_id => client_id, :client_secret => client_secret}).contacts

