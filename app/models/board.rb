# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 50 }
  validates :title, format: { with: /\A(?!\@)/}


  validates :content, presence: true
  validates :content, length: { minimum: 10}
  validates :content, uniqueness: true

end
