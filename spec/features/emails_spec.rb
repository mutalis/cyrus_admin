require 'rails_helper'

feature 'Emails administration' do

  background do
    # FactoryGirl.create_list(:email,10)
  end
  
  scenario 'delete an email succesfully', js: true do
    email_instance = FactoryGirl.create(:email)
    visit domain_emails_path(email_instance.domain)
    first('.btn.btn-danger', text: 'Delete').click
    page.evaluate_script('window.confirm();')
    expect(page).to have_content 'Email was successfully deleted.'
  end

  scenario 'add a email account succesfully', js: true do
    email_instance = FactoryGirl.create(:email)
    visit domain_emails_path(email_instance.domain)
    click_button('New Account')
    expect(page).to have_content('New Email Account')
    fill_in 'email username', with: 'laura'
    fill_in 'quota', with: '50'
    fill_in 'password', with: '12345678'
    fill_in 'confirm password', with: '12345678'
    click_button 'Save'
    expect(page).to have_content 'Email was successfully created.'
  end
  
  scenario 'dont create an email account when the input fields are empty', js: true do
    email_instance = FactoryGirl.create(:email)
    visit domain_emails_path(email_instance.domain)
    click_button('New Account')
    expect(page).to have_content('New Email Account')
    fill_in 'email username', with: ''
    fill_in 'quota', with: ''
    fill_in 'password', with: ''
    fill_in 'confirm password', with: ''
    click_button 'Save'
    # expect(find('.text-danger')).to have_content "Username can't be blank"
    # expect(find('#error_explanation').find('li')).to have_content "Username can't be blank"
    # expect(page).to have_selector('.text-danger', text: "Username can't be blank", visible: true)
    # within("#error_explanation") do
    #   expect(page).to have_content "Username can't be blank"
    # end
    expect(find('#email_username-error')).to have_content "This field is required."
    expect(find('#email_quota-error')).to have_content "This field is required."
    expect(find('#email_password-error')).to have_content "This field is required."
    expect(find('#email_confirmation_password-error')).to have_content "This field is required."
  end
  
  scenario 'update the email quota succesfully', js: true do
    email_instance = FactoryGirl.create(:email)
    visit domain_emails_path(email_instance.domain)
    fill_in 'email[quota]', with: '20'
    click_button 'Update quota'
    expect(page).to have_content 'quota updated to'
  end
  
  scenario 'dont update the email quota when the input value is not a number', js: true do
    email_instance = FactoryGirl.create(:email)
    visit domain_emails_path(email_instance.domain)
    fill_in 'email[quota]', with: 'not a number'
    click_button 'Update quota'
    expect(page).to have_content 'is not a number'
  end

  scenario 'change the email password succesfully', js: true do
    email_instance = FactoryGirl.create(:email)
    visit domain_emails_path(email_instance.domain)
    click_link('Change password')
    fill_in 'email[password]', with: '12345678'
    fill_in 'email[confirmation_password]', with: '12345678'
    click_button 'Change password'
    expect(page).to have_content 'password was changed'
  end

  scenario 'dont change the email password when the password confirmation is invalid', js: true do
    email_instance = FactoryGirl.create(:email)
    visit domain_emails_path(email_instance.domain)
    click_link('Change password')
    fill_in 'email[password]', with: '12345678'
    fill_in 'email[confirmation_password]', with: 'figdiojlkl'
    click_button 'Change password'
    expect(page).to have_content 'Please enter the same value again'
  end
end
