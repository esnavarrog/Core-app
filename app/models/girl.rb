class Girl < FilterableRecord

    extend FriendlyId
    friendly_id :name, use: :slugged
    mount_uploader :avatar, AvatarUploader
    mount_uploaders :gallery, GalleryUploader
    serialize :gallery, JSON
    mount_uploader :portada, PortadaUploader
    has_many :posts
    belongs_to :user
    has_many :poly_likes, as: :likeable
    validates :name, presence: {message: "El NOMBRE no puede estar en blanco"}
    validates :avatar, presence: {message: "La FOTO DE PORTADA no puede estar en blanco"}
    validates :price, presence: {message: "La PRECIO no puede estar en blanco"}
    enum service_type: [:escort, :massage, :virtual ]
    enum status: [:destacada, :normal]


    accepts_nested_attributes_for :posts, reject_if: :all_blank, allow_destroy: true
    
    x = 10000
    array = []
    while x <= 170000
        array << x
        x = x+5000
    end
        

    IDIOMA_LIST = ['Español', 'Español y Inglés', 'Inglés', 'Español y Francés', 'Frances', 'Español y Portuguéz', 'Portugues', 'Japonés', 'Chino', 'Alemán', 'Otro']
    ORAL_LIST = ['Oral C/C', 'Oral S/C', 'Oral S/C según higiene']
    OJOS_LIST = %w[Café Marrón Verdes Azules Miel Otro]
    CABELLO_LIST = ["Negro", "Pelirrojo", "Rubio", "Rosado", "Morado", "Fantasía"]
    HORARIO_LIST = ['Lunes a Viernes', 'Lunes a Sábado', 'Full time', 'Consultar', 'Solo Noche']
    DEPILACION_LIST = ['Completa', 'Brasilera', 'Cuadrado', 'Postal', 'Martini', 'Diamante', 'Corazón', 'Línea Bikini', 'Natural']
    TRABAJO_LIST = ['Depto. Propio', 'Depto. Propio, hoteles y domicilio', 'Hoteles y domicilio', 'Solo moteles', 'Solo domicilio']
    PRICE_LIST = array
    ADICIONALES_LIST = ['Sin adicionales', 'Adicionales consultar']
    FANTASIAS_LIST = ['Realizo fantasías', 'No realizo fantasías']
    POLOLA_LIST = ['Trato de polola', 'Atención porno', 'Amiga con ventaja', 'Atención de sumisa', 'Atención dominante']
    CONTACTOS_LIST = ['Contactos ilimitados', 'Solo un contacto', 'Dos contactos incluidos']
    BESOS_LIST = ['Full Besos', 'No doy besos', 'Besos apasionados']
    AMERICANA_LIST = ['Americana facial', 'Americana corporal', 'Americana real']
    COLITA_LIST = ['Full colita', 'Colita adicional', 'No hago cola', 'Consultar cola']
    GARGANTA_LIST = ['Garganta Profunda d/t', 'No hago garganta', 'Adicional garganta profunda']
    HORA_LIST = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23' ]
    MINUTOS_LIST = ['00', '15', '30', '45']
    COUNTRY_LIST = %w[Chilena Venezolana Argentina Brasileña Dominicana Cubana Colombiana Peruana Boliviana Española Otra]
    ESTATURA = (40..99).to_a
    KILOS = (20..100).to_a
    CM = (20..150).to_a

    def self.fetch(options = {})
        collection = super(options)
        # collection = search_filter(collection,["name", "service"], options)
        # collection = section_filter(collection,options)
        collection = attribute_filter(collection,"status",options)
    end


    def format_number
        if price != 'consultar'
            price.to_s.gsub(/\./, "")
        end
    end
end
