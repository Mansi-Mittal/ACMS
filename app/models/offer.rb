class Offer < ApplicationRecord
  has_attached_file :image, styles: { medium: "400x300>", thumb: "200x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :image

end
