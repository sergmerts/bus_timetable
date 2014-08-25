class Stop < ActiveRecord::Base
  validates :number, presence: true
end
