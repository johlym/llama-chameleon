class EmailsController < ApplicationController

  def new
    render :new
  end

  def create
    post = Post.find params[:post_id]
    email = params[:email]
    
    SendPostEmailJob.perform_later(post, email)
    redirect_to post, notice: "Email queued!"
  end

end