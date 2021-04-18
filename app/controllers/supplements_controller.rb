class SupplementsController < ApplicationController
  def index
    @creatine = Supplement.first
  end

  def test
    @supp = Supplement.find_by(id: params['id'].to_i)
  end
end
