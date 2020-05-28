class DeveloperLanguage < ApplicationRecord
    belongs_to :developer, optional: true
    belongs_to :language, optional: true
    
    def self.searchdevwithlanguage(lan)
        if lan
            dev_lan = Language.find_by(languagename: lan)
                if dev_lan
                    self.where(developer_id: dev_lan)
                else
                    @developrlanguages = DeveloperLanguage.all
                end
            else
                @developrlanguages = DeveloperLanguage.all
            end
        end

end