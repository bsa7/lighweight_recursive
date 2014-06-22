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
  elsif entryname =~ /\.webp$/i
    system "dwebp -v #{entryname} -o tmpl.png"
    system "convert tmpl.png -depth 2 tmpl.png"
    system "cwebp -q -v 1 tmpl.png -o #{entryname}"
    puts "#{entryname.to_s.cyan} - converted"
  end
end
