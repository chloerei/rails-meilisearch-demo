class PostsController < ApplicationController
  def index
    page = params[:page] || 1
    sort = params[:sort] == "latest" ? ["date:desc"] : nil
    filter = params[:tag].in?(["国内", "国际"]) ? "tag = '#{params[:tag]}'" : nil
    @posts = Post.search(params[:q], page: page, sort: sort, filter: filter)
  end
end
