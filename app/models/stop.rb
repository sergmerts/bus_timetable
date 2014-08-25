class Stop < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :line
  belongs_to :station
end
