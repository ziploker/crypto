class Wallet < ApplicationRecord

	validates :abbr, presence: true,
                    length: { minimum: 3 }

    belongs_to :user


end
