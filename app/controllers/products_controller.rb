class ProductsController < ApplicationController
  before_action :current_account
  before_action :authorized, only: [:edit, :new, :create, :destroy, :update]

  def index
    @products = Product.where("quantity != 0")
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    return redirect_to @product,
          notice: 'Produto editado com sucesso'if @product.update(product_params)

    render :edit
  end

  def create
    @product= Product.new(product_params)

    return redirect_to @product,
           notice: 'Produto registrado com sucesso' if @product.save!
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])

    return redirect_to products_path,
      alert: 'Produto deletado com sucesso' if @product.destroy
  end

  def search
    @products = Product.where("lower(title) LIKE ?", "%#{params[:query].downcase}%")
  end

  private

  def product_params
    params
      .require(:product)
      .permit(:code, :title, :description, :price, :quantity, :category, :photo)
  end
end
