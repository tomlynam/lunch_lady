# user chooses from a list of main dishes
@mains = {
	1 => 'Meatloaf', 
	2 => 'Mystery Meat', 
	3 => 'Slop'
}

@sides = {
	1 => 'Carrots', 
	2 => 'Mystery Yogurt', 
	3 => 'Beef Jerkey'
}

@price = {
	'Meatloaf' => 5.00,
	'Mystery Meat' => 3.00, 
	'Slop' => 1.00,
	'Carrots' => 1.75, 
	'Mystery Yogurt' => 1.00, 
	'Beef Jerkey' => 0.5
}

# main dishes and side items have descriptions with them and the user 
# has an option to view the description before they order (hint: think hashes)

# descriptions of food can have multiple options like nutritional facts, 
# calories, fat content ect...(hint: think nested hashes)


# display to the user not only their total but the total fat content / calories / carbs / ect...

@description = { 'Meatloaf' => { calories: 450, fat: 30, carbs: 45}, 
				 'Mystery Meat' => { calories: 600, fat: 25, carbs: 20}, 
				 'Slop' => { calories: 300, fat: 15, carbs: 40}, 
				 'Carrots' => { calories: 450, fat: 6, carbs: 2}, 
				 'Mystery Yogurt' => { calories: 450, fat: 50, carbs: 15}, 
				 'Beef Jerkey' => { calories: 450, fat: 3, carbs: 5}, 
}


def wallet
	puts "What is your budget? Type 'quit' to cut school"
	@lunch_money = gets.strip.to_f
	if @lunch_money == 0
		exit
	end
end

def main_dish
	puts "What main dish would you like? Type 'clear' to start over"
	puts "1: #{@mains[1]} #{@price['Meatloaf']}"
	puts "2: #{@mains[2]} #{@price['Mystery Meat']}"
	puts "3: #{@mains[3]} #{@price['Slop']}"
	puts "4: View Descriptions"
	@main_dish = gets.strip.to_i
	if @main_dish == 0
		lunch
	elsif @main_dish == 4
		puts "Meatloaf has #{@description['Meatloaf'][:calories]} calories, #{@description['Meatloaf'][:fat]} grams of fat and #{@description['Meatloaf'][:carbs]} grams of carbs."
		
		puts "Mystery Meat has #{@description['Mystery Meat'][:calories]} calories, #{@description['Mystery Meat'][:fat]} grams of fat and #{@description['Mystery Meat'][:carbs]} grams of carbs."
		
		puts "Slop has #{@description['Slop'][:calories]} calories, #{@description['Slop'][:fat]} grams of fat and #{@description['Slop'][:carbs]} grams of carbs."
		main_dish
	end
	# puts "Dare to know what's in it? (y/n)"
	# user_input = gets.strip
	# 	if user_input == 'y'
	# 		puts "#{@description[@mains[@main_dish]][:calories]} calories"
	# 		puts "#{@description[@mains[@main_dish]][:fat]} of fat"
	# 		puts "#{@description[@mains[@main_dish]][:carbs]} of carbs"
	# 	else
	# 	end
end


@side_choices = []

# user chooses 2 side dish items
def side_dish
	puts "What side dish would you like? Type 'clear' to start over"
	puts "1: #{@sides[1]} #{@price['Carrots']}"
	puts "2: #{@sides[2]} #{@price['Mystery Yogurt']}"
	puts "3: #{@sides[3]} #{@price['Beef Jerkey']}"
	puts "4: View Descriptions"
	puts "5: Checkout"
	@side_dish = gets.strip.to_i
	@side_choices << "#{@sides[@side_dish]}"
	if @side_dish == 0
		lunch
	elsif @side_dish == 4
		puts "Carrots have #{@description['Carrots'][:calories]} calories, #{@description['Carrots'][:fat]} grams of fat and #{@description['Carrots'][:carbs]} grams of carbs."
		puts "Mystery Yogurt has #{@description['Mystery Yogurt'][:calories]} calories, #{@description['Mystery Yogurt'][:fat]} of grams fat and #{@description['Mystery Yogurt'][:carbs]} grams of carbs."
		puts "Beef Jerkey has #{@description['Beef Jerkey'][:calories]} calories, #{@description['Beef Jerkey'][:fat]} of grams fat and #{@description['Beef Jerkey'][:carbs]} grams of carbs."
		side_dish
	elsif @side_dish == 5
	else
		side_dish
	end
end


# computer repeats users order
def repeat_order
	puts "Your order consists of:"
	puts "#{@side_choices.join(", ")}and your main dish, #{@mains[@main_dish]}."
end


# computer totals lunch items and displays total
def order_total	
	sides_total = []
	sides_total << @side_choices.map {|i| @price[i] }
	sides_total.flatten!
	sides_total.compact!
	
	bill = @price[@mains[@main_dish]] + sides_total.reduce(:+)

	puts "Your order total is: #{bill}"
	if @lunch_money < bill
		puts "Looks like you don't have enough money. Get back in line!"
		wallet
	end
end


# display to the user not only their total but the total fat content / calories / carbs / etc.
def food_total

	# was getting a nil element at the end of the array, for some reason .compact! wouldn't work here
	@side_choices.pop
	# print @side_choices
	# puts @side_choices[0].class
	# puts @description[@side_choices[0]][:calories]

	# calories
	calories_total = []
	calories_total << @side_choices.map {|i| @description[i][:calories] }
	calories_total.flatten!
	calories = calories_total.reduce(:+)

	# print calories_total
	# print calories_total.reduce(:+)

	puts "Total calories is: #{calories} calories" 

	# fat
	fat_total = []
	fat_total << @side_choices.map {|i| @description[i][:fat] }
	fat_total.flatten!
	fat = fat_total.reduce(:+)

	puts "Total fat is: #{fat} grams" 


	# carbs
	carbs_total = []
	carbs_total << @side_choices.map {|i| @description[i][:carbs] }
	carbs_total.flatten!
	carbs = carbs_total.reduce(:+)

	puts "Total carbs is: #{carbs} grams" 

end



def lunch
	wallet
	main_dish
	side_dish
	repeat_order
	order_total
	food_total
end

lunch

