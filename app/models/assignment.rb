class Assignment < ApplicationRecord
    has_many :student_assignments, :dependent => :delete_all
    has_many :students, through: :student_assignments
    has_one_attached :pdf
    has_one_attached :playing_sample
    has_one_attached :accompaniment
    has_one_attached :student_pdf

end
