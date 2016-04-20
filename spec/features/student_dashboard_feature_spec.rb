require 'rails_helper'

feature 'student_dashboards' do
  context 'new student signs up' do
    scenario 'once a student logs in, they should be able to view/edit their profile' do
      student_sign_up
      expect(current_path).to eq '/dashboard'
      expect(page).to have_link 'My profile'
      expect(page).to have_content "student@test.com's dashboard"
    end
    scenario 'student can see pending teacher requests on their dashboard' do
      student = Student.create(email: 'student@test.com', password: 'testtest')
      teacher = Teacher.create(email: 'teacher@test.com', password: 'testtest')
      teacher_profile = TeacherProfile.create(name: 'Test Teacher', bio: 'I rock out')
      teacher.teacher_profile = teacher_profile
      relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id, request_status: false)
      student_sign_in
      expect(page).to have_content 'Pending requests:'
      expect(page).to have_content 'Test Teacher'
    end

    scenario 'student can see current teacher on their dashboard' do
      student = Student.create(email: 'student@test.com', password: 'testtest')
      teacher = Teacher.create(email: 'teacher@test.com', password: 'testtest')
      teacher_profile = TeacherProfile.create(name: 'Test Teacher', bio: 'I rock out')
      teacher.teacher_profile = teacher_profile
      relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id, request_status: true)
      student_sign_in
      expect(page).to have_content 'Current teacher:'
      expect(page).to have_content 'Test Teacher'
    end
  end
end
