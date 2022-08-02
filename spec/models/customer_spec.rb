require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items}
    it { should have_many(:items).through(:customer_items) }
  end

  describe 'model methods' do
    it 'has a total_price in the customer show page' do
      @supermarket = Supermarket.create!(name: "Supermarket", location: "Earth")

      @customer_1 = Customer.create!(name: "Customer 1", supermarket_id: @supermarket.id)
      @customer_2 = Customer.create!(name: "Customer 2", supermarket_id: @supermarket.id)
     
      @item_1 = Item.create!(name: "Item 1", price: 5)
      @item_2 = Item.create!(name: "Item 2", price: 10)
      @item_3 = Item.create!(name: "Item 3", price: 15)

      @customer_items_1 = CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_1.id)
      @customer_items_2 = CustomerItem.create!(customer_id: @customer_1.id, item_id: @item_2.id)
      @customer_items_3 = CustomerItem.create!(customer_id: @customer_2.id, item_id: @item_3.id)

      expect(@customer_1.total_price).to eq(15)
    end
  end
end