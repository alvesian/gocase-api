require 'date'

class Batch < ApplicationRecord
  has_many :orders

  validates :reference, presence: true
  validates :purchase_channel, presence: true

  before_validation :define_reference

  def define_reference
    if Batch.last.nil?
      batch_old = 0
    else
      batch_old = Batch.all.last
      batch_old = batch_old[:id]
    end
    self.reference = (Date.today.strftime('%Y%m') + '-' + (batch_old + 1).to_s)
  end
end
