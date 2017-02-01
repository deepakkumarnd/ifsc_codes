class Bank < ApplicationRecord
  validates :name, presence: true
  validates :nbin, presence: true
  validates :nbin, uniqueness: true
  validates :nbin, numericality: true
  validates :default_ifsc, uniqueness: true, allow_blank: true
  validates :ifsc_prefix, uniqueness: true, allow_blank: true
end
