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
#

class Post < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable
  # gif pause/play   http://jsfiddle.net/eh6uat9j/
end
