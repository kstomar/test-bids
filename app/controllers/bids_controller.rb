class BidsController < ApplicationController
  before_action :set_auction
  # before_action :authenticate_user!
  before_action :set_item
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = @item.auction.bids
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # POST /bids.json
  def create
    @bid = @item.bids.new(bid_params)
    @bid.user = current_user
    respond_to do |format|
      if @bid.save
        format.html { redirect_to @bid, notice: 'Bid was successfully created.' }
        format.json { render :show, status: :created, location: @bid }
      else
        format.html { render :new }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = @item.bids.find_by(id: params[:id])
      render json: { errors: { detail: "Bid not found" } }, status: :unauthorized and return unless @bid
    end

    def set_auction
      @auction = Auction.find_by(id: params[:auction_id])
      render json: { errors: { detail: "Auction not found" } }, status: :unauthorized and return unless @auction

    end
    def set_item
      @item = @auction.items.find_by(id: params[:item_id])
      render json: { errors: { detail: "Item not found" } }, status: :unauthorized and return unless @item

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:item_id, :value)
    end
end
