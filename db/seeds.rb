# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StudentAssignment.destroy_all
TeacherCourse.destroy_all
StudentCourse.destroy_all
Assignment.destroy_all
Teacher.destroy_all
Course.destroy_all
Student.destroy_all



shewan = Teacher.create(name: "Shewan", email: "Shewan@gmail.com", password: "s")

wind_ensemble = Course.create(name:"Wind Ensemble")

lauren = Student.create(school_id:"123456789", status: "inactive", name: "Lauren Y")

assignment1 = Assignment.create(title: "Assignment 1", excerpts: "", audios: "")

TeacherCourse.create(teacher: shewan, course: wind_ensemble)

StudentCourse.create(student: lauren, course: wind_ensemble)

StudentAssignment.create(student: lauren, assignment: assignment1, student_audio:"", tone: nil, expression: nil, rhythm: nil)