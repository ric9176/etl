require 'rails_helper'

feature 'student_profiles' do
  context 'new student signs up' do
    before do
      student_sign_up
    end

    scenario 'a new student is directed to create a profile' do
      click_link 'My profile'
      expect(page).to have_content 'You do not have a profile yet'
      expect(page).to have_link 'Create Profile'
    end

    scenario 'a new student can fill out a new profile' do
      make_student_profile
      expect(page).to have_content('Test student')
      expect(page).to have_content('French')
      expect(page).to have_content('Learn english')
      expect(page).to have_content('studentskype')
    end

    context 'student tries to create profile without necessary fields' do
      scenario 'student must fill in name, native_language, and learning_objectives when creating a profile' do
        click_link 'My profile'
        click_link 'Create Profile'
        click_button 'Create Student profile'
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Native language can't be blank")
        expect(page).to have_content("Learning objectives can't be blank")
      end
    end
  end

  context 'student is already signed up' do
    before do
      student_sign_up
    end

    scenario 'students are directed to their specific profile page' do
      student_log_out_then_sign_in
      click_link 'My profile'
      expect(current_path).to eq '/student_profiles/9'
    end

    scenario 'student can view their profile' do
      make_student_profile
      student_log_out_then_sign_in
      click_link 'My profile'
      expect(page).to have_content "Test student"
      expect(page).to have_content "French"
      expect(page).to have_content "Learn english"
    end

    scenario 'students can edit their profiles' do
      make_student_profile
      click_link 'Edit profile'
      fill_in 'Name', with: 'Larry Johnson'
      fill_in 'Native language', with: 'French'
      fill_in 'Learning objectives', with: 'Edit this test'
      click_button 'Update Student profile'
      expect(page).to have_content('Larry Johnson')
      expect(page).to have_content('French')
      expect(page).to have_content('Edit this test')
    end

    context 'student tries to edit profile without necessary fields' do
      scenario 'student must fill in name, native_language, and learning_objectives when editing a profile' do
        make_student_profile
        click_link 'Edit profile'
        fill_in 'Name', with: ''
        fill_in 'Native language', with: ''
        fill_in 'Learning objectives', with: ''
        click_button 'Update Student profile'
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Native language can't be blank")
        expect(page).to have_content("Learning objectives can't be blank")
      end
    end
  end

  context 'not signed up/in' do
    scenario 'students cannot view profile when signed out' do
      visit '/dashboard'
      expect(page).not_to have_link 'My profile'
    end
  end

  context 'Find a teacher link only renders when appropriate' do
    it 'does not show Find a teacher link if student has not created a profile' do
      student_sign_up
      click_link 'My profile'
      expect(page).to_not have_link('Find a teacher')
    end

    it 'shows Find a teacher link if student does not have a teacher but does have a profile' do
      student_sign_up
      make_student_profile
      expect(page).to have_link('Find a teacher')
    end

    it 'does not show Find a teacher link if student has a confirmed teacher' do
      student = Student.create(email: 'student@test.com', password: 'testtest')
      student_profile = StudentProfile.create(name: 'test', native_language: 'test', learning_objectives: 'test')
      student.student_profile = student_profile
      teacher = Teacher.create(email: 'teacher@test.com', password: 'testtest')
      teacher_profile = TeacherProfile.create(name: 'Test Teacher', bio: 'I rock')
      teacher.teacher_profile = teacher_profile
      relationship = Relationship.create(student_id: student.id, teacher_id: teacher.id, request_status: true)
      student_sign_in
      click_link 'My profile'
      expect(page).to_not have_link('Find a teacher')
    end
  end
end
