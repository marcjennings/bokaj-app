class CommentsController < ApplicationController

	def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_comments_url(@product), notice: 'Review was created successfully.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to product_comments_url(@product), alert: 'Review was not saved successfully.'}
        format.json { render json: @comment.errors, status: :unprocesable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
	end

  def index
    @product = Product.find(params[:product_id])
    #@comments =  Comment.where(product_id: @product.id).order(“id desc”)
    @comments = @product.comments.order("id desc").paginate(per_page: 3, page: params[:page])
    @comment = Comment.new(product: @product)
   


  end  



  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end


end
