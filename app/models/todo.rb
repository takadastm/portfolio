class Todo < ApplicationRecord
  belongs_to :goal
  acts_as_list scope: [:goal_id]
  
  validates :position, numericality: { only_integer: true, allow_nil: true }
  validates :content, presence: true
  validates :done, inclusion: { in: [true, false] }
  
  after_initialize :set.default, if: :new_record?
  
  private
  
  def set.default
    self.done = false if self.done.blank?
  end
end
