module Api
    module V1
        class DevelopersController < ApplicationController
            def index
                # .paginate(page: params[:page], per_page: 10)
                @developers = SearchDeveloper.new(params).call.preload(:programming_languages, :languages).paginate(page: params[:page], per_page: 10)
                #  byebug
                options = {}
                options[:meta] = { 
                    # total: 2
                    current_page: @developers.current_page,
                    total_pages: @developers.total_pages,
                    total_count: @developers.count # use collection.total_entries when using will_paginate
                    }
                options[:include] = [:languages, :programming_languages]
                render json: DeveloperSerializer.new(@developers, options).serialized_json
    
            end

            def show
                begin
                # byebug
                @developer = Developer.find(params[:id])
                render json: DeveloperSerializer.new(@developer,include: [:languages, :programming_languages])
                # rescue ActiveRecord::RecordNotFound => e
                rescue StandardError, AnotherError => e
                # rescue TypeError, NameError => e
                    title = "Not Found"
                    render_error(404, title, e) and return
                end
            end

            def create
                arr_id_languages = developer_languages_params.dig(:relationships, :languages, :data)
                arr_id_programming_languages = developer_programming_languages_params.dig(:relationships, :programming_languages, :data)
                developer = Developer.new(developer_params)
                ActiveRecord::Base.transaction do
                    developer.save
                    
                    arr_id_languages.each do |id|    
                        # byebug    
                        language = Language.find(id.values[0].to_i)
                        developer.languages << language
                        # raise ActiveRecord::RecordInvalid if language.nil?
                    end

                    arr_id_programming_languages.each do |id|
                        programming_language = ProgrammingLanguage.find(id.values[0].to_i)
                        developer.programming_languages << programming_language
                        # raise ActiveRecord::RecordInvalid if programming_language.nil?
                    end
                end
                render json: {
                        success: true,
                        data: DeveloperSerializer.new(developer)
                    }
            rescue ActiveRecord::RecordInvalid => e
            render_error(404, "NotFound", e) and return
            end

            

            private
            def developer_params
                params.require(:data).permit(:attributes => [:email])
            end

            def developer_languages_params
                params.require(:data).permit(:relationships => [:languages => [:data => [:id]]])
            end
            
            def developer_programming_languages_params
                params.require(:data).permit(:relationships => [:programming_languages => [:data => [:id]]])
            end

        end
    end
end