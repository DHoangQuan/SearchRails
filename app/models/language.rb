class Language < ApplicationRecord
    has_many :developer_languages
    has_many :developers, through: :developer_languages   


    def self.language_with_dev(object)
        object.languages.pluck(:language_name).join(", ")  
    end
end