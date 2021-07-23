class SyllabusSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :image_url, :category_id, :category #(the last attribute allows us to see the associated category inside the attributes object. Could also include it in the controller.)
  # belongs_to :category
end
