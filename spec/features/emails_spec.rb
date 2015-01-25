require 'rails_helper'

feature 'Emails administration' do

  background do
    FactoryGirl.create_list(:email,10)
  end
  
  scenario 'delete an email succesfully', js: true do
    visit emails_path
    first('.btn.btn-danger', text: 'Delete').click
    expect(page).to have_content('Email was successfully destroyed.')
  end

  scenario 'add a email account succesfully', js: true do
    visit emails_path
    click_button('New Account')
    expect(page).to have_content('New Email Account')
    fill_in('Username', with: 'laura')
    fill_in('Quota', with: '999')
    click_button 'Save'
    expect(page).to have_content 'Email was successfully created.'
  end
  
  scenario 'dont create an email account when the username is empty', js: true do
    visit emails_path
    click_button('New Account')
    expect(page).to have_content('New Email Account')
    fill_in('Username', with: '')
    fill_in('Quota', with: '999')
    click_button 'Save'
    # expect(find('.text-danger')).to have_content "Username can't be blank"
    # expect(find('#error_explanation').find('li')).to have_content "Username can't be blank"
    # expect(page).to have_selector('.text-danger', text: "Username can't be blank", visible: true)
    within("#error_explanation") do
      expect(page).to have_content "Username can't be blank"
    end
  end
end
