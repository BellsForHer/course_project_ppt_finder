class SearchController < ApplicationController
  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result(distinct: true)
  end
end
