# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Report < ActiveRecord::Base
  belongs_to :post
  has_one :user
  as_enum :type, nodality: 0, graphic: 1, others: 2
  
end
