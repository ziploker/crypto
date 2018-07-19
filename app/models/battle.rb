class Battle < ApplicationRecord

	has_many :rooms
	has_many :users, through: :rooms

	has_many :wallets

end
