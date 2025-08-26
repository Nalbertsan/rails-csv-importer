class ProductImportJob < ApplicationJob
  queue_as :default

  def perform(csv_content)
    file = Tempfile.new(['products', '.csv'])
    file.write(csv_content)
    file.rewind

    ProductImporter.new(file).call
  ensure
    file.close
    file.unlink if file
  end
end
