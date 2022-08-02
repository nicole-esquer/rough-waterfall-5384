require 'rails_helper'

RSpec.describe 'customer show page' do
   it "has a list of its items and name of supermarket it belongs to" do
      @supermarket = Supermarket.create!(name: "Supermarket", location: "Earth")

      @customer_1 = Customer.create!(name: "Customer 1", supermarket_id: @supermarket.id)
      @customer_2 = Customer.create!(name: "Customer 2", supermarket_id: @supermarket.id)
     
      @item_1 = Item.create!(name: "Item 1", price: 5)
      @item_2 = Item.create!(name: "Item 2", price: 10)
      @item_3 = Item.create!(name: "Item 3", price: 15)

      @customer_items_1 = CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_1.id)
      @customer_items_2 = CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_2.id)
      @customer_items_3 = CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_3.id)

      visit "/customers/#{@customer_1.id}"
      
      expect(page).to have_content("Item 1")
      expect(page).to have_content("Item 2")
      expect(page).to_not have_content("Item 3")
      expect(page).to have_content("Member of Supermarket")
      
   end
end