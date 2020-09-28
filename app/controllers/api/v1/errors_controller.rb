module Api
  module V1
      class DevelopersController < ApplicationController
        def render_404
          render: json: ErrorSerializer.serialize(404, "Not Found")
        end
      end
  end
end