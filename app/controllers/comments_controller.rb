class CommentsController < ApplicationController

  http_basic_authenticate_with name: "rita", password: "rita", only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create!(comment_params.merge(user:current_user))
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    return render :file => "public/404.html", :status => :unauthorized if @comment.user!=current.user
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end


