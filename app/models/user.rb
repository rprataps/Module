class User < ActiveRecord::Base
  has_many :checkouts
  has_many :books, through: :checkouts


  before_save { self.email = email.downcase }
#  validates :first_name, presence: true, length: { maximum: 50 }
#  validates :middle_name, presence: true, length: { maximum: 50 }
#  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
#  validates_uniqueness_of :user_type, :scope => :email { case_sensitive: false }
  validates :email, uniqueness: { scope: :user_type, case_sensitive: false  }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
#  validates :phone_number,   :presence => {:message => 'Phone number should be present!'},
#                    :numericality => true,
#                   :length => { :minimum => 10, :maximum => 15 }
#  validates :address_house, presence: true
#  validates :address_street, presence: true
#  validates :address_state, presence: true
   validates :user_type, presence: true

  def self.checkoutquery (id)
    checkouts = Checkout.where( users_id: id)
  end

  def self.search(query)
    where("email like ?", "%#{query}%") 
  end
end
