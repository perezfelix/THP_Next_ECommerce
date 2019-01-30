# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  total      :decimal(, )      not null
#  status     :integer          default("biding")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  validates :status, presence: true
  validates :total, presence: true,
                    numericality: true

  before_save :update_total

  enum status: %i[biding validated treated]

  private

    def update_total
      self.total = order_items.pluck(:subtotal).sum
    end
end