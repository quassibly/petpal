class PagesController < ApplicationController

  def home
    @pets = Pet.first(3)
  end
end
