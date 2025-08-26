class ProductsController < ApplicationController
  def upload
    # Esta ação apenas renderiza a view: app/views/products/upload.html.erb
  end

  def import
    file = params[:file]

    # Verifica se um arquivo foi realmente enviado
    if file.nil?
      redirect_to root_path, alert: 'Você precisa selecionar um arquivo CSV.'
      return
    end

    # Chama nosso Service Object!
    ProductImporter.new(file).call
    redirect_to root_path, notice: "Produtos importados com sucesso!"

  # Resgata qualquer erro que nosso importador possa gerar
  rescue => e
    redirect_to root_path, alert: "Erro ao importar: #{e.message}"
  end
end
