class PagesController < ApplicationController

  def home
    @pets = Pet.first(4)
  end
end
