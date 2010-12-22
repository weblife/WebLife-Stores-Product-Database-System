task :mig do
  puts 'rake db:migrate RAILS_ENV="development"'
  system "rake db:migrate RAILS_ENV='development'"
  puts "rake db:test:clone"
  system "rake db:test:clone"
  puts "annotate -p before"
  system "annotate -p before"
end
