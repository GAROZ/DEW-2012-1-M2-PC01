class PriceController < ApplicationController
  
  def index
    @sales = Sale.all

    respond_to do |format|
      format.html 
      format.json { render json: @sales }
    end
  end

  
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @sale }
    end
  end

  
  def new
    @sale = Sale.new
    a = session[:id]
    @customer = Customer.find(a)

    respond_to do |format|
      format.html 
      format.json { render json: @sale }
      format.json { render json: @customer }
    end
  end

  
  def edit
    @sale = Sale.find(params[:id])
  end

  
  def create
  

    @sale = Sale.new(params[:sale])
  
@elemento1 = 0

params[:sale][:product_id].each { |item|

 if item != ""

  @product = Product.find(item)
  @elemento1 =  @elemento1 + @product.price 
 
 end

  }

    
    puts @elemento1
    params[:sale][:total] = @elemento1
    

    respond_to do |format|
      if @sale.save
        @sale = Sale.find(@sale.id)
        @sale.update_attributes(:client_id => session[:id], :total => @elemento1)
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end
end