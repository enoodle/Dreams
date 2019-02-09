class PersonsController < ApplicationController
  before_action :authenticate_user!

  def export
  end

  def verify_email
    render :json => { verified: Person.email_registered?(params[:email]) }
  end
end
