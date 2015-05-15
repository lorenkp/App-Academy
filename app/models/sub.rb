class Sub < ActiveRecord::Base
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator, class_name: 'User'
  has_many :posts, inverse_of: :sub
end
