module Api
    module V1
        class DevelopersController < ApplicationController
            def index
                @developers = 
                 SearchDeveloper.new(params).call.preload(:programming_languages, :languages)
                #  byebug
                render json: @developers
            end
        end
    end
end