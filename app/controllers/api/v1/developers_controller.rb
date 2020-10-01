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
                # byebug
                developer = Developer.new(developer_params)
                if developer.save
                    render json: {
                        success: true,
                        data: DeveloperSerializer.new(developer)
                    }
                else
                
                    render_error(404, "title", "e") and return
                end
            end


            private
            def developer_params
                # byebug
                # params.require(:developer).permit(:data => [:attributes])
                params.require(:data).permit(:attributes => [:email])
            end

            

        end
    end
end