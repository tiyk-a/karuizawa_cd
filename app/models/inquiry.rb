class Inquiry < ApplicationRecord
    belongs_to :user
    enum inquiry_category: { "お買い物": 0, "商品について": 1, "ユーザーについて": 2}
    # belongs_to :inquiry_reply
end
