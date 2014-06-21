require 'unicode'
require 'colorize'

Dir.glob("**/*").each do |entryname|
  next if File.directory? entryname
  if entryname =~ /\.png$/i
    system "convert #{entryname} -depth 2 #{entryname}"
    puts "#{entryname.to_s.yellow} - converted"
  elsif entryname =~ /\.jpe?g$/i
    system "convert #{entryname} -quality 1 #{entryname}"
    puts "#{entryname.to_s.green} - converted"
  end
end
