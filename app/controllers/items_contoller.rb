class ItemsController < ApplicationController  
   def index
      @supermarket = Supermarket.find(params[:supermarket_id])
      @items = Item.all
   end
end