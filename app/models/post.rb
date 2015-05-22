# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note       :string
#  tags       :string
#  image      :string
#  publish    :boolean
#

class Post < ActiveRecord::Base
  validates :note, presence: true
  validates :image, presence: true
  belongs_to :user
  acts_as_commentable
  has_many :favorites
  has_many :users, :through => :favorites
  has_many :reports
  # gif pause/play   http://jsfiddle.net/eh6uat9j/
end
