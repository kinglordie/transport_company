# app/models/reis.rb
class ReisTable < ApplicationRecord
    belongs_to :counterparty
    belongs_to :driver
    belongs_to :truck
    belongs_to :trailer
  
    # Добавьте необходимые валидации и методы, например, для вычисления суммы или статуса
  end
  