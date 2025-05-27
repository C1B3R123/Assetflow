# app/models/loan.rb
class Loan < ApplicationRecord
  belongs_to :asset
  enum status: { pending: 0, returned: 1 }
  validates :loan_date, presence: true
  validates :borrower_name, presence: true
end