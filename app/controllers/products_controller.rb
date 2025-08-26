class ProductsController < ApplicationController
  def upload
  end

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def import
  file = params[:file]

  if file.nil?
    redirect_to root_path, alert: "Você precisa selecionar um arquivo CSV."
    return
  end

  ProductImportJob.perform_later(file.read)

  redirect_to root_path, notice: "Sua importação foi agendada! Os produtos aparecerão em breve."

  rescue => e
    redirect_to root_path, alert: "Erro ao agendar importação: #{e.message}"
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Produto criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :value, :stock_amount)
  end
end
