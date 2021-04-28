module Api
  module V1
    class SearchController < ApplicationController
      def show
        render json: SupplementSerializer.new(Supplement.related_supplements(params['keyword']))
      end
    end
  end
end
