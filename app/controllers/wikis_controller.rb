class WikisController < ApplicationController




  def index
    @wikis = Wiki.all

  end

  def show
     @wiki = Wiki.find(params[:id])
     authorize @wiki
  end

  def new
      @wiki = Wiki.new
      
  end

  def create
      @wiki = current_user.wikis.new(wiki_params)
      authorize @wiki

     if @wiki.save

       flash[:notice] = "Post was saved."
       redirect_to wikis_path

     else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end



  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    authorize @wiki

      if @wiki.save
        flash[:notice] = "post was updated"
        redirect_to @wiki
      else
        flash.now[:alert] = 'there was an error saving the post, please try again'
        render :edit
      end
    end

    def destroy
      @wiki = Wiki.find(params[:id])
      authorize @wiki

      if @wiki.destroy
        flash[:notice] = "#{@wiki.title} was deleted successfully."
        redirect_to wikis_path
      else
        flash.now[:alert] = "There was an error deleting the wiki"
        render :show
      end

    end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end




end
