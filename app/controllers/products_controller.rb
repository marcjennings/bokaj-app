class ProductsController < ApplicationController
  respond_to :json, :html
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_product_by_market_name, only: [:show]
  # GET /products
  # GET /products.json
  def index
   if params[:q]
      search_term = params[:q]
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    else
      @products = Product.order(:name)
    end
    respond_with @products
  end

  # def contact
  #    @products = Products.limit(3)
  # end

  def review
    
  end


  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC")
  end

  # GET /products/new
  def new
    byebug
    @product = Product.new
    render layout: 'admin'
  end

  # GET /products/1/edit
  def edit
    render layout: 'admin'
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { render layout: 'admin' }
        # format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_product_by_market_name
      @product = Product.find_by_market_name(params[:market_name])
      @product = Product.find(params[:id]) if @product.nil?
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :market_name, :description, :image_url, :event_date, :fee)
    end
end
