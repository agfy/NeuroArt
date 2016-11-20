class Task < ActiveRecord::Base
  belongs_to :user
  has_attached_file :style, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  has_attached_file :order, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  has_attached_file :result, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :style, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :order, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :result, content_type: /\Aimage\/.*\Z/
end
