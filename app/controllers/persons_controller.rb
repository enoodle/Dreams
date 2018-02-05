class PersonsController < ApplicationController
  before_action :authenticate_user!

  def export
  end
end
