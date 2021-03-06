class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all.order(created_at: :desc)
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article, notice: "新しい記事を登録しました。"
        else
            render :new
        end
    end

    def edit
    end

    def update
        @article.update!(article_params)
        redirect_to articles_url, notice: "記事を更新しました。"
    end

    def destroy
        @article.destroy
        redirect_to articles_url, notice: "記事「#{@article.name}」を削除しました。"
    end

    private
    def article_params
        params.require(:article).permit(:name, :description)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
