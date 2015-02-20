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
    @email.domain = Domain.find(params[:domain_id])
    @email_saved = @email.save
  end

  # DELETE /emails/1
  def destroy
    @email_deleted = false
    # @email_deleted = @email.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:username, :quota, :password)
    end
end
