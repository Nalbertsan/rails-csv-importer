class ProductsController < ApplicationController
  def upload
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
end
