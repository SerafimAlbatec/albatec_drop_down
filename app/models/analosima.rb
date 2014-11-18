class Analosima < ActiveRecord::Base
	mount_uploader :image, ImageUploader # Error otan prosthetw sto kalathi!!
	#Mallon giati metatrepw to paidio se uplaod
	#Ti kanw se ola ta model

	def text_price
    ' ' +self.text + '---Τιμή: ' + self.price.to_s+ ' €' ' '
    end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |cards|
				csv << cards.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		spreadsheet = open_spreadsheet(file)
		  header = spreadsheet.row(1)
		  (2..spreadsheet.last_row).each do |i|
		    row = Hash[[header, spreadsheet.row(i)].transpose]
		    product = find_by_id(row["id"]) || new
		    product.attributes = row.to_hash
		    product.save!
		  end

	end

	def self.open_spreadsheet(file)
	  case File.extname(file.original_filename)
	  when ".csv" then Roo::Csv.new(file.path)
	  when ".xls" then Roo::Excel.new(file.path, file_warning: :ignore)
	  when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
	  else raise "Unknown file type: #{file.original_filename}"
	  end
	end
end
