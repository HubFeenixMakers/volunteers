class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show edit update destroy ]

  # GET /stories
  def index
    @stories = Story.all.page params[:page]
  end

  # GET /stories/1
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
    authorize @story
  end

  # POST /stories
  def create
    @story = Story.new(story_params)
    @story.member = current_member

    if @story.save
      redirect_to @story, notice: "Story was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stories/1
  def update
    if @story.update(story_params)
      redirect_to @story, notice: "Story was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1
  def destroy
    @story.destroy
    redirect_to stories_url, notice: "Story was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def story_params
      params.require(:story).permit(:picture, :header, :text, :happened)
    end
end
