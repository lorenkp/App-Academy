# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author, presence: true
  validate :at_least_one_sub

  belongs_to :author, class_name: 'User'
  has_many :post_subs
  has_many :subs, through: :post_subs
  has_many :comments

  def at_least_one_sub
    unless self.subs.size > 0
      self.errors[:base] << "Must select at least one subforum"
    end
  end

  def top_level_comments
    self.comments.where("parent_comment_id IS NULL")
  end
end
