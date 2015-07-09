class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
      
      if @wiki.save
        redirect_to @wiki, notice: "Commence New Wiki."
      else
        flash[:error] = "Error creating Wiki. Try again."
        render :new
      end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
      if @wiki.update_attributes(wiki_params)
        redirect_to @wiki
      else
        flash[:error] = "Error saving wiki. Try again."
        render :edit
      end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    title = @wiki.title
    if @wiki.destroy
      flash[:notice] = "\"#{title}\" was successfully deleted."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :description, :picture, :picture_cache, :body, :private)
  end
end
