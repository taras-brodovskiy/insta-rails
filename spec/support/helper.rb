module TestData
  module_function
 
  def image_data
    attacher = Shrine::Attacher.new
    attacher.set(uploaded_image)
 
    attacher.column_data
  end
 
  def uploaded_image
    file = File.open(Rails.root.join('spec/fixtures/default.png'), binmode: true)
 
    # for performance we skip metadata extraction and assign test metadata 
    uploaded_file = Shrine.upload(file, :store, metadata: false)
    uploaded_file.metadata.merge!(
      "size"      => File.size(file.path),
      "mime_type" => "image/png",
      "filename"  => "default.png",
    )
 
    uploaded_file
  end
end
