class PlusController < ApplicationController
  def index
    @Pluses = Plus.all
  end
end
