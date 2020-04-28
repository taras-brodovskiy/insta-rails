class ImageUploader < Shrine
  plugin :default_url

  Attacher.default_url do |**options|
    '/placeholders/default.png'
  end
end
