# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if (!User.find_by_email('admin@admin.com'))
  puts 'creating admin'
  User.create!(
    name: 'Admin',
    surname: 'Admin',
    email: 'admin@admin.com',
    cpf: '07644271481',
    phone1: '996-447-337',
    password: '1234Mudar',
    type: 'Admin'
  )
end

if (!Category.find_by_name('Inspiração'))
  puts 'creating category Inspiração'
  Category.create!(
    name: "Inspiração",
    show_on_header: true
  )
end

if (!Category.find_by_name('Faça você mesmo'))
  puts 'creating category Faça você mesmo'
  Category.create!(
    name: "Faça você mesmo",
    show_on_header: true
  )
end

if (!Preference.find_by_specific_id('global_prefs'))
  puts 'creating global_prefs'
  Preference.create!(
    specific_id: 'global_prefs',
    color_1: "#adc1da",
    color_2: "#bfcfe2",
    color_3: "#cedae9",
    color_4: "#d5dfec",
    color_5: "#d6e0ed",
    user_id: nil
  )
end
