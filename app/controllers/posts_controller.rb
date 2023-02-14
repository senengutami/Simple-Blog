class PostsController < ApplicationController
 before_action :set_post, only: [:show, :update, :edit, :destroy]
 before_action :authenticate_user!, except: [:index, :show]
   
    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
    @post = Post.new
    end

    def create
        if @post = Post.new(post_params)
        @post.save
        redirect_to @post
      else
        render 'new'
      end
    end

    def edit
    end

    def update
        if @post.update(params[:post].permit(:title, :body))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end

    def show
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
