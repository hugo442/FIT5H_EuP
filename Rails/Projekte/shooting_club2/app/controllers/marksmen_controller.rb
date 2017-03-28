class MarksmenController < ApplicationController
  before_action :set_marksman, only: [:show, :edit, :update, :destroy]

  # GET /marksmen
  # GET /marksmen.json
  def index
    @marksmen = Marksman.all
  end

  # GET /marksmen/1
  # GET /marksmen/1.json
  def show
  end

  # GET /marksmen/new
  def new
    @marksman = Marksman.new
  end

  # GET /marksmen/1/edit
  def edit
  end

  # POST /marksmen
  # POST /marksmen.json
  def create
    @marksman = Marksman.new(marksman_params)

    respond_to do |format|
      if @marksman.save
        format.html { redirect_to @marksman, notice: 'Marksman was successfully created.' }
        format.json { render :show, status: :created, location: @marksman }
      else
        format.html { render :new }
        format.json { render json: @marksman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marksmen/1
  # PATCH/PUT /marksmen/1.json
  def update
    respond_to do |format|
      if @marksman.update(marksman_params)
        format.html { redirect_to @marksman, notice: 'Marksman was successfully updated.' }
        format.json { render :show, status: :ok, location: @marksman }
      else
        format.html { render :edit }
        format.json { render json: @marksman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marksmen/1
  # DELETE /marksmen/1.json
  def destroy
    @marksman.destroy
    respond_to do |format|
      format.html { redirect_to marksmen_url, notice: 'Marksman was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marksman
      @marksman = Marksman.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marksman_params
      params.require(:marksman).permit(:startnr, :firstname, :surname, :location)
    end
end
