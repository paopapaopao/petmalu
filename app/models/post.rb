class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  acts_as_votable
end
