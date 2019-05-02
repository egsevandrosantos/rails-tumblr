class CommentsController < ApplicationController
    before_action :set_post, only: [:create]
    before_action :set_comment, only: [:destroy]

    def create
        if @post.comments.create(comments_params)
            redirect_to post_path(@post)
        end
    end

    def destroy
        post = @comment.post
        @comment.destroy
        redirect_to post_path(post)
    end

    private 
        def set_post
            @post = Post.find(params[:post_id])
        end

        def set_comment
            @comment = Comment.find(params[:id])
        end

        def comments_params
            params.require(:comment).permit(:name, :body)
        end
end
