# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  status     :integer          default("to_do")
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :user

  enum status: %i(to_do doing done)

  validates :name, presence: true
end
