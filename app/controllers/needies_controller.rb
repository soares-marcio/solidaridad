class NeediesController < ApplicationController

  def index
    @needy = Needy.new
    @needies = Needy.all
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def create
    @needy = Needy.new(needy_params)
    respond_to do |format|
      if @needy.save
        format.html { redirect_to root_path, notice: 'Needy was successfully created.' }
        format.json { render @needy, status: :created, location: root_path}
      else
        format.html { render :index }
        format.json { render json: @needy.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def needy_params
      params.require(:needy).permit(:name, :address, :description, :quantity_person)
    end
end
