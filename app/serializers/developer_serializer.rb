# old serialize
# class DeveloperSerializer < ActiveModel::Serializer
#   attributes :id, :email, :languages, :developer_languages
#   has_many :languages
#   has_many :developer_languages
#   def languages
#     languages = object.languages.pluck(:language_name).join(", ")
#   end
#   def developer_languages
#     developer_languages = object.programming_languages.pluck(:name).join(", ")
#   end
# end
class DeveloperSerializer
  include FastJsonapi::ObjectSerializer

  has_many :languages, through: :developer_languages
  has_many :programming_languages, through: :developer_programming_languages

  # has_and_belongs_to_many :languages
  # has_and_belongs_to_many :programming_languages
  attributes :id, :email
  
end
