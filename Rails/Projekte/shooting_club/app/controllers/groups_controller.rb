class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @search = MarksmanGroup.where(group_id: @group.id)
    @list = []
    @search.each do |marksman|
      @list << Marksman.find_by(id: marksman.marksman_id)
    end
  end

  def deletem
    MarksmanGroup.find_by(marksman_id: params[:format].to_i, group_id: params[:group_id].to_i).destroy
    redirect_to group_url(params[:group_id]), notice: 'Der Member ist nicht mehr in der Gruppe.'
  end

  def addnew
    @member = MarksmanGroup.new
    @member.group_id = params[:group_id]
    @group = Group.find(params[:group_id])
  end

  def addcreate
    @member = MarksmanGroup.new
    @member.group_id = member_params[:group_id]
    if member_params[:marksman_id].to_i > 0 && Marksman.exists?(startnr: member_params[:marksman_id])
      @member.marksman_id = Marksman.find_by(startnr: member_params[:marksman_id]).id
      if !MarksmanGroup.exists?(:marksman_id => @member.marksman_id, :group_id => @member.group_id)
        respond_to do |format|
          if @member.save
            format.html { redirect_to group_path(@member.group_id), notice: 'Member was successfully added.' }
            format.json { render :show, status: :created, location: @group }
          else
            format.html { render :addnew }
            format.json { render json: @group.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to group_addnew_path(@member.group_id), alert: 'Member is already in this Group.'
      end
    else
      redirect_to group_addnew_path(@member.group_id), alert: 'Please enter an existing Marksman ID.'
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :note)
    end

    def member_params
      params.require(:marksman_group).permit(:marksman_id, :group_id)
    end
end
