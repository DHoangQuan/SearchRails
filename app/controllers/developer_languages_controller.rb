class DeveloperLanguagesController < ApplicationController
    def index
        # @developerlanguages = DeveloperLanguage.searchdevwithlanguage(params[:lan])
        # @getdeveloper = Developer.select(:id)
        @developers = Developer.all
        respond_to do |format|
            format.html {  }
        end
    end

    # private
    # def dev_params
    #     params.require(:developerlanguage).permit(:languagename, :developer_id, :lan)
    # end
end