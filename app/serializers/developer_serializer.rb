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
  attributes :id, :email, :languages, :developer_languages
  def languages
    languages = object.languages.pluck(:language_name).join(", ")
  end

  def developer_languages
    developer_languages = object.programming_languages.pluck(:name).join(", ")
  end
end
