require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid with a name, price, quantity and category" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = 100
      @product.quantity = 14
      @product.category = @category

      expect(@product.valid?).to be true

    end
    
    it "should have a name" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = 100
      @product.quantity = 14
      @product.category = @category

      expect(@product.valid?).to be true
      expect(@product.name).to include('Product Test')

    end
    
    it "should have a price" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = 100
      @product.quantity = 14
      @product.category = @category

      expect(@product.price_cents).to be > 0
      expect(@product.price_cents).to be (100)

    end
    
    it "it should have a quantity" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = 100
      @product.quantity = 14
      @product.category = @category

      expect(@product.quantity).to be > 0
      expect(@product.quantity).to be(14)

    end
    
    it "it should have a valid category" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = 100
      @product.quantity = 14
      @product.category = @category

      expect(@product.category).to be_a(Category)
      expect(@product.category.name).to include('Category Test')
    end

    it 'should have a name' do
      product = Product.new
      expect(product.name).to be_nil
    end
    it 'should have a price' do
      product = Product.new
      expect(product.price).to be_nil
    end
    it 'should have a quantity' do
      product = Product.new
      expect(product.quantity).to be_nil
    end
    it 'should have a category' do
      product = Product.new
      expect(product.category).to be_nil
    end

    it 'should return an error when a name is not present' do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = nil
      @product.price_cents = 100
      @product.quantity = 14
      @product.category = @category

      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should return an error when a price is not present' do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = nil
      @product.quantity = 14
      @product.category = @category

      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")
      expect(@product.price_cents).to be_nil
    end

    it 'should return an error when a quantity is not present' do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = 100
      @product.quantity = nil
      @product.category = @category

      expect(@product.quantity).to be_nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should return an error when a category is not present' do
      @product = Product.new
      @category = Category.new
      @category.name = 'Category Test'
      @product.name = 'Product Test'
      @product.price_cents = 100
      @product.quantity = 14
      @product.category = nil

      expect(@product.category).to be_nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end

end

