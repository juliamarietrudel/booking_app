class UserMailer < ApplicationMailer
  def welcome_email
    @content = render_to_string(template: 'games/index', layout: false)
    mail(to: 'juliamarietrudel96@gmail.com', subject: 'Test 1')
  end
end
