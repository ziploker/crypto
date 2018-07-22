class Wallet < ApplicationRecord

	

	#validates :abbr, uniqueness: true


	has_and_belongs_to_many :rooms

    
    


end
