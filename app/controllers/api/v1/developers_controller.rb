module Api
    module V1
        class DevelopersController < ApplicationController
            def index
                @developers = 
                 SearchDeveloper.new(params).call.preload(:programming_languages, :languages)
                #  byebug
                
                # old serialize
                # render json: @developers

                render json: DeveloperSerializer.new(Developer.all).serializable_hash
            end
        end
    end
end