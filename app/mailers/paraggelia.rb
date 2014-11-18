class Paraggelia < ActionMailer::Base
  default from: "from@example.com"

  def paraggelia_mail(info)
  	email = "serafimalbatec@gmail.com"
  	@eponimia = info[:eponimia]
  	@drastiriotita = info[:drastiriotita]
  	@afm = info[:afm]
  	@dou  = info[:doy]
  	@edra  = info[:edra]
  	@tilefwno  = info[:tilefono]
  	@faks  = info[:faks]
  	@email  = info[:email]
  	@onoma  = info[:onoma]
  	@mnm  = info[:koimeno]
  	@sunolo = info[:sunolo]
  	@card = info[:card]
    @url  = 'http://localhost:3000/'
    mail(:to => email, :subject => "ΠΑΡΑΓΓΕΛΙΑ")
  end

  def paraggelia_mail_user(info)
    @email = info[:email]
    @eponimia = info[:eponimia]
    @drastiriotita = info[:drastiriotita]
    @afm = info[:afm]
    @dou  = info[:doy]
    @edra  = info[:edra]
    @tilefwno  = info[:tilefono]
    @faks  = info[:faks]
    @email  = info[:email]
    @onoma  = info[:onoma]
    @mnm  = info[:koimeno]
    @sunolo = info[:sunolo]
    @card = info[:card]
    @url  = 'http://localhost:3000/'
    mail(:to => @email, :subject => "ΠΑΡΑΓΓΕΛΙΑ")
  end

end
