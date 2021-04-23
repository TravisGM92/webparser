class SupplementsController < ApplicationController
  def index
    @all_supplements = Supplement.all
  end

  def test
    @supp = Supplement.find_by(id: params['id'].to_i)
  end
end
