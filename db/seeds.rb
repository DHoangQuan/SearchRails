# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dev_1 = Developer.create!(email: "khoa@gmail.com")
lan_1 = Language.create!(languagename: "Japan")

pro_1 = ProgrammingLanguage.create!(name: "ruby")

dev_2 = Developer.create!(email: "quan@gmail.com")
lan_2 = Language.create!(languagename: "English")
pro_2 = ProgrammingLanguage.create!(name: "C#")

pro_3 = ProgrammingLanguage.create!(name: "Python")
pro_4 = ProgrammingLanguage.create!(name: "Java")

DeveloperProgrammingLanguage.create!(developer_id: dev_1.id, programming_language_id: pro_1.id)
DeveloperProgrammingLanguage.create!(developer_id: dev_1.id, programming_language_id: pro_2.id)
DeveloperProgrammingLanguage.create!(developer_id: dev_2.id, programming_language_id: pro_4.id)
DeveloperProgrammingLanguage.create!(developer_id: dev_2.id, programming_language_id: pro_3.id)

DeveloperLanguage.create!(developer_id: dev_1.id,language_id: lan_1.id)
DeveloperLanguage.create!(developer_id: dev_1.id,language_id: lan_2.id)
DeveloperLanguage.create!(developer_id: dev_2.id,language_id: lan_1.id)
DeveloperLanguage.create!(developer_id: dev_2.id,language_id: lan_2.id)

# d1 = Developer.create!(email: 'nguyenvanhoang@gmail.com')
# ProgrammingLanguage.create!(name: 'Ruby')
# ProgrammingLanguage.create!(name: 'Java')
# ProgrammingLanguage.create!(name: 'PHP')
# ProgrammingLanguage.create!(name: 'Go')

# ids = ProgrammingLanguage.all.ids

# Language.create!(languagename: 'EN')
# Language.create!(languagename: 'VN')
# Language.create!(languagename: 'JP')
# Language.create!(languagename: 'KR')
# l_ids = Language.all.ids
# DeveloperProgrammingLanguage.create!(developer_id: d1.id, programming_language_id: ids)
# DeveloperLanguage.create!(language_id: l_ids, developer_id: d1.id) 