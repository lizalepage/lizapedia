class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @wikis = Wiki.all
  end

  def show
     @wiki = Wiki.find(params[:id])
  end

  def new
      @wiki = Wiki.new
  end

  def create
      @wiki = Wiki.new(wiki_params)


     if @wiki.save

       flash[:notice] = "Post was saved."
       redirect_to @wiki
     else

      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
end



  def edit
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
end
