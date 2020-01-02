class ItemsController < ApplicationController
  before_action :set_auction
  before_action :set_item, only: [:show, :edit, :update, :destroy, :highest_bid, :my_bids]

  def highest_bid
    @bid = @item.bids.order("value DESC").first
    respond_to do |format|
      if @bid
        format.json { render 'bids/show', location: @bid }
      else
        format.json { render json: "Bid not found" }
      end
    end
  end

  def my_bids
    @bids = @item.bids
    respond_to do |format|
      if @bids
        format.json { render 'bids/index',  collection: @bids }
      else
        format.json { render json: "Bid not found" }
      end
    end

  end

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_auction
      @auction = Auction.find_by(id: params[:auction_id])
      render json: { errors: { detail: "Auction not found" } }, status: :unauthorized and return unless @auction

    end
    def set_item
      @item = @auction.items.find_by(id: params[:item_id])
      render json: { errors: { detail: "Item not found" } }, status: :unauthorized and return unless @item

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:auction_id, :minimum_bid_value)
    end
end
