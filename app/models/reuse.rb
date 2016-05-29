class Reuse < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :cod1, presence: true, length: { maximum: 7 }
  validates :cod2, presence: true, length: {maximum: 7}
  validates :name1, presence: true
  validates :name2, presence: true
  validates :note, presence: true, inclusion:  { in: 0..10  }
   default_scope -> { order(created_at: :desc) }
end
