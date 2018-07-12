class CollaboratorsController < ApplicationController
 
    def new
        @collaborator = @wiki.collaborators.new
    end    
    
    def create
        @collaborator_user = User.find_by_email(params[:collaborator])
        @wiki = Wiki.find(params[:wiki_id])
        @user = current_user
        
        if @collaborator_user
            if @wiki.collaborators.include?(@collaborator_user) || @collaborator_user == @user 
                flash[:notice] = "#{@collaborator_user.email} is already a collaborator."
                redirect_to edit_wiki_path(@wiki)
            else
                @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: @collaborator_user.id)
                if @collaborator.save
                    flash[:notice] =  "#{@collaborator_user.email} was added as a collaborator."
                    puts @wiki.collaborators
                    redirect_to @wiki
                else 
                    flash[:alert] = "There was an error adding this collaborator. Please try again."
                    redirect_to edit_wiki_path(@wiki)
                end    
            end
        else
            flash[:notice] = "User is not in the system yet."
        end    
    end    
    
    def destroy
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator_user = @wiki.collaborators.find(params[:id])
        
        if @collaborator_user.destroy
            flash[:notice] = "Collaborator has been successfully removed. "
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error removing this collaborator."
        redirect_to @wiki
        end
    end
    
    
    
end
