class Developer < ApplicationRecord
    has_many :developer_programming_languages
    has_many :developer_languages
    has_many :languages, through: :developer_languages   
    
    has_many :programming_languages, through: :developer_programming_languages
    

    # def self.getiddev
    #     @getdeveloper = Developer.select(:id)
    #     @getlanguage = Developer.find(@getdeveloper).languages.pluck(:languagename).join(", ")
    #     @getprogramming = Developer.find(@getdeveloper).programming_languages.pluck(:name).join(", ")
    # end
    
end