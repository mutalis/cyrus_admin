class EmailsController < ApplicationController
  before_action :set_email, only: [:update, :destroy]
  
  # GET /emails
  def index
    @domain = Domain.find(params[:domain_id])
    @emails = @domain.emails if @domain
  end

  # POST /emails
  def create
    @email = Email.new(email_params)
    domain = Domain.find(params[:domain_id])
    if domain
      @email.domain = domain
      @email.username = params[:email][:username] + '@' + domain.name
      @email_saved = @email.save
    else
      @email_saved = false
    end
  end

  # DELETE /emails/1
  def destroy
    @email_deleted = @email.destroy
  end

  # Checks if an email address is available.
  # If it's available the method returns true in Json format.
  def check_email
    email_address = params[:email][:username] + params[:domain]
    email_available = true
    email_available = false if Email.find_by username: email_address

    respond_to do |format|
      format.json { render :json => email_available }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:quota, :password)
    end
end
