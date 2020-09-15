class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ## associations
  has_many :exercises, :dependent => :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, class_name: "User"

  ## validations
  validates :first_name, :last_name, presence: true

  # instance methods
  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  ## class methods
  def self.search_by_name(name)
    name_array = name.split(' ')
    if name_array.size == 1
      where('first_name ILIKE ? or last_name ILIKE ?', "%#{name_array[0]}%", "%#{name_array[0]}%")
    else
      where('first_name ILIKE ? or last_name ILIKE ?', "%#{name_array[0]}%", "%#{name_array[1]}%")
    end
  end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) or self == new_friend
  end

  ## scopes
  scope :last_7_days, -> { joins(:exercises).where("exercises.created_at between ? and ? and users.id = ?", Time.now - 7.day, Time.now, self.id) }

  # default pagination
  self.per_page = 10
end
