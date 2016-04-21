require 'rails_helper'

feature 'class_materials' do
  context 'teacher makes new class materials' do
    scenario 'teacher can click link to add new class materials for current students', focus: true do
      teacher = Teacher.create(email: 'teacher@test.com', password: 'test12345')
      student = Student.create(email: 'student@test.com', password: 'test12345')
      student_profile = StudentProfile.create(name: 'Test student', native_language: 'I rock out', learning_objectives: 'Learn english')
      student.student_profile = student_profile
      relationship = Relationship.create(request_status: true, student_id: student.id, teacher_id: teacher.id)
      teacher_sign_in('teacher@test.com', 'test12345')
      click_link 'Add class'
      fill_in 'Date', with: 'March 10th'
      fill_in 'Link', with: 'testlink.com'
      click_button 'Create Class material'
      click_link 'Log out'
      student_sign_in(email: 'teacher@test.com', password: 'test12345')
      expect(page).to have_content('testlink.com')
    end
  end
end
