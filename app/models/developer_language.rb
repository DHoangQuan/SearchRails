class DeveloperLanguage < ApplicationRecord
    belongs_to :developer, optional: true
    belongs_to :language, optional: true
end