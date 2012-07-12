class LendsController < ApplicationController
  # GET /lends
  # GET /lends.json
  def index
    @lends = current_user.lends

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lends }
    end
  end

  # GET /lends/1
  # GET /lends/1.json
  def show
    @lend = Lend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lend }
    end
  end

  # GET /lends/new
  # GET /lends/new.json
  def new
    @lend = Lend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lend }
    end
  end

  # GET /lends/1/edit
  def edit
    @lend = Lend.find(params[:id])
  end

  # POST /lends
  # POST /lends.json
  def create
    @lend = current_user.lends.build(params[:lend])

    respond_to do |format|
      if @lend.save
        format.html { redirect_to lends_path, notice: 'Lend was successfully created.' }
        format.json { render json: @lend, status: :created, location: @lend }
      else
        format.html { render action: "new" }
        format.json { render json: @lend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lends/1
  # PUT /lends/1.json
  def update
    @lend = Lend.find(params[:id])

    respond_to do |format|
      if @lend.update_attributes(params[:lend])
        format.html { redirect_to lends_path, notice: 'Lend was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lends/1
  # DELETE /lends/1.json
  def destroy
    @lend = Lend.find(params[:id])
    @lend.destroy

    respond_to do |format|
      format.html { redirect_to lends_url }
      format.json { head :no_content }
    end
  end
end
