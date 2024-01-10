class TruckRepair < ApplicationRecord
    belongs_to :truck
    validates :date_repair, :part_name, :price, presence: true
end
