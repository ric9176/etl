require 'rails_helper'

feature 'info' do
  context 'first time user visits site' do
    scenario 'should show information about ETL' do
      visit '/'
      expect(page).to have_content 'Can You Really Improve Your English From Home?'
    end
  end
end
