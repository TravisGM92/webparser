module Api
  module V1
    class CategoriesController < ApplicationController
      def index
        render json: CategorySerializer.new(Category.all)
      end
    end
  end
end
