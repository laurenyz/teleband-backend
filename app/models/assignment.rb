class Assignment < ApplicationRecord
    has_many :student_assignments, :dependent => :delete_all
    has_many :students, through: :student_assignments
    has_one_attached :sample_audio
    has_one_attached :accompaniment_audio

end
