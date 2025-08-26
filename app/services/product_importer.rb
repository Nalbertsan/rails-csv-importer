require "csv"

class ProductImporter
  def initialize(file)
    @file = file
  end

  def call
    Product.transaction do
      CSV.foreach(@file.path, headers: true) do |row|
        Product.create!(row.to_hash)
      end
    end
  end
end
