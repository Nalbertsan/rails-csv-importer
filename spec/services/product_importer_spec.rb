require 'rails_helper'
require 'csv'

RSpec.describe ProductImporter, type: :service do
  it 'imports products from a CSV file' do
    csv_content = <<~CSV
      name,description,value,stock_amount
      Produto A,Descrição A,10.0,5
      Produto B,Descrição B,20.5,10
    CSV
    file = Tempfile.new(['products', '.csv'])
    file.write(csv_content)
    file.rewind

    importer = ProductImporter.new(file)
    expect { importer.call }.to change(Product, :count).by(2)

    file.close
    file.unlink
  end
end
