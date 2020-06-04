class ProgrammingLanguage < ApplicationRecord
    has_many :developer_programming_languages
    has_many :developers, through: :developer_programming_languages

    def self.programminglanguagewithdev(object)
        object.programming_languages.pluck(:name).join(", ")
    end
end