class OrganizersController < ApplicationController
  def new
  	@organizer = Organizer.new
  end


end
