class Room < ApplicationRecord

belongs_to :user
belongs_to :battle

has_and_belongs_to_many :wallets



end
