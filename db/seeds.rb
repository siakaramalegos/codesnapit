# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ----------------------------------------
# Clean Database
# ----------------------------------------
if Rails.env == 'development'
  puts 'Cleaning Database'
  puts
  Rake::Task['db:migrate:reset'].invoke
end

# ----------------------------------------
# Config
# ----------------------------------------

# Space for seed config


# ----------------------------------------
# Start Seeds
# ----------------------------------------
puts 'Seeding...'
puts


# ----------------------------------------
# Create SnapItLanguages
# ----------------------------------------
puts 'Creating SnapItLanguages'

Rake::Task['editor:seed:languages'].invoke


# ----------------------------------------
# Create SnapItThemes
# ----------------------------------------
puts 'Creating SnapItThemes'

Rake::Task['editor:seed:themes'].invoke


# ----------------------------------------
# Create Users
# ----------------------------------------
puts 'Creating Users'

3.times do |i|
  u = User.new(
    username: "Foobar",
    email: "test#{i}@example.com",
    password: "password")
  u.skip_confirmation!
  u.save!
end

p = User.find_by_email("test1@example.com").profile
p.full_name = "Dr Foo Bar"
p.website = "http://www.example.com"
p.bio = "Lorem ipsum dolor sit amet, consectetur adipisicing elit."
p.save!


# ----------------------------------------
# Create SnapItProxies
# ----------------------------------------
puts 'Creating SnapItProxies'

snap_it_proxies = []
1.times do
  snap_it_proxies << {
    :title => 'Hello',
    :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. At doloremque eius distinctio sequi repellendus fugiat accusamus sit in et quas, consequatur recusandae temporibus tempore qui labore, voluptates ex. Doloribus, blanditiis.',
    :body => 'var = "Hello World!"',
    :snap_it_language_id => SnapItLanguage.find_by_editor_name('javascript').id,
    :snap_it_theme_id => SnapItTheme.find_by_editor_name('monokai').id,
    :user_id => User.first.id
  }
end
SnapItProxy.create(snap_it_proxies)
snap_it_proxies = SnapItProxy.all


# ----------------------------------------
# Finish Seeds
# ----------------------------------------
puts
puts 'Done'












