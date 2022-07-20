# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do
#   user=User.create(name: Faker::Name.name,email: Faker::Internet.email)
#   5.times do
#     user.books.create(title: Faker::Book.title, author: Faker::Book.author)
#   end
# end


['IEK','EKF','Schneider Electric','Siemens'].each do |manuf|
  [6,10,16,20,25,32,40,63].each do |current|
    [1,2,3].each do |phases|
      ['B','C','D'].each do |char|
        article="5SL6#{phases}#{current}6" if manuf== 'Siemens' && char=='B'
        article="5SL6#{phases}#{current}7" if manuf== 'Siemens' && char=='C'
        article="5SL6#{phases}#{current}8" if manuf== 'Siemens' && char=='D'
        article="MVA20-#{phases}-0#{current}-#{char}"  if manuf== 'IEK' 
        article="mcb4729-#{phases}-#{current}#{char}"  if manuf== 'EKF'
        article="EZ9F14#{phases}#{current}"  if manuf== 'Schneider Electric' && char=='B'
        article="EZ9F34#{phases}#{current}"  if manuf== 'Schneider Electric' && char=='C'
        article="EZ9F86#{phases}#{current}"  if manuf== 'Schneider Electric' && char=='D'
        AutomaticBreaker.create(phases: phases,nominal_current: current,
        characteristic: char,manufacturer: manuf,article_number:article )
      end
    end
  end
end

