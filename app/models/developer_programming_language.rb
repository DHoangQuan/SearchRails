class DeveloperProgrammingLanguage < ApplicationRecord
    belongs_to :developer , optional: true
    belongs_to :programming_language, optional: true
end