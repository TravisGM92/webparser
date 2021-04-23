class SupplementsController < ApplicationController
  def index
    AllSupplements.create_supplements
    AllSupplements.attach_categories
    @all_supplements = Supplements.all
  end

  def test
    @supp = Supplement.find_by(id: params['id'].to_i)
  end
end
