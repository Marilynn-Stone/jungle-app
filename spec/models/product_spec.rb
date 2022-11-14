require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    @category = Category.new(name: "category")
    @product = Product.new(name: "product", price: 12.34, quantity: 5, category: @category.name)
    
    it 'is not valid without a name' do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    it 'is not valid without a price' do
      @product.price = nil
      expect(@product).to_not be_valid
    end
    it 'is not valid without a quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it 'is not valid without a category' do
      @product.category = nil
      expect(@product).to_not be_valid
    end
      
      
      
      # @category = Category.new
      # @product = Product.new
      # expect(@product).to have_attributes(:name, :price, :quantity, :category)
    # end
  end
end
