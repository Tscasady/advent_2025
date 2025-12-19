# task :day, [:num] do |task, args|
#   puts "day#{args.num}"
# end

task :new_day, [:num] => :day_file

file :day_file, [:num] do |t, args| 
  touch "day#{args.num}.rb"
end

