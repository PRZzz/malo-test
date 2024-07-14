class ArticlesController < ApplicationController
  def index
    if params[:query].present?
      @articles = Article.search(params[:query])
    else
      @articles = Article.all
    end

    if turbo_frame_request?
      render partial: "articles", locals: { articles: @articles }
    else
      render :index
    end
  end
end
