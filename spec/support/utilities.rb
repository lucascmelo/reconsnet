def sign_in(user)
  visit new_user_session_path
  fill_in 'Email',    with: user.email
  fill_in 'Senha', with: user.password
  click_button 'Entrar'
end


def in_browser(name)
  old_session = Capybara.session_name

  Capybara.session_name = name
  yield

  Capybara.session_name = old_session
end