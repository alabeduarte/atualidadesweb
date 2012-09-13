class FeedsController < ApplicationController
  respond_to :html, :json

  def index
    @feeds = Feed.all
    respond_with(@feeds)
  end

  def show
    @feed = Feed.find(params[:id])
    @news = @feed.fetch(Reader.new(@feed.url))
    respond_with(@feed)
  end

  def new
    @feed = Feed.new
    respond_with(@feed)
  end

  def edit
    @feed = Feed.find(params[:id])
    respond_with(@feed)
  end

  def create
    @feed = Feed.new(params[:feed])
    flash[:notice] = 'Feed was successfully created.' if @feed.save
    respond_with(@feed, location: @feed)
  end

  def update
    @feed = Feed.find(params[:id])
    flash[:notice] = 'Feed was successfully updated.' if @feed.update_attributes(params[:feed])
    respond_with(@feed, location: @feed)
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    respond_with(nil, :location => feeds_url)
  end
end
