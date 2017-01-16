require 'rails_helper'

RSpec.describe "Products", type: :feature do
  before do
    Product.destroy_all
    Customer.destroy_all
    Invoice.destroy_all
    Order.destroy_all
  end

  describe "products index" do
    it 'gets the description and inventory', js: true do
      product = Product.create!(name: "Test Product", inventory: 0, description: "This is a test description with more text than should be there.")
      customer = Customer.create(:name => Faker::Name.name)
      invoice = Invoice.create
      order = Order.create(customer: customer, invoice: invoice)

      order.products << product
      visit products_path
      expect(page).to have_content(product.name, count: 1)
      expect(page).not_to have_content product.description
      click_button "More Info"
      expect(page).to have_content product.description
      expect(page).to have_content "Sold Out"
      product.inventory = 1
      product.save
      visit products_path
      click_button "More Info"
      expect(page).to have_content "Available"
    end
  end
end
