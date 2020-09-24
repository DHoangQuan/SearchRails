class SearchDeveloper
    ATTRIBUTES = {
        languages: :list_languages,
        programming_languages: :list_programming_languages
    }

    def initialize(params = {})
        @params = params
        @relation = Developer.joins(:programming_languages, :languages)
    end
    
    def call
        # @params.except(:controller, :action).keys.each do |key|
        @params.slice(:languages, :programming_languages).keys.each do |key|
            next if @params[key].blank?

            @relation = self.send(ATTRIBUTES[key.to_sym], @params[key], @relation)
        end
        
        @relation.distinct
    end

    private

    def list_languages(params_language, relation)
        # arr_languages = params_language.scan(/\w+/)
        # joins(:languages).where(languages: { languagename: arrlan })
        arr_languages = params_language.downcase.gsub(/,/," ").split(/\s/)
        relation.where("LOWER(languages.language_name) IN (?)", arr_languages)
        
    end

    def list_programming_languages(params_programming_language, relation)
        # arr_programming_language = params_programming_language.scan(/\w+/) 
        arr_programming_language = params_programming_language.downcase.gsub(/,/," ").split(/\s/)
        relation.where("LOWER(programming_languages.name) IN (?)", arr_programming_language)
    end 
end