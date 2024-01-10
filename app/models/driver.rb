class Driver < ApplicationRecord
    enum status: { working: 'Работает', free: 'Свободен', vacation: 'Отпуск', sick_leave: 'Больничный', fired: 'Уволен' }

    validates :lastname, :name, :patronymic, :dr_license, presence: true
    has_one_attached :photo
    has_many :salaries
    has_many :reis_tables
    def humanized_status
        case status
        when 'working'
          'Работает'
        when 'free'
          'Свободен'
        when 'vacation'
          'Отпуск'
        when 'sick_leave'
          'Больничный'
        when 'fired'
          'Уволен'
        else
          status.titleize
        end
      end
end
