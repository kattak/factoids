class FactoidsController < ApplicationController
  before_action :set_factoid, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:new, :create]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /factoids
  # GET /factoids.json
  def index
    @factoids = Factoid.all
  end

  # GET /factoids/1
  # GET /factoids/1.json
  def show
  end

  # GET /factoids/new
  def new
    @factoid = Factoid.new

    respond_to do |format|
      format.js {render :_new, locals:{factoid: @factoid}}
      format.html
    end
  end

  # GET /factoids/1/edit
  def edit
  end

  # POST /factoids
  # POST /factoids.json
  def create
    @factoid = Factoid.new(factoid_params)

    respond_to do |format|
      if @factoid.save
        format.html { render :"ext_show", layout: false }
        format.js {render :"_show", layout: false}
        format.json { render :show, status: :created, location: @factoid }
      else
        format.html { render :new }
        format.json { render json: @factoid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factoids/1
  # PATCH/PUT /factoids/1.json
  def update
    respond_to do |format|
      if @factoid.update(factoid_params)
        format.html { redirect_to @factoid, notice: 'Factoid was successfully updated.' }
        format.json { render :show, status: :ok, location: @factoid }
      else
        format.html { render :edit }
        format.json { render json: @factoid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factoids/1
  # DELETE /factoids/1.json
  def destroy
    @factoid.destroy
    respond_to do |format|
      format.html { redirect_to factoids_url, notice: 'Factoid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factoid
      @factoid = Factoid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factoid_params
      params.require(:factoid).permit(:text, :url)
    end
end
