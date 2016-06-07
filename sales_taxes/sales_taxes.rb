# class Item
#   attr_accessor :input, :price
#
#   # @@array = []
#   # total = 0
#
#   def initialize(input, price)
#     @input = input
#     @price = price
#
#     # @array << Item.new(input, price)
#
#   end
#
#   def self.create(input, price)
#     new_item = self.new(input, price)
#     @@array << new_item
#     ####
#     # for i in 0...@@my_array.length
#     #   @@array[i].map! { |x| x.split(" at ") }
#     # end
#     ####
#     new_item
#   end
# end
#
# class Local_bfm < Item
#   def tax
#     pre_tax_price = @price
#     just_the_tax = pre_tax_price * 0
#     @price += just_the_tax
#   end
# end
# class Local_not_bfm < Item
#   def tax
#     pre_tax_price = @price
#     just_the_tax = (pre_tax_price * 0.1)
#     @price += just_the_tax
#   end
# end
# class Import_bfm < Item
#   def tax
#     pre_tax_price = @price
#     just_the_tax = (pre_tax_price * 0.05)
#     @price += just_the_tax
#   end
# end
# class Import_not_bfm < Item
#   def tax
#     pre_tax_price = @price
#     just_the_tax = (pre_tax_price * 0.15)
#     @price += just_the_tax
#   end
# end
#
# class Receipt
# end


##################################

book = Local_bfm.create("1 book", 12.49)
music = Local_not_bfm.create("1 music CD", 14.99)
chocolate = Local_not_bfm.create("1 chocolate bar", 0.85)
import_chocolate1 = Import_bfm.create("1 imported box of chocolates", 10.00)
import_perfume1 = Import_not_bfm.create("1 imported bottle of perfume", 47.50)
import_perfume2 = Import_not_bfm.create("1 imported bottle of perfume", 27.99)
perfume1 = Local_not_bfm.create("1 bottle of perfume", 18.99)
head_pills = Local_bfm.create("1 packet of headache pills", 9.75)
import_chocolate2 = Import_bfm.create("1 box of imported chocolates", 11.25)

###################################

# puts "Please list your items and prices(type \'exit\' to check out):"
#
# array = []
#
# loop do
#   input = gets
#   array << input
#   break if input.include?("exit")
# end
#
# array.pop
#
# array.map! { |x| x.split(" at ") }
# just_the_tax = 0

###################################


puts "Please list your items and prices(type \'exit\' to check out):"

array = []

loop do
  input = gets
  array << input
  break if input.include?("exit")
end

array.pop

array.map! { |x| x.split(" at ") }
just_the_tax = 0

for i in 0...array.length
  array[i][1] = array[i][1].to_f
  if array[i][0].include?("imported") && array[i][0].include?("perfume" || "music")
    import_not_bfm_tax = (array[i][1]*1.15).round(2)
    just_the_tax += (import_not_bfm_tax - array[i][1])
    array[i][1] = (array[i][1]*1.15).round(2)
  elsif array[i][0].include?("imported")
    import_bfm_tax = (array[i][1]*1.05).round(2)
    just_the_tax += (import_bfm_tax - array[i][1])
    array[i][1] = (array[i][1]*1.05).round(2)
  elsif array[i][0].include?("perfume") || array[i][0].include?("music")
    local_not_bfm_tax = (array[i][1]*1.10).round(2)
    just_the_tax += (local_not_bfm_tax - array[i][1])
    array[i][1] = (array[i][1]*1.10).round(2)
  end
end

total = 0

for i in 0...array.length
  puts "#{array[i][0]}: #{array[i][1]}"
  total += array[i][1]
end

puts "Total taxes: #{just_the_tax.round(2)}"
puts "Total cost: #{total.round(2)}"
