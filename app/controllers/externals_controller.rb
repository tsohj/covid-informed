class ExternalsController < ApplicationController
  before_action :set_external, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, only: %i[ new create edit update destroy ]

  # GET /externals or /externals.json
  def index
    @externals = External.where(nil).order('created_at ASC') # creates an anonymous scope
    @externals = @externals.filter_by_search(params[:search]) if (params[:search].present?)
  end

  # GET /externals/1 or /externals/1.json
  def show
  end

  # GET /externals/new
  def new
    @external = External.new
  end

  # GET /externals/1/edit
  def edit
  end

  # POST /externals or /externals.json
  def create
    @external = External.new(external_params)
    @external[:languages] = params[:external][:languages].first.split("\r\n").map(&:strip)

    respond_to do |format|
      if @external.save
        format.html { redirect_to @external, notice: "External was successfully created." }
        format.json { render :show, status: :created, location: @external }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /externals/1 or /externals/1.json
  def update
    @external[:languages] = params[:external][:languages].first.split("\r\n").map(&:strip)
    respond_to do |format|
      if @external.update(external_params)
        format.html { redirect_to @external, notice: "External was successfully updated." }
        format.json { render :show, status: :ok, location: @external }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /externals/1 or /externals/1.json
  def destroy
    @external.destroy
    respond_to do |format|
      format.html { redirect_to externals_url, notice: "External was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external
      @external = External.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def external_params
      params.require(:external).permit(:en_title, :en_source, :en_content, :en_external_link, :en_notes, :zh_tw_title, :zh_tw_source, :zh_tw_content, :zh_tw_external_link, :zh_tw_notes, :zh_cn_title, :zh_cn_source, :zh_cn_content, :zh_cn_external_link, :zh_cn_notes, :vi_title, :vi_source, :vi_content, :vi_external_link, :vi_notes, :hmn_title, :hmn_source, :hmn_content, :hmn_external_link, :hmn_notes, :languages, :last_version_date, :search)
    end
end
