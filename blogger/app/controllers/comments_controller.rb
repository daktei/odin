class CommentsController < ApplicationController
    skip_before_action :require_login, only[:create]
    include CommentsHelper
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        
        @comment.save
        redirect_to article_path(@comment.article)
    end
end
