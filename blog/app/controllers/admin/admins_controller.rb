class Admin::AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def index
    @admins = Admin.all
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admin_admin_path(@admin), notice: "管理者「#(@admin.name)」を登録しました。"
    else
      render :new
    end
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update(admin_params)
      redirect_to admin_admin_path(@admin), notice: "管理者「#(@admin.name)」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to admin_admin_url, notice: "管理者「#(@admin.name)」を削除しました。"
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :password, :password_confirmation)
  end
end
