class LanguageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :language_name
  
  # has_many :developer_languages
  # has_many :developers, through: :developer_languages   

end