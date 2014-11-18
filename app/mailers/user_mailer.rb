class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(info)
  	email = "serafimalbatec@gmail.com"
  	@thema = info[:thema]
  	@email = info[:email]
  	@koimeno = info[:koimeno]
    @url  = 'http://localhost:3000/'
    mail(:to => email, :subject => "Your Login credential")
  end
end
