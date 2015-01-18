require 'rails_helper'

feature 'Domains main page' do

  scenario 'get access to the domains list', js: true do
    FactoryGirl.create_list(:domain,10)
    visit domains_path
    expect(page).to have_selector('table.table')
    # page.assert_selector('th', text: 'Domain', visible: true)
    expect(page).to have_selector('th', text: 'Domain', visible: true)
    expect(page).to have_link('Edit')
    # save_and_open_screenshot
    # page.save_screenshot('/tmp/screenshot.png', full: true)
  end

end
