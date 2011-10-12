require 'rubygems'
require 'mechanize'
require 'ruby-debug'
  
agent = Mechanize.new
page = agent.get('http://www.lugpol.pl/community.php')
nicks = page.search('span').map { |n| n.text }
nicks.each do |nick|
  puts "killing #{nick}"
  %x{./zablokuj_usera #{nick}}
end
