class LineProsController < ApplicationController
  before_action :set_line_pro, only: [:show, :edit, :update, :destroy]

  # GET /line_pros
  # GET /line_pros.json
  def index
    @line_pros = LinePro.all
  end

  # GET /line_pros/1
  # GET /line_pros/1.json
  def show
  end

  # GET /line_pros/new
  def new
    @line_pro = LinePro.new
  end

  # GET /line_pros/1/edit
  def edit
  end

  # POST /line_pros
  # POST /line_pros.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_pro = @cart.add_product(product.id)

    respond_to do |format|
      if @line_pro.save
        format.html { redirect_to @line_pro, notice: 'Line pro was successfully created.' }
        format.json { render :show, status: :created, location: @line_pro }
      else
        format.html { render :new }
        format.json { render json: @line_pro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_pros/1
  # PATCH/PUT /line_pros/1.json
  def update
    respond_to do |format|
      if @line_pro.update(line_pro_params)
        format.html { redirect_to @line_pro, notice: 'Line pro was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_pro }
      else
        format.html { render :edit }
        format.json { render json: @line_pro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_pros/1
  # DELETE /line_pros/1.json
  def destroy
    @line_pro.destroy
    respond_to do |format|
      format.html { redirect_to line_pros_url, notice: 'Line pro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_pro
      @line_pro = LinePro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_pro_params
      params.require(:line_pro).permit(:product_id, :cart_id, :quantity)
    end
end
