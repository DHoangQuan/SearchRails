module Api
    module V1
        class DevelopersController < ApplicationController
            before_action :authenticate_user!
            def index
                # byebug
                @developers = SearchDeveloper.new(search_params).call.preload(:programming_languages, :languages).paginate(page: params[:page], per_page: 10)
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
                if current_user.is_admin?
                    arr_id_languages = developer_languages_params.dig(:relationships, :languages, :data).pluck(:id)
                    arr_id_programming_languages = developer_programming_languages_params.dig(:relationships, :programming_languages, :data).pluck(:id)
                    
                    developer = Developer.new(developer_params)
                    ActiveRecord::Base.transaction do
                        developer.save

                        languages = Language.where(id: arr_id_languages)
                        developer.languages << languages

                        programming_languages = ProgrammingLanguage.where(id: arr_id_programming_languages)
                        developer.programming_languages << programming_languages

                    end

                    # for test multiple developer
                    # developer_params.each do |p|
                    #     developer = Developer.new(p.permit(:attributes => [:email]))
                    #     developer.save
                    #     end
                    render json: DeveloperSerializer.new(developer)
                        
                else
                    render_error(403, "FORBIDDEN", "The server understood the request but refuses to authorize it.")
                end
            rescue ActiveRecord::RecordInvalid => e
                render_error(404, "NotFound", e) and return
            end

            

            private
            # def set_user
            #     # byebug
            #     uid        = request.headers['uid']
            #     @token     = request.headers['access-token']
            #     @client_id = request.headers['client']
            #     @User = User.find_by_uid(uid)
                
            # end

            def search_params
                if params.blank?
                params.require(:filter).permit(:languages, :programming_languages)
                else
                    params
                end
            end

            def developer_params
                params.require(:data).permit(:attributes => [:email])
                # params.dig(:data).pluck(:attributes)
                # params.require(:data)
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