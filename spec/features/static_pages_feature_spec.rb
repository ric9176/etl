require 'rails_helper'

feature 'static_pages' do
  context 'first time student visits site' do
    scenario 'should show information about ETL and have navagation bar links' do
      visit '/'
      expect(page).to have_content 'Can You Really Improve Your English From Home?'
      expect(page).to have_link 'Why Us'
      expect(page).to have_link 'Services'
      expect(page).to have_link 'Pricing'
    end

    scenario 'should have sign in link' do
      visit '/'
      expect(page).to have_link 'Student Sign In'
    end
  end
end
