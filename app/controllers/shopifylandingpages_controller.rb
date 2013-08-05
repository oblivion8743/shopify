class ShopifylandingpagesController < ApplicationController
  # GET /shopifylandingpages
  # GET /shopifylandingpages.json
  def index
    @shopifylandingpages = Shopifylandingpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shopifylandingpages }
    end
  end

  # GET /shopifylandingpages/1
  # GET /shopifylandingpages/1.json
  def show
    @shopifylandingpage = Shopifylandingpage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopifylandingpage }
    end
  end

  # GET /shopifylandingpages/new
  # GET /shopifylandingpages/new.json
  def new
    @shopifylandingpage = Shopifylandingpage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopifylandingpage }
    end
  end

  # GET /shopifylandingpages/1/edit
  def edit
    @shopifylandingpage = Shopifylandingpage.find(params[:id])
  end

  # POST /shopifylandingpages
  # POST /shopifylandingpages.json
  def create
    @shopifylandingpage = Shopifylandingpage.new(params[:shopifylandingpage])

    respond_to do |format|
      if @shopifylandingpage.save
        format.html { redirect_to @shopifylandingpage, notice: 'Shopifylandingpage was successfully created.' }
        format.json { render json: @shopifylandingpage, status: :created, location: @shopifylandingpage }
      else
        format.html { render action: "new" }
        format.json { render json: @shopifylandingpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopifylandingpages/1
  # PUT /shopifylandingpages/1.json
  def update
    @shopifylandingpage = Shopifylandingpage.find(params[:id])

    respond_to do |format|
      if @shopifylandingpage.update_attributes(params[:shopifylandingpage])
        format.html { redirect_to @shopifylandingpage, notice: 'Shopifylandingpage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopifylandingpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopifylandingpages/1
  # DELETE /shopifylandingpages/1.json
  def destroy
    @shopifylandingpage = Shopifylandingpage.find(params[:id])
    @shopifylandingpage.destroy

    respond_to do |format|
      format.html { redirect_to shopifylandingpages_url }
      format.json { head :no_content }
    end
  end
end
