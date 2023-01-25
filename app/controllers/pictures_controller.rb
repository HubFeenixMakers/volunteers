class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]

  def index
    @q = Picture.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @pictures = @q.result(distinct: true).page( params[:page])
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def edit
    authorize @picture
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.member = current_member

    if @picture.save
      redirect_to @picture, notice: "Picture was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @picture
    if @picture.update(picture_params)
      redirect_to @picture, notice: "Picture was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @picture
    @picture.destroy
    redirect_to pictures_url, notice: "Picture was successfully destroyed."
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:picture,:picture_cache ,:text, :member_id)
    end
end
