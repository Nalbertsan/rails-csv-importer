require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with a name, description, value, and stock_amount' do
    product = Product.new(
      name: 'Cadeira Gamer',
      description: 'Cadeira ergonômica para longas sessões',
      value: 999.90,
      stock_amount: 15
    )
    expect(product).to be_valid
  end

  it 'is invalid without a name' do
    product = Product.new(name: nil)
    expect(product).to_not be_valid
  end

  it 'is invalid without a description' do
    product = Product.new(description: nil)
    expect(product).to_not be_valid
  end
  it 'is invalid with a negative value' do
    product = Product.new(value: -10)
    expect(product).to_not be_valid
  end

  it 'is invalid if the value is not a number' do
    product = Product.new(value: 'caro')
    expect(product).to_not be_valid
  end

  it 'is invalid with a negative stock_amount' do
    product = Product.new(stock_amount: -5)
    expect(product).to_not be_valid
  end
end
