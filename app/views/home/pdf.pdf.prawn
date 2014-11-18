pdf.text "Paraggelia Albatec"

pdf.move_down(30)


items = @paraggelia.map do |order| 
  [
    order.text,
    order.amount,
    order.artikel,
    number_to_currency(order.price)
  ]
end




pdf.table(items, :cell_style => 
                 {:border_lines => [:dotted, :dotted,:dotted,:dotted]},
                 :row_colors => ["FFFFFF","DDDDDD"]
         )



pdf.move_down(10)

pdf.text "Total Price: #{number_to_currency(@sunolo)}", :size => 16, :style => :bold
