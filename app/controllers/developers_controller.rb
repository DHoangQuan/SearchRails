class DevelopersController < ApplicationController
    require "csv"
    def index
        # byebug    
        @developers = SearchDeveloper.new(params).call
                                    .preload(:programming_languages, :languages)
        # byebug
        # if params[:programming_language].blank? && params[:language].blank? 
        #     @developers = Developer.all.includes(:languages, :programming_languages)
        #     # @te = (1..5).to_a.sort{ rand() - 0.5 }
        # elsif params[:programming_language].blank?
        #     @developers = Developer.list_languages(params[:language])
        # elsif params[:language].blank?
        #     @developers = Developer.list_programming_languages(params[:programming_language])
        # else
        #     # # first way
        #     @developers = Developer.list_prolan_lan(params[:language],params[:programming_language])
        #     # second way
        #     # list1 = Developer.list_languages(params[:lan])
        #     # list2 = Developer.list_programming_languages(params[:prolan])
        #     # @developers = list1.merge(list2)
        # end
        @@dev = @developers
        # render json: @developers
        # render json: DeveloperSerializer.new(@developers,include: [:languages, :programming_languages])
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
    def export_csv
        # byebug
        respond_to do |format|
            
            format.csv { send_data to_csv(@@dev), filename: "developers.csv"}
        end
    end
    
    private

    # def to_csv (developers)
    #     attributes = %w(id email programming_languages languages)
    #     CSV.generate(headers: true) do |csv|
    #         csv << attributes
    #         developers.each do |dev|

    #             csv << attributes.map {|attr| dev.send(attr)}
                
    #         end
    #     end
    # end

    def to_csv (developers)
        CSV.generate do |csv|
            csv << ["id", "email", "programming_languages", "languages"]
            developers.each do |dev|
                csv << [dev.id, dev.email, dev.get_programming_languages_list, dev.get_language_list]
            end
        end
    end
end