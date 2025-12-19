# task :day, [:num] do |task, args|
#   puts "day#{args.num}"
# end
require "dotenv/load"

task :new_day, [:num] => [:day_file, :fetch_data]

file :day_file, [:num] do |t, args|
  touch "day#{args.num}.rb"
end

task :fetch_data do |t, args| 
  puts ENV["url"]
  sh %(curl -sSL -H "Cookie: session=#{ENV['session_cookie']}" #{ENV['url']}#{args.num}/input -o day#{args.num}_input.txt)
end
