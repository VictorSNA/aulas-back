class CartController < ApplicationController
  def addItem
    return redirect_to accounts_path unless session[:account_id]

    account = Account.find(session[:account_id])
    product = Product.find(product_params[:product_id])

    quantity = product_params[:quantity].to_i || 1

    Cart.create(
      sessionid: session.id&.public_id,
      user_id: account.id,
      product_id: product.id,
      quantity: quantity,
      unit_value: product.price,
      total: product.price * quantity
    ).save!

    redirect_to cart_confirmation_path
  end

  def confirmation
    @cart = Cart.where(sessionid: session.id&.public_id).last
    @product = Product.find(@cart.product_id)
  end

  def show
    @cart_itens = Cart
      .where(sessionid: session.id&.public_id)
      .where(user_id: session[:account_id])

    @products = []
    @total_price = 0

    @cart_itens.each do |item|
      product = Product.find(item.product_id)

      @products << {
        title: product.title,
        price: item.unit_value,
        total: item.total,
        quantity: item.quantity
      }

      @total_price += item.total
    end
  end

  def delete
    Cart.destroy_by(sessionid: session.id&.public_id)

    redirect_to cart_path
  end
  private

  def product_params
    params.permit(:quantity, :product_id)
  end
end
