class Product < ApplicationRecord

  has_attached_file :image, styles: { medium: "400x300>", thumb: "200x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  do_not_validate_attachment_file_type :image

#def self.search(query)
#    words = query.to_s.strip.split
#    words.inject(scoped) do |combined_scope, word|
#      combined_scope.where("name LIKE ? OR category LIKE ?", "%#{word}%")
#    end
 # end
end
