class ShopifyproductsController < ApplicationController
  # GET /shopifyproducts
  # GET /shopifyproducts.json
  def index
    @shopifyproducts = Shopifyproduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shopifyproducts }
    end
  end

  # GET /shopifyproducts/1
  # GET /shopifyproducts/1.json
  def show
    @shopifyproduct = Shopifyproduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopifyproduct }
    end
  end

  # GET /shopifyproducts/new
  # GET /shopifyproducts/new.json
  def new
    @shopifyproduct = Shopifyproduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopifyproduct }
    end
  end

  # GET /shopifyproducts/1/edit
  def edit
    @shopifyproduct = Shopifyproduct.find(params[:id])
  end

  # POST /shopifyproducts
  # POST /shopifyproducts.json
  def create
    @shopifyproduct = Shopifyproduct.new(params[:shopifyproduct])

    respond_to do |format|
      if @shopifyproduct.save
        format.html { redirect_to @shopifyproduct, notice: 'Shopifyproduct was successfully created.' }
        format.json { render json: @shopifyproduct, status: :created, location: @shopifyproduct }
      else
        format.html { render action: "new" }
        format.json { render json: @shopifyproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopifyproducts/1
  # PUT /shopifyproducts/1.json
  def update
    @shopifyproduct = Shopifyproduct.find(params[:id])

    respond_to do |format|
      if @shopifyproduct.update_attributes(params[:shopifyproduct])
        format.html { redirect_to @shopifyproduct, notice: 'Shopifyproduct was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopifyproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopifyproducts/1
  # DELETE /shopifyproducts/1.json
  def destroy
    @shopifyproduct = Shopifyproduct.find(params[:id])
    @shopifyproduct.destroy

    respond_to do |format|
      format.html { redirect_to shopifyproducts_url }
      format.json { head :no_content }
    end
  end
end
