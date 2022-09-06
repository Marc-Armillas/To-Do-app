# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer
#
class Task < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true

  enum status: %i(to_do doing done)
end
