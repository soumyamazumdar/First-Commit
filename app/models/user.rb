class User < ApplicationRecord
has_secure_password

has_many :transactions, dependent: :destroy
has_many :stocks, through: :transactions

validates :name, presence: true, length: {minimum: 5}

end
