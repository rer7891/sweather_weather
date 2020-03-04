class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_type :image
  attribute :url do |image|
    image.define_image
  end 
end
