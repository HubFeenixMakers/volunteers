class KantaController < ApplicationController

  def show
    @image = Merged::Image.first
  end

end
