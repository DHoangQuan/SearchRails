module Api
    module V1
        class DevelopersController < ApplicationController
            def index
                @developers = 
                 SearchDeveloper.new(params).call.preload(:programming_languages, :languages)
                # @developers = Developer.all
                # options = {:include => [:languages]}
                #  byebug
                
                # old serialize
                # render json: @developers
                
                render json: DeveloperSerializer.new(@developers,include: [:languages, :programming_languages]).serialized_json
            
            end
        end
    end
end