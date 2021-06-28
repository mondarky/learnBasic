class TutorialsController < ApplicationController
  before_action :set_tutorial, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except:%i[index show]
  # GET /tutorials or /tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  # GET /tutorials/1 or /tutorials/1.json
  def show
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials or /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to @tutorial, notice: "Tutorial was successfully created." }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1 or /tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to @tutorial, notice: "Tutorial was successfully updated." }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1 or /tutorials/1.json
  def destroy
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: "Tutorial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tutorial_params
      params.require(:tutorial).permit(:first_name, :last_name, :email, :phone)
    end
end
