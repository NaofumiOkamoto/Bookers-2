class Book < ApplicationRecord
  belongs_to :user
  attachment :profile_image #refileを使うために必要
end
