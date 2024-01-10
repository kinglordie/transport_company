class Counterparty < ApplicationRecord
    enum status: { active: 'Активен', inactive: 'Неактивен' }
    has_many :reis_tables
    validates :name, :contact, :INN, :email,:post,:status, presence: true
end