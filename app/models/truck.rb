class Truck < ApplicationRecord
    enum status: { decommissioned: 'Списан', operating: 'Работает', in_repair: 'На ремонте', idle: 'Простаивает' }
  
    validates :car_number, :model, :year, :VIN, :STS, :status, presence: true
    has_many :truck_repairs
    has_many :fuels
    has_many :reis_tables
    has_one_attached :photo
    def humanized_status
        case status
        when 'decommissioned'
          'Списан'
        when 'operating'
          'Работает'
        when 'vacation'
          'Отпуск'
        when 'in_repair'
          'На ремонте'
        when 'idle'
          'Простаивает'
        else
          status.titleize
        end
      end
end
  