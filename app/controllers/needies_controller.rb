class NeediesController < ApplicationController

  def create
    @needy = Needy.new(needy_params)
    respond_to do |format|
      if @needy.save
        format.html { redirect_to root_url, notice: 'Needy was successfully created.' }
        format.json { render @needy, status: :created, location: root_url}
      else
        format.html { render root_url }
        format.json { render json: root_url, status: :unprocessable_entity }
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def needy_params
      params.require(:needy).permit(:name, :address, :description, :quantity_person)
    end
end
