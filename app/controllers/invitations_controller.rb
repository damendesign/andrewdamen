class InvitationsController < ApplicationController

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      InvitationMailer.registration_confirmation(@invitation).deliver
      redirect_to '/thanks'
    else
      flash[:error] = "You already requested an invite."
      render 'new'
    end
  end

  def thanks
    
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  private

    def invitation_params
      params.require(:invitation).permit(:email)
    end
end
