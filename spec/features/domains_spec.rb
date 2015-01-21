require 'rails_helper'

feature 'Domains main page' do

  background do
    FactoryGirl.create_list(:domain,10)
  end

  scenario 'get access to the domains list', js: true do
    visit domains_path
    click_link('Domains')
    expect(page).to have_selector('table.table')
    # page.assert_selector('th', text: 'Domain', visible: true)
    expect(page).to have_selector('th', text: 'Domain', visible: true)
    expect(page).to have_link('Emails')
    # save_and_open_screenshot
    # page.save_screenshot('/tmp/screenshot.png', full: true)
  end
  
  scenario 'add a domain succesfully', js: true do
    visit domains_path
    click_link('Add Domain')
    expect(page).to have_content('New Domain')
    fill_in('Name', with: 'mutalis.org')
    fill_in('Quota', with: '987')
    click_button('Save')
    expect(page).to have_content('Domain was successfully created.')
  end
  
  scenario 'edit a domain succesfully', js: true do
    visit domains_path
    node=first('.btn.btn-default', text: 'Edit').click
    puts node.inspect
    expect(page).to have_content('Editing Domain')
    fill_in('Name', with: 'mutalis.org')
    fill_in('Quota', with: '300')
    click_button('Save')
    expect(page).to have_content('Domain was successfully updated.')
  end
  
  scenario 'delete a domain succesfully', js: true do
    visit domains_path
    first('.btn.btn-danger', text: 'Delete').click
    expect(page).to have_content('Domain was successfully destroyed.')
  end
  
  scenario 'get access to the emails list', js: true do
    FactoryGirl.create_list(:email,10)
    visit domains_path
    first('.btn.btn-default', text: 'Emails').click
    expect(page).to have_selector('th', text: 'Username', visible: true)
    expect(page).to have_selector('th', text: 'Quota Used', visible: true)
    expect(page).to have_link('Change Password')
  end
end
