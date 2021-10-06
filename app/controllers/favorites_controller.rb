class FavoritesController < ApplicationController
    def index
        @favorites = current_user.favorites.all
    end
    def create
        favorite = current_user.favorites.create(post_id: params[:post_id])
        redirect_to posts_path, notice: " Le post de #{favorite.post.user.name}  a été ajouté aux favoris"
      end
      def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to posts_path, notice: "Le post de#{favorite.post.user.name} a été supprimé aux favoris."
      end
end
