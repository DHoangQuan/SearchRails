class SearchDeveloper
    ATTRIBUTES = {
        languages: :list_languages,
        programming_languages: :list_programming_languages
    }

    def initialize(params = {})
        @params = params
    end
    
    def call
        @devs = Developer.all.joins(:languages, :programming_languages)
        @params.except(:controller, :action).keys.each do |key|
            next if @params[key].blank?

            @devs = @devs.send(ATTRIBUTES[key.to_sym], @params[key])
        end
        
        @devs.distinct
    end
end