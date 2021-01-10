class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
  end

end
