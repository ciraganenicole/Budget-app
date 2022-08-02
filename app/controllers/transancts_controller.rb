class TransanctsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transact, only: %i[show edit update destroy]

  def index
    @transancts = current_user.categories.find(params[:category_id]).transancts.order(created_at: :desc)
    @category = current_user.categories.find(params[:category_id])
  end

  def show
    @transancts = current_user.categories.find(params[:category_id]).transancts.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @transanct = Transancts.new
  end

  def create
    @transanct = Transancts.new(transancts_params)
    @transanct.user = current_user
    @category = Category.find(params[:category_id])
    @category.transancts << @transanct if @transanct.save

    if @transanct.save
      redirect_to category_transancts_path(params[:category_id])
    else
      flash[:alert] = 'All fields are required'
      render :new
    end
  end

  def destroy
    @transac = current_user.categories.find(params[:category_id]).transancts.find(params[:transac_id])
    @transac.destroy
    redirect_to category_transancts_path(@transac.category_id)
  end

  private

  def set_transact
    @transanct = Transancts.find(params[:id])
  end

  def transancts_params
    params.require(:transancts).permit(:amount, :name)
  end
end
