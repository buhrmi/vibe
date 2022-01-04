require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  teardown do 
    next if passed?
    logs = page.driver.browser.manage.logs.get(:browser)
    if logs.present?
      message = logs.map(&:message).reject { |m| m.include? 'unknown prop' }.reject { |m| m.include? 'unexpected slot' }.join("\n")
      puts message
    end
  end
  
  test "a user can sign up, log out, change password, log in" do
    visit '/'

    fill_in 'username', with: 'test'
    fill_in 'email', with: 'derp@derp.com'
    fill_in 'password', with: 'derpderp'
    click_on 'Sign up'
   
    click_on 'Log out'
    assert_text 'You have been logged out.'

    click_on 'Log in'

    fill_in 'email', with: 'derp@derp.com'
    fill_in 'password', with: 'wrongpass'

    click_on 'login'

    assert_text 'Email or password is incorrect. Please try again.'

    click_on 'Forgot your password?'
    
    fill_in 'email', with: 'derp@derp.com'
    click_on 'Send reset link'
    assert_text 'Email sent'

    mail = ActionMailer::Base.deliveries.last
    url = mail.body.match(/(\/password_resets\/.*)/)[1]
    visit url

    fill_in 'password', with: 'newpass'
    fill_in 'password_confirmation', with: 'newpass'

    click_on 'Save password'
    
    fill_in 'email', with: 'derp@derp.com'
    fill_in 'password', with: 'newpass'
    click_on 'login'

    assert_text 'You have been logged in.'
  end
end