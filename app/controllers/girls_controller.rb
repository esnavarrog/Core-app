class GirlsController < ApplicationController
  before_action :set_girl, only: %i[ show edit update destroy ]

  # GET /girls or /girls.json
  def index
    @girls = Girl.all
  end

  # GET /girls/1 or /girls/1.json
  def show
  end

  # GET /girls/new
  def new
    @girl = Girl.new
  end

  # GET /girls/1/edit
  def edit
  end

  # POST /girls or /girls.json
  def create
    @girl = Girl.new(girl_params)
    @girl.price = params[:price].gsub(/[^.]/, '')
    respond_to do |format|
      if @girl.save
        # format.js
        format.html { redirect_to @girl, notice: "Girl was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /girls/1 or /girls/1.json
  def update
    if @girl.update(girl_params)
      respond_to do |format|
        format.html { redirect_to @girl, notice: "Girl was successfully updated." }
      end
    end
  end

  # DELETE /girls/1 or /girls/1.json
  def destroy
    @girl.destroy
    respond_to do |format|
      format.html { redirect_to girls_url, notice: "Girl was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_girl
      @girl = Girl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def girl_params
      params.require(:girl).permit(
        :name, 
        :address, 
        :description, 
        :price, 
        :avatar,
        :portada,
        :body,
        :horario,
        :idioma,
        :depilacion,
        :cabello,
        :ojos,
        :kilos,
        :phone,
        :ubicacion,
        :nacionalidad,
        :edad,
        :estatura,
        :garganta,
        :colita,
        :americana,
        :caricias,
        :contactos,
        :media,
        :polola,
        :oral,
        :fantasias,
        :certificada,
        :visits_count,
        :horaE,
        :horaS,
        :minutosE,
        :minutosS,
        :virtual,
        :presencial,
        :videollamadas,
        :llamadas,
        :chat)
    end
end
