class TrailerRepair < ApplicationRecord
    belongs_to :trailer
    validates :date_repair, :part_name, :price, presence: true
end
