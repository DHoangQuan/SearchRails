class DeveloperSerializer < ActiveModel::Serializer
  attributes :id, :email, :languages, :developer_languages
  has_many :languages
  has_many :developer_languages
  def languages
    languages = object.languages.pluck(:languagename).join(", ")
  end
  def developer_languages
    developer_languages = object.programming_languages.pluck(:name).join(", ")
  end
end
