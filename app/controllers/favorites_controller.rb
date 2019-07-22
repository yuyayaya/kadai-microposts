class FavoritesController < ApplicationController
    def create
        # favorites_pathでmethodがpostであるならば、ここ。
        # いいねする時の処理を書く
        @favorite = current_user.favorites.new(micropost_id: params[:micropost_id])
        # @favorite = Favorite.new(user_id: current_user.id, micropost_id: params[:micropost_id])
        @favorite.save
        # redirect_to likes_user_path(current_user)
        redirect_back(fallback_location: root_url)
        # redirect_to "http://www.yahoo.co.jp/"
    end
    def destroy
        # favorite_pathでmethodがdeleteであるならば、ここ。
        # その際どのfavoriteかどうかを送る必要がある。
        # いいねを外す時の処理を書く
        @favorite = Favorite.find_by(id: params[:id])
        # @favorite = Favorite.find_by(micropost_id: params[:micropost_id], user_id: current_user.id)
        @favorite.destroy if @favorite
        # redirect_to likes_user_path(current_user)
        redirect_back(fallback_location: root_url)
    end
end
