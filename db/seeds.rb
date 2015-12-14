# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  name: 'Admin',
  surname: 'Admin',
  email: 'admin@admin.com',
  cpf: '07644271481',
  phone1: '996-447-337',
  password: '1234Mudar',
  type: 'Admin'
)

User.create!(
  name: 'Admin',
  surname: 'Teste',
  email: 'romero.mfm@gmail.com',
  cpf: '07644271481',
  phone1: '996-447-337',
  # password: BCrypt::Password.create('123123'),
  password: '123123123',
  type: 'Admin'
)

Category.create!(
  name: "Inspiração",
  show_on_header: true
)

Category.create!(
  name: "Faça você mesmo",
  show_on_header: true
)
