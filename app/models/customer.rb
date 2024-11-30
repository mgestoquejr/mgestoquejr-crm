class Customer < ApplicationRecord
	validates :email, presence: true, uniqueness: { case_sensitive: false }

	validates :probability, numericality: { greater_than_or_equal_to: 0 }
end
