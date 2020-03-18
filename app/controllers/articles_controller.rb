class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  # Extra Credit
#When only one form element is updated, such as the title, does the description also get updated?

#How could we refactor this form code? You may notice that we have a form for the new and edit actions. Is there a better way of doing this?
#remove new view
  # def new
  #   @article = Article.new
  #   @article.save
  #   redirect_to edit_article_path(@article)
  # end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    @article = Article.find(params[:id])
  end

  def update  
    #raise params.inspect #causes program to pause and print out params on error page
    # <ActionController::Parameters {"utf8"=>"✓", "_method"=>"patch", "authenticity_token"=>"xt51NQCazP26bDhb657mfCab0RJzW+TL8J5P7NwJKDC+pqqI+BmFzIJPeysr829ig9nBGEAUnAx04tGvYjLbQQ==", "article"=>{"title"=>"FML", "description"=>"yup1"}, "commit"=>"Submit Article", "controller"=>"articles", "action"=>"update", "id"=>"1"} permitted: false>
    @article = Article.find(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])
    redirect_to article_path(@article)
  end

end
