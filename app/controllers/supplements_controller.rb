class SupplementsController < ApplicationController
  def index
    @all_supplements = Supplement.order(:title)
  end

  def show
    @supp = Supplement.find_by(id: params['id'].to_i)
  end

  def search
    @related_supplements = Supplement.related_supplements(params['id'], params['keyword'])
  end
end
