class Developer < ApplicationRecord
    has_many :developer_programming_languages
    has_many :developer_languages
    has_many :languages, through: :developer_languages   
    has_many :programming_languages, through: :developer_programming_languages

    def get_language_list
        self.languages.pluck(:language_name).join(", ")
    end
    
    def get_programming_languages_list
        self.programming_languages.map(&:name).join(", ")
    end

    # byebug
    # def self.list_languages(params_language)
    #     # arr_languages = params_language.scan(/\w+/)
    #     # joins(:languages).where(languages: { languagename: arrlan })
    #     arr_languages = params_language.downcase.gsub(/,/," ").split(/\s/)
    #     where("LOWER(languages.language_name) IN (?)", arr_languages)
        
    # end

    # def self.list_programming_languages(params_programming_language)
    #     # arr_programming_language = params_programming_language.scan(/\w+/) 
    #     arr_programming_language = params_programming_language.downcase.gsub(/,/," ").split(/\s/)
    #     where("LOWER(programming_languages.name) IN (?)", arr_programming_language)
    # end 

    def self.list_prolan_lan(params_language, params_programming_language) 
        arr_languages = params_language.downcase.gsub(/,/," ").split(/\s/)
        arr_programming_languages = params_programming_language.downcase.gsub(/,/," ").split(/\s/)
        joins(:languages, :programming_languages).where("LOWER(languages.language_name) IN (?) AND LOWER(programming_languages.name) IN (?)", arr_languages, arr_programming_languages)
        # joins(:languages, :programming_languages).where(languages: { languagename: arrlan }, programming_languages: { name: arrprolan })
    end
    #first query
    # Developer.joins(:developer_languages).where(:developer_languages => {:language_id => [1,3]})

    #short query
    # Developer.joins(:languages, :programming_languages).where(languages: { id: lan_ids }, programming_languages: { id: pro_lan_ids })
    
    
    
end