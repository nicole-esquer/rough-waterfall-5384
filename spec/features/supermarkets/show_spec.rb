require 'rails_helper'

RSpec.describe 'supermarkets show page' do
   it 'has the supermarket name' do
      @supermarket_1 = Supermarket.create!(name: "Supermarket 1", location: "Earth")
      
      visit "/supermarkets/#{@supermarket_1.id}"

      expect(page).to have_content("Name: Supermarket 1")
   end

   it 'see a link to view all of the items that the supermarket has' do
      @supermarket_1 = Supermarket.create!(name: "Supermarket 1", location: "Earth")

      @customer_1 = Customer.create!(name: "Customer 1", supermarket_id: @supermarket_1.id)
      @customer_2 = Customer.create!(name: "Customer 2", supermarket_id: @supermarket_1.id)
     
      @item_1 = Item.create!(name: "Item 1", price: 5)
      @item_2 = Item.create!(name: "Item 2", price: 10)
      @item_3 = Item.create!(name: "Item 3", price: 15)

      @customer_items_1 = CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_1.id)
      @customer_items_2 = CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_2.id)
      @customer_items_3 = CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_3.id)

      visit "/supermarkets/#{@supermarket_1.id}/"

      expect(page).to have_content("Supermarket Items")
      # require 'pry'; binding.pry 
      click_link "Supermarket Items"

      expect(current_path).to eq("/supermarkets/#{@supermarket_1.id}/items")
      expect(page).to have_content("Item 1")
      expect(page).to have_content("Item 2")
      expect(page).to_not have_content("Item 3")
   end
end
