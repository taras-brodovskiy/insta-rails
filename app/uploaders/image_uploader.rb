require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :default_url
  plugin :validation_helpers
  plugin :processing

  Attacher.default_url do |**options|
    '/placeholders/default.png'
  end

  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size 5*1024*1024 
  end

  process(:store) do |io, context|
    io.download do |original|
      ImageProcessing::MiniMagick
        .source(original)
        .resize_to_limit!(512, 512)
    end
  end
end

