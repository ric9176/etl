require 'rails_helper'

feature 'landing_page' do
  context 'first time student visits site' do
    scenario 'should show information about ETL and have navagation bar links' do
      visit '/'
      expect(page).to have_content 'Our range of services will help you learn English on your terms, focusing on your specific needs'
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
