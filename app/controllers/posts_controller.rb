class PostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy, :edit, :show]
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def index
    @posts= Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if params[:Retour]
      render :new
     else
       if @post.save
         flash[:notice] = "Post posté avec succès" 
         #PostMailer.post_mail(current_user).deliver
         redirect_to posts_path
       else
         render new_post_path
       end
     end
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = " Post modifié avec succès" 
      redirect_to post_path
    else
      render :edit 
    end
  end

  def destroy
    flash[:danger] = " Post supprime" 
    redirect_to posts_path if @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:picture, :picture_cache, :comment)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
