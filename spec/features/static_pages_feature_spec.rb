require 'rails_helper'

feature 'static_pages' do
  context 'first time user visits site' do
    scenario 'should show information about ETL' do
      visit '/static_pages/home'
      expect(page).to have_content 'Can You Really Improve Your English From Home?'
      expect(page).to have_link 'WHY US'
    end

    scenario 'should allow users to link to other pages' do
      visit '/static_pages/home'
      click_link('WHY US')
      expect(current_path).to eq('/static_pages/why_us')
    end
  end
end
