class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @purchase_form = PurchaseForm.new
  end

end
