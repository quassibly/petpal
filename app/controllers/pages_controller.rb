class PagesController < ApplicationController

  def home
    @pets = Pet.first(8)
  end
end
