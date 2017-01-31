class State < ApplicationRecord

  validates :name, presence: true
  validates :code, presence: true
  validates :stype, presence: true
  validates :code, uniqueness: true, presence: true
end
