class Customer < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :probability, numericality: { greater_than_or_equal_to: 0 }

  enum :stage, closed: "closed", contacted: "contacted", diligence: "diligence", lead: "lead", rejected: "rejected"

  def full_name
    "#{first_name} #{last_name}"
  end
end
