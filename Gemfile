source 'https://rubygems.org'

gem 'rake'

group :lint do
  gem 'rubocop'
  gem 'foodcritic'
end

group :unit, :integration do
  gem 'berkshelf'
end

group :unit do
  gem 'chefspec'
  gem 'rspec-expectations'
end

group :kitchen_common do
  gem 'test-kitchen'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant'
  gem 'vagrant-wrapper'
end
