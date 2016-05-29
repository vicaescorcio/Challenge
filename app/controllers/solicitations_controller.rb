class SolicitationsController < ApplicationController

	 before_action :logged_in_user, only: [:create, :destroy]


	 def create

	 	@solicitation = current_user.solicitations.build
    if @solicitation.save
      flash[:success] = "Solicitação criada!"
      redirect_to @current_user 
    else
      render 'static_pages/home'
    end
	 	end

	 def destroy
	 	   @solicitation = current_user.solicitations.find_by(id: params[:id])
     
	 
	 	 @solicitation.destroy
         flash[:success] = "Solicitação deletada"
         redirect_to @current_user
    
	 end

	
end
