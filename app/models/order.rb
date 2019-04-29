class Order < ApplicationRecord
	belongs_to :user, optional: true
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items
	belongs_to :cart, optional: true 
	enum delivery_status: { "出荷準備中": 0, "出荷準備完了": 1, "出荷済み": 2, "完了": 3, "トラブル対処中": 4 }
end
