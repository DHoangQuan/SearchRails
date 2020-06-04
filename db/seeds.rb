# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProgrammingLanguage.create!(name: "Ruby")
ProgrammingLanguage.create!(name: "C#")
ProgrammingLanguage.create!(name: "Python")
ProgrammingLanguage.create!(name: "Java")
ProgrammingLanguage.create!(name: "Golang")
ProgrammingLanguage.create!(name: "COBOL")
ProgrammingLanguage.create!(name: "Perl")
ProgrammingLanguage.create!(name: "Swift")

Language.create!(language_name: "Japan")
Language.create!(language_name: "English")
Language.create!(language_name: "French")
Language.create!(language_name: "Spanish")
Language.create!(language_name: "Dutch")
Language.create!(language_name: "Indian")
    100.times do       
        dev = Developer.create(email: Faker::Internet.email)
        array_id_programming_languages = [1,2,3,4,5,6,7,8]
        array_id_languages  = [1,2,3,4,5,6]
        x = rand(1..6)
        ap = array_id_programming_languages.sample(x)
        y = rand(1..4)
        al = array_id_languages.sample(y)
        ap.each do |id|
            DeveloperProgrammingLanguage.create!(developer_id: dev.id, programming_language_id: ProgrammingLanguage.find(id).id)
        end
        al.each do |ii|            
            DeveloperLanguage.create!(developer_id: dev.id,language_id: Language.find(ii).id)
        end
    end