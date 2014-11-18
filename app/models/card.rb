class Card < ActiveRecord::Base
	mount_uploader :image, ImageUploader ##Prepei na kanw ola ta idia pedia se olla ta modela to idio giati pleon exei allaksei o tupos image
end
