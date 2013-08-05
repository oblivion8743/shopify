class ShopifyvariantsController < ApplicationController
  # GET /shopifyvariants
  # GET /shopifyvariants.json
  def index
    @shopifyvariants = Shopifyvariant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shopifyvariants }
    end
  end

  # GET /shopifyvariants/1
  # GET /shopifyvariants/1.json
  def show
    @shopifyvariant = Shopifyvariant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopifyvariant }
    end
  end

  # GET /shopifyvariants/new
  # GET /shopifyvariants/new.json
  def new
    @shopifyvariant = Shopifyvariant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopifyvariant }
    end
  end

  # GET /shopifyvariants/1/edit
  def edit
    @shopifyvariant = Shopifyvariant.find(params[:id])
  end

  # POST /shopifyvariants
  # POST /shopifyvariants.json
  def create
    @shopifyvariant = Shopifyvariant.new(params[:shopifyvariant])

    respond_to do |format|
      if @shopifyvariant.save
        format.html { redirect_to @shopifyvariant, notice: 'Shopifyvariant was successfully created.' }
        format.json { render json: @shopifyvariant, status: :created, location: @shopifyvariant }
      else
        format.html { render action: "new" }
        format.json { render json: @shopifyvariant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopifyvariants/1
  # PUT /shopifyvariants/1.json
  def update
    @shopifyvariant = Shopifyvariant.find(params[:id])

    respond_to do |format|
      if @shopifyvariant.update_attributes(params[:shopifyvariant])
        format.html { redirect_to @shopifyvariant, notice: 'Shopifyvariant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopifyvariant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopifyvariants/1
  # DELETE /shopifyvariants/1.json
  def destroy
    @shopifyvariant = Shopifyvariant.find(params[:id])
    @shopifyvariant.destroy

    respond_to do |format|
      format.html { redirect_to shopifyvariants_url }
      format.json { head :no_content }
    end
  end
end
