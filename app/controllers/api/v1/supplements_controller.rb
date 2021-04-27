module Api
  module V1
    class SupplementsController < ApplicationController
      def index
        render json: SupplementSerializer.new(Supplement.all)
      end
    end
  end
end
