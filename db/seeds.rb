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
ann = Teacher.create(name: "Ann", email: "ann@gmail.com", password: "s")

wind_ensemble = Course.create(name:"Wind Ensemble")
concert_band = Course.create(name: "Concert Band")

lauren = Student.create(school_id:"123456789", status: "inactive", name: "Lauren Y")
matteo = Student.create(school_id:"8765309", status: "inactive", name: "Matteo R")
wesley = Student.create(school_id:"00000000", status: "inactive", name: "Wesley C")
chris = Student.create(school_id:"1111111", status: "inactive", name: "Chris Z")
tyrion = Student.create(school_id:"22222222", status: "inactive", name: "Tyrion")

assignment1 = Assignment.create(title: "Assignment 1", excerpts: "", audios: "")
assignment2 = Assignment.create(title: "Assignment 2", excerpts: "", audios: "")
assignment3 = Assignment.create(title: "Assignment 3", excerpts: "", audios: "")
assignment4 = Assignment.create(title: "Assignment 4", excerpts: "", audios: "")
assignment5 = Assignment.create(title: "Assignment 5", excerpts: "", audios: "")
assignment6 = Assignment.create(title: "Assignment 6", excerpts: "", audios: "")
assignment7 = Assignment.create(title: "Assignment 7", excerpts: "", audios: "")

TeacherCourse.create(teacher: shewan, course: wind_ensemble)
TeacherCourse.create(teacher: shewan, course: concert_band)
TeacherCourse.create(teacher: ann, course: concert_band)

StudentCourse.create(student: lauren, course: wind_ensemble)
StudentCourse.create(student: chris, course: wind_ensemble)
StudentCourse.create(student: chris, course: concert_band)
StudentCourse.create(student: wesley, course: wind_ensemble)
StudentCourse.create(student: matteo, course: concert_band)
StudentCourse.create(student: tyrion, course: concert_band)


StudentAssignment.create(student: lauren, assignment: assignment1, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: lauren, assignment: assignment2, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: lauren, assignment: assignment3, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: lauren, assignment: assignment4, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: lauren, assignment: assignment5, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: lauren, assignment: assignment6, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: lauren, assignment: assignment7, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: matteo, assignment: assignment1, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: matteo, assignment: assignment2, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: matteo, assignment: assignment3, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: matteo, assignment: assignment4, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: matteo, assignment: assignment5, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: matteo, assignment: assignment6, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: matteo, assignment: assignment7, student_audio:"", tone: 3, expression: 2, rhythm: 4, submitted: true)
StudentAssignment.create(student: wesley, assignment: assignment1, student_audio:"", tone: 5, expression: 4, rhythm: 1, submitted: true)
StudentAssignment.create(student: wesley, assignment: assignment2, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: wesley, assignment: assignment3, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: wesley, assignment: assignment4, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: wesley, assignment: assignment5, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: wesley, assignment: assignment6, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: wesley, assignment: assignment7, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: chris, assignment: assignment1, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: chris, assignment: assignment2, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: chris, assignment: assignment3, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: chris, assignment: assignment4, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: chris, assignment: assignment5, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: chris, assignment: assignment6, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: chris, assignment: assignment7, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: tyrion, assignment: assignment1, student_audio:"sdsdsd", tone: 3, expression: 3, rhythm: 3, submitted: true)
StudentAssignment.create(student: tyrion, assignment: assignment2, student_audio:"sdsdsd", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: tyrion, assignment: assignment3, student_audio:"sdsdsd", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: tyrion, assignment: assignment4, student_audio:"sdsdsd", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: tyrion, assignment: assignment5, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: tyrion, assignment: assignment6, student_audio:"", tone: nil, expression: nil, rhythm: nil)
StudentAssignment.create(student: tyrion, assignment: assignment7, student_audio:"", tone: nil, expression: nil, rhythm: nil)