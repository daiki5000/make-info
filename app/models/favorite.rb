class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :info
end
