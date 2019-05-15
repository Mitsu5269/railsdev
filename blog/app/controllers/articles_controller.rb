class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        article = Article.new(article_params)
        article.save!
        redirect_to articles_url, notice: "新しい記事を登録しました。"
    end

    def edit
    end

    def update
        @article.update!(article_params)
        redirect_to articles_url, notice: "記事を更新しました。"
    end

    private
    def article_params
        params.require(:article).permit(:name, :description)
    end

    def set_article
        @task = article.find(params[:id])
end
