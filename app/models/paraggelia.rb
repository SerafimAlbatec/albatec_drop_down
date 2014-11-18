class Paraggelia < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
