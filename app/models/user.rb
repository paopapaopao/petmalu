class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # validates :first_name, presence: true
  # validates :last_name, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  attr_accessor :approved_before_update

  after_create :set_approved_before_update
  after_update :admin_new_user_approval
  after_update :user_approved

  acts_as_voter

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def set_approved_before_update
    @approved_before_update = approved?
  end

  def admin_new_user_approval
    if confirmed_at && !approved?
      UserMailer.admin_new_user_approval(id).deliver_later
    end
  end

  def user_approved
    if confirmed_at && approved? && !@approved_before_update
      set_approved_before_update
      UserMailer.user_approved.deliver_later
    end
  end
end
