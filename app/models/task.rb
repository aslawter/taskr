class Task < ActiveRecord::Base
  belongs_to :user 
  has_many :task_completions

  validates :body, presence: true
  validates :title, presence: true

  def self.not_completed
    where(completed: false)
  end
end
