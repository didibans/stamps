require "rqrcode"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stamp_cards
  has_one_attached :qrcode, dependent: :destroy
  after_create :generate_qrcode

  private

  # def generate_qr_code
  #   qr = RQRCode::QRCode.new(self)

  #   @svg = qr.as_svg(
  #     color: "000",
  #     shape_rendering: "crispEdges",
  #     module_size: 11,
  #     standalone: true,
  #     use_path: true
  #   )
  # end

  def generate_qrcode
    # Get the host
    # host = Rails.application.routes.default_url_options[:host]
    # host = Rails.application.config.action_controller.default_url_options[:host]

    # Create the QR code object
    # qrcode = RQRCode::QRCode.new("http://#{host}/posts/#{id}")
    qrcode = RQRCode::QRCode.new("#{self.id}")

    # Create a new PNG object
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 1,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 250
    )

    # Attach the QR code to the active storage
    self.qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png"
    )
  end
end
