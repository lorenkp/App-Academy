class Comment < ActiveRecord::Base
  validates :content, :author, :post, presence: true

  belongs_to :parent, class_name: 'Comment'
  belongs_to :author, class_name: 'User'
  belongs_to :post
  has_many :replies, class_name: 'Comment', foreign_key: :parent__comment_id

end
