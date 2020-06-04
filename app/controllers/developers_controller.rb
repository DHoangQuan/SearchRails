class DevelopersController < ApplicationController
    def index
        if params[:programming_language].blank? && params[:language].blank? 
            @developers = Developer.all.includes(:languages, :programming_languages)
            # @te = (1..5).to_a.sort{ rand() - 0.5 }
        elsif params[:programming_language].blank?
            @developers = Developer.list_languages(params[:language])
        elsif params[:language].blank?
            @developers = Developer.list_programming_languages(params[:programming_language])
        else
            # # first way
            @developers = Developer.list_prolan_lan(params[:language],params[:programming_language])
            # second way
            # list1 = Developer.list_languages(params[:lan])
            # list2 = Developer.list_programming_languages(params[:prolan])
            # @developers = list1.merge(list2)
        end
        
        # render json: @developers
        
        respond_to do |format|
            format.html
        end
        
        # @developers_temp = []
        # @developers.each do |developer|
        #     # @languages = Language.languagewithdev(developer)
        #     # @programming_languages = ProgrammingLanguage.programminglanguagewithdev(developer)

        #     @developers_temp << {:developer => developer, :progrmming_languages =>ProgrammingLanguage.programminglanguagewithdev(developer), :languages => Language.languagewithdev(developer)}
        # end
        # render json: @developers_temp
        
        
    end
end