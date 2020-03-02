class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_type :image
  attributes :id, :url
end
