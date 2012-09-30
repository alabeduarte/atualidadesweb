class Admin::FeedsController < ApplicationController
  layout 'admin'
  respond_to :html, :json

  def index
    @feeds = Feed.all
    respond_with(@feeds)
  end

  def show
    @feed = Feed.find(params[:id])
    @response_time = Time.now
    @news = @feed.fetch(Reader.new(@feed.url))
    respond_with(:admin, @feed)
  end

  def new
    @feed = Feed.new
    respond_with(:admin, @feed)
  end

  def edit
    @feed = Feed.find(params[:id])
    respond_with(:admin, @feed)
  end

  def create
    @feed = Feed.new(params[:feed])
    flash[:notice] = 'Feed was successfully created.' if @feed.save
    respond_with(:admin, @feed)
  end

  def update
    @feed = Feed.find(params[:id])
    flash[:notice] = 'Feed was successfully updated.' if @feed.update_attributes(params[:feed])
    respond_with(:admin, @feed)
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    respond_with(nil, :location => admin_feeds_url)
  end
end
