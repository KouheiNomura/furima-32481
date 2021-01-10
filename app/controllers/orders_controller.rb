class OrdersController < ApplicationController

  def index
    @purchase_form = PurchaseForm.new
  end

end
