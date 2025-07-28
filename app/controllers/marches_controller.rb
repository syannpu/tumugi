class MarchesController < ApplicationController
  def index
    @marches = Marche.includes(:user)
  end
end
