class CustomersController < ApplicationController  
   def show
      @supermarket = Supermarket.all
      @customer = Customer.find(params[:id])
   end
end
