class HeadsController < Api::ApplicationController
  before_action :set_head, only: [:show, :edit, :update, :destroy]

  # GET /heads
  # GET /heads.json
  def index
    @heads = Head.all
    return  render json: @heads.to_json(only: [:id, :image])
  end

  # GET /heads/1
  # GET /heads/1.json
  def show
  end

  # GET /heads/new
  def new
    @head = Head.new
  end

  # GET /heads/1/edit
  def edit
  end

  # POST /heads
  # POST /heads.json
  def create
    @head = Head.new(head_params)

    respond_to do |format|
      if @head.save
        format.html { redirect_to @head, notice: 'Head was successfully created.' }
        format.json { render :show, status: :created, location: @head }
      else
        format.html { render :new }
        format.json { render json: @head.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heads/1
  # PATCH/PUT /heads/1.json
  def update
    respond_to do |format|
      if @head.update(head_params)
        format.html { redirect_to @head, notice: 'Head was successfully updated.' }
        format.json { render :show, status: :ok, location: @head }
      else
        format.html { render :edit }
        format.json { render json: @head.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heads/1
  # DELETE /heads/1.json
  def destroy
    @head.destroy
    respond_to do |format|
      format.html { redirect_to heads_url, notice: 'Head was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_head
      @head = Head.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def head_params
      params.require(:head).permit(:image)
    end
end
