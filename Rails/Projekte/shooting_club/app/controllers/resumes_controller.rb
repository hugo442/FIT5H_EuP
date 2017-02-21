class ResumesController < ApplicationController
 def index
    @resumes = Resume.all.order("created_at DESC")
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "The resume #{@resume.attachment_identifier} has been uploaded."
    else
      render "new"
    end
  end

  def update

  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.attachment_identifier} has been deleted."
  end


private
  def resume_params
    params.require(:resume).permit(:note, :attachment)
  end
end
