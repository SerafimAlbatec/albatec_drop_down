class HomeController < ApplicationController

  before_action :check_auth, only: [:kalathi, :paraggelia, :paraggelia_send]
  before_action :admin_panel, only: [:admin]

  def check_auth
    if (!user_signed_in?)
      redirect_to home_index_path
    end
  end

  def admin_panel
    if (current_user.email != "serafimntavranis@hotmail.com")
      redirect_to home_index_path
    end
  end
  

  def index
  	@image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
  	@image_logo_bohme = Photo.where(:name => 'bohme_logo.jpg').first
  end

  def mixanimata
  	@image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
  end

  def software
  	@image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
  end

  def uphresies
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
  end

  def epikoinonia
    #Κάνω render το _epoikononia.html.erb και μετα αυτο κανει με το form ->
    #post που το αλλαξα και κοιταει στο epikoinonia_send 
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first  
  end

  def epikoinonia_send
    info = {:thema => params[:thema], :email => params[:email], :koimeno => params[:koimeno]}
    UserMailer.welcome_email(info).deliver
  end

  def analosima
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
    #@analosima = Analosima.where(wgr: (93000..93001))    #Εδω θα βαλω αρχικη σελιδα!!!
    #respond_to do |format|
    #  format.html
    #  format.json { render json: @analosima}
    #end
  end

  def analosima_lipantika
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
    @analosima = Analosima.where(wgr: (93000..93020)).order(:wgr)
    #render home_analosima_path
  end

  def analosima_router
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
    @analosima_router = Analosima.where(wgr: (91000..91141)).order(:wgr)
    @eeooo = Analosima.where(:wgr => "91000").first, Analosima.where(:wgr => "91001").first, Analosima.where(:wgr => "91003").first, Analosima.where(:wgr => "91004").first, Analosima.where(:wgr => "91005").first, Analosima.where(:wgr => "91010").first, Analosima.where(:wgr => "91011").first, Analosima.where(:wgr => "91012").first, Analosima.where(:wgr => "91021").first, Analosima.where(:wgr => "91022").first, Analosima.where(:wgr => "91023").first, Analosima.where(:wgr => "91024").first, Analosima.where(:wgr => "91025").first, Analosima.where(:wgr => "91026").first, Analosima.where(:wgr => "91027").first, Analosima.where(:wgr => "91029").first, Analosima.where(:wgr => "91030").first, Analosima.where(:wgr => "91031").first, Analosima.where(:wgr => "91032").first, Analosima.where(:wgr => "91033").first, Analosima.where(:wgr => "91034").first
    @router = Card.new
  end

  def analosima_router_send ####ELEGXO GIA KINES EGGRAFES
    a = 0;
    @neo = Card.where(:user_id => current_user.id) #Pernw ola ta proigoumena tou xristi apo tin karta tou
    @neo.each do |n|
      if ( n.artikel == card_params[:artikel])
        a = a+1
      end
    end
    if (a==0) ## Den to prosthetw stin karta an einai to idio
    @router = Card.new()
    @auto_pou_tha_vrw_apo_to_artikel = Analosima.where(:artikel => card_params[:artikel]).first
    @router.artikel = @auto_pou_tha_vrw_apo_to_artikel.artikel
    @router.text = @auto_pou_tha_vrw_apo_to_artikel.text
    @router.price = @auto_pou_tha_vrw_apo_to_artikel.price
    @router.image = @auto_pou_tha_vrw_apo_to_artikel.image
    @router.amount = 1
    @router.user_id = current_user.id
    @router.save 
    redirect_to home_analosima_router_path  #Οταν υπαρχει ειδι μεσα κανω redirect απο εδω
  end
  if (a != 0) #Οταν δεν παταω ιδιο κανω redirect απο εδω
  redirect_to home_analosima_router_path
  end

  end

  def card
    a = 0;
    @neo = Card.where(:user_id => current_user.id) #Pernw ola ta proigoumena tou xristi apo tin karta tou
    @neo.each do |n|
      if ( n.artikel == params[:artikel])
        redirect_to home_index_path  #######Den ginetai giati kanw prwta update sto view
        a = a+1
      end
    end
    if (a==0) ## Den to prosthetw stin karta an einai to idio
    @result = Card.new()
    @auto_pou_tha_vrw_apo_to_ertikel = Analosima.where(:artikel => params[:artikel]).first
    @result.artikel = @auto_pou_tha_vrw_apo_to_ertikel.artikel
    @result.text = @auto_pou_tha_vrw_apo_to_ertikel.text
    @result.price = @auto_pou_tha_vrw_apo_to_ertikel.price
    @result.image = @auto_pou_tha_vrw_apo_to_ertikel.image
    @result.amount = 1
    @result.user_id = current_user.id
    @result.save 
  end
  end

  def kalathi
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
    @order = Card.where(:user_id => current_user.id) #Pali edw thelw analoga me ton xristi kai meta na ta svinw kiolas sto checkout
    @sunolo = 0;
    @order.each do |a| #Γινεται και αυτοματα με το update γιατι ανανεονετε η σελιδα!!
      @sunolo = @sunolo + a.price
    end
    @number = Card.where(:user_id => current_user.id).count
  end

  def destroy
    @game = Card.find(params[:id])
    @game.destroy
    redirect_to home_kalathi_path
  end

  def update
    @update = Card.where(:artikel => params[:artikel], :user_id => current_user.id).first # Οταν εχω δυο ιδια προιοντα με ιδιο artikel εχω λαθος γιατι ανανεωνει μονο το ενα!!! Θέλω έλεγχο
    @analosima = Analosima.where(:artikel => params[:artikel]).first
    if ( params[:amount].to_i > 0)
      @update.amount = params[:amount].to_i
      @update.price = ( @analosima.price * params[:amount].to_i ).ceil
      @update.save
    else
      @update.destroy
    end
  end

  def paraggelia #Me to checkout na diagrafontai oi eggrafes
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
  end

  def paraggelia_send
    @paraggelia = Card.where(:user_id => current_user.id)
    @sunolo = 0;
    @paraggelia.each do |a| #Γινεται και αυτοματα με το update γιατι ανανεονετε η σελιδα!!
      @sunolo = @sunolo + a.price
    end
    info = {:eponimia => params[:eponimia], :drastiriotita => params[:drastiriotita], :afm => params[:afm], :doy => params[:doy], :edra => params[:edra], :tilefono => params[:tilefono], :faks => params[:faks], :email => current_user.email, :onoma => params[:onoma], :koimeno => params[:koimeno], :sunolo => @sunolo, :card => @paraggelia}
    Paraggelia.paraggelia_mail(info).deliver
    Paraggelia.paraggelia_mail_user(info).deliver
    Card.delete_all.where(:user_id => current_user.id)
    redirect_to home_index_path
  end

  def pdf 
    @paraggelia = Card.where(:user_id => current_user.id)
    @sunolo = 0;
    @paraggelia.each do |a| #Γινεται και αυτοματα με το update γιατι ανανεονετε η σελιδα!!
      @sunolo = @sunolo + a.price
    end
  end

  def admin
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
    @analosimo = Analosima.new
  end

  def admin_send
    @analosimo = Analosima.new(poll_params)
    @analosimo.save
    redirect_to home_index_path
  end

  def export
    @cards = Analosima.all
    respond_to do |format|
      format.csv { render text: @cards.to_csv}
      format.xls { render text: @cards.to_csv(col_sep: "\t") }
    end 
  end

  def import
    # Prepei na katastrefw kai tis kartes oles
    #Try catch
    @analosima = Analosima.all
    @analosima.each do |analosima|
        analosima.destroy
     end
    Analosima.import(params[:file])
    redirect_to home_index_path
  end

  def faq
    @image_logo_albatec = Photo.where(:name => 'Logo.jpg').first
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:analosima).permit(:artikel, :wgr, :text, :price, :image)
    end

    def card_params
      params.require(:card).permit(:artikel)
    end



end
