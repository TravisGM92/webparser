module Api
  module V1
    class SupplementsController < ApplicationController
      def index
        render json: SupplementSerializer.new(Supplement.all)
      end

      def show
        render json: SupplementSerializer.new(Supplement.find(params[:id]))
      end
    end
  end
end
