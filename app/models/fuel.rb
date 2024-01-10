class Fuel < ApplicationRecord
    belongs_to :truck
    validates :date, :truck_id, :fuel_l, :price, :type_f, presence: true

    enum type_f: { ai_92: 'АИ-92', ai_95: 'АИ-95', ai_98: 'АИ-98', ai_100: 'АИ-100', 
               methane: 'Метан', propane: 'Пропан', diesel: 'Дизель', 
               electricity: 'Электричество', hydrogen: 'Водород' }
end
