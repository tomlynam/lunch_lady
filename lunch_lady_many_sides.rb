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

@description = { 'Meatloaf' => { calories: 450, fat: '30 grams', carbs: '45 grams'}, 
				 'Mystery Meat' => { calories: 600, fat: '25 grams', carbs: '20 grams'}, 
				 'Slop' => { calories: 300, fat: '15 grams', carbs: '40 grams'}, 
				 'Carrots' => { calories: 450, fat: '6 grams', carbs: '2 grams'}, 
				 'Mystery Yogurt' => { calories: 450, fat: '50 grams', carbs: '15 grams'}, 
				 'Beef Jerkey' => { calories: 450, fat: '3 grams', carbs: '5 grams'}, 
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
	@main_dish = gets.strip.to_i
	if @main_dish == 0
		lunch
	end
	puts "Dare to know what's in it? (y/n)"
	user_input = gets.strip
		if user_input == 'y'
			puts "#{@description[@mains[@main_dish]][:calories]} calories"
			puts "#{@description[@mains[@main_dish]][:fat]} of fat"
			puts "#{@description[@mains[@main_dish]][:carbs]} of carbs"
		else
		end
end


@side_choices = []

# user chooses 2 side dish items
def side_dish
	puts "What side dish would you like? Type 'clear' to start over or '4' to checkout"
	puts "1: #{@sides[1]} #{@price['Carrots']}"
	puts "2: #{@sides[2]} #{@price['Mystery Yogurt']}"
	puts "3: #{@sides[3]} #{@price['Beef Jerkey']}"
	@side_dish = gets.strip.to_i
	@side_choices << "#{@sides[@side_dish]}"
	if @side_dish == 0
		lunch
	elsif @side_dish == 4
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
def total	
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

def lunch
	wallet
	main_dish
	side_dish
	repeat_order
	total
end

lunch

