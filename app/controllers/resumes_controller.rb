class ResumesController < ApplicationController
  before_action :find_resume, only: [:show]
  before_action :find_my_resume, only: [:destroy, :edit, :update, :pin]
  before_action :authenticate_user, expect: [:index, :show]

  def index
    # render html: current_user
    # 如果是.all就會顯示全部的（包括草稿狀態的）
    @resumes = Resume.published
  end

  def new
    @resume = Resume.new
  end

  def create
    # @resume = Resume.new(resume_params)
    # @resume = user_id = current_user.id
    @resume = current_user.resumes.new(resume_params)

    if @resume.save
      # flash[:notice] = "新增成功"
      redirect_to resumes_path, notice: "新增成功"
    else
      render action: :new #這邊是借new.erb那個檔案來渲染 並非走回第五行
    end
  end

  def show
  end

  def destroy
    @resume.destroy
    redirect_to resumes_path, notice: "已刪除"
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to my_resumes_path, notice: "修改成功"
    else
      render action: :edit #這邊是借edit.erb那個檔案來渲染
    end
  end

  def my
    @resumes = current_user.resumes
  end

  def pin
    current_user.resumes.update_all("pinned = false")
    @resume.update(pinned: true)
    redirect_to my_resumes_path, notice: "預設履歷設定成功"
  end

  private
    def resume_params
      params.require(:resume).permit(:title, :content, :status)
    end

    def find_resume
      if user_signed_in?
        @resume = current_user.resumes.friendly.find(params[:id])
      else
        @resume = Resume.pulished.friendly.find(params[:id])
      end
    end

    def find_my_resume
      @resume = current_user.resumes.friendly.find(params[:id])
    end
end
