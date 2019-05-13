class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def index
        @articles = Article.find(params[:id])
    end
end
