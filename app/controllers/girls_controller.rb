class GirlsController < ApplicationController
  before_action :set_girl, only: %i[ show edit update destroy ]

  # GET /girls or /girls.json
  def index
    @girls = Girl.all
  end

  # GET /girls/1 or /girls/1.json
  def show
    options = params
    @post = @girl.posts.build
    options = options.merge({girl_id: @girl.id })
    @posts = Post.fetch(options)
    # @posts = @girl.posts.order(created_at: :desc).page params[:page]
    @like = PolyLike.find_by(likeable_id:@girl.id, likeable_type:'Girl')
    gallery = @girl.gallery_urls.last(8)
    gallery.slice!(0)
    @gallery = gallery
    @gallery_first = @girl.gallery_urls[0]
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
    @girl = Girl.create(girl_params)
    @girl.user = current_user
    respond_to do |format|
      if @girl.save
        format.html { redirect_to @girl, notice: "Girl was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def mis_chicas
    @girls = PolyLike.where(user_id:current_user.id, likeable_type:'Girl')
  end

  def formulary_inscription
    
  end

  # PATCH/PUT /girls/1 or /girls/1.json
  def update
    if @girl.update(girl_params)
      respond_to do |format|
        format.html {redirect_to @girl}
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
      @girl = Girl.friendly.find(params[:id])
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
        :chat,
        :busto,
        :cadera,
        :cintura,
        :pagos,
        :modalidad,
        :service_type, 
        gallery:[]
        )
    end
end
