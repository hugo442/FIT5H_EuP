class IterationsController < ApplicationController
  before_action :set_iteration, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  # GET /iterations
  # GET /iterations.json
  def index
    @iterations = @project.iterations
  end

  # GET /iterations/1
  # GET /iterations/1.json
  def show
  end

  # GET /iterations/new
  def new
    @iteration = @project.iterations.new
  end

  # GET /iterations/1/edit
  def edit
  end

  # POST /iterations
  # POST /iterations.json
  def create
    @iteration = @project.iterations.new(iteration_params)

    respond_to do |format|
      if @iteration.save
        format.html { redirect_to project_iteration_path(@project.id, @iteration.id), notice: 'Iteration was successfully created.' }
        format.json { render :show, status: :created, location: @iteration }
      else
        format.html { render :new }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iterations/1
  # PATCH/PUT /iterations/1.json
  def update
    respond_to do |format|
      if @iteration.update(iteration_params)
        format.html { redirect_to project_iteration_path(@project.id, @iteration.id), notice: 'Iteration was successfully updated.' }
        format.json { render :show, status: :ok, location: @iteration }
      else
        format.html { render :edit }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.json
  def destroy
    @iteration.destroy
    respond_to do |format|
      format.html { redirect_to project_iterations_url(@project.id), notice: 'Iteration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iteration
      @iteration = Iteration.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iteration_params
      params.require(:iteration).permit(:title, :description, :start_date, :end_date, :project_id)
    end
end
