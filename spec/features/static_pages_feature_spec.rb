require 'rails_helper'

feature 'static_pages' do
  context 'first time user visits site' do
    scenario 'should show information about ETL and have navagation bar links' do
      visit '/'
      expect(page).to have_content 'Can You Really Improve Your English From Home?'
      expect(page).to have_link 'Why Us'
      expect(page).to have_link 'Services'
      expect(page).to have_link 'Pricing'
      expect(page).to have_link 'Book a Free Lesson'
      expect(page).to have_link 'Contact'
      expect(page).to have_link 'Blog'
    end

    scenario 'should allow users to link to other pages' do
      visit '/'
      click_link('Why Us')
      expect(current_path).to eq('/why_us')
    end

    scenario 'should have sign in link' do
      visit '/'
      expect(page).to have_link 'Sign in'
    end
  end
end
