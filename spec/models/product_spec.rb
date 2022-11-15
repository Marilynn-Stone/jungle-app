require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'creates a product' do
      @category = Category.new(name: "Category")
      @category.save
      @product = Product.new(name: "product", price: 12.34, quantity: 5, category_id: @category.id)
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to_not be_present
    end

    it 'is not valid without a name' do
      @category = Category.new(name: "category")
      @category.save
      @product = Product.new(price: 12.34, quantity: 5, category_id: @category.id)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.new(name: "category")
      @category.save
      @product = Product.new(name: "product", quantity: 5, category_id: @category.id)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @category = Category.new(name: "category")
      @category.save
      @product = Product.new(name: "product", price: 12.34, category_id: @category.id)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @category = Category.new(name: "category")
      @category.save
      @product = Product.new(name: "product", price: 12.34, quantity: 5)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
