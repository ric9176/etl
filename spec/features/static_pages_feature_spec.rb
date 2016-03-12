require 'rails_helper'

feature 'static_pages' do
  context 'first time user visits site' do
    scenario 'should show information about ETL' do
      visit '/'
      expect(page).to have_content 'Can You Really Improve Your English From Home?'
      expect(page).to have_link 'WHY US'
    end

    scenario 'should allow users to link to other pages' do
      visit '/'
      click_link('WHY US')
      expect(current_path).to eq('/why_us')
    end
  end
end
