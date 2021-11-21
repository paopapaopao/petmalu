class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable
  act_as_mentioner
end
