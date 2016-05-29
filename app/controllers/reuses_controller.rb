class ReusesController < ApplicationController


	def create
		 @reuse = current_user.reuses.build(reuses_params)
        if @reuse.save
            flash[:success] = "Aproveitamento enviado!"
            redirect_to @current_user
        else
      redirect_to @current_user
       end
	end


	def destroy

    @reuse = current_user.reuses.find_by(id: params[:id])
    @reuse.destroy
    flash[:success] = "Aproveitamento deletado!"
    redirect_to @current_user
	end
    
     def reuses_params
      params.require(:reuse).permit(:cod1, :cod2, :name1, :name2, :note)
    end
end
