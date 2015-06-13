class ProductsController < ApplicationController
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  before_filter :require_permission, only: [:update, :edit]
  def require_permission
    if current_user != product.user and current_user.admin == false
      redirect_to category_product_url(category, product), :flash => { :error => "You are not allowed to edit this product." }
    end
  end

  #before_filter :require_permission_to_delete, only: [:destroy]
  #def require_permission_to_delete
  #  if current_user != product.user and current_user.admin == false
 #     redirect_to new_user_session_path, :flash => { :error => "You are not allowed to delete this product." }
  #  end
 # end

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if user_signed_in?
      self.product = Product.new(product_params)
      product.user = current_user
      if self.product.save
        category.products << product
        redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
    else
      redirect_to(new_user_session_path)
    end

  end

  def update
    if user_signed_in?
      product.user = current_user
      if self.product.update(product_params)
          redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
      else
          redirect_to category_product_url(category, product)
      end
    else
      redirect_to(new_user_session_path)
    end

  end

  # DELETE /products/1
  def destroy
    if user_signed_in? and
      product.destroy
      redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
    else
      redirect_to(new_user_session_path)
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end