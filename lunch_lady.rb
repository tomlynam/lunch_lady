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


def wallet
	puts "What is your budget? Type 'quit' to skip school"
	@lunch_money = gets.strip.to_f
	if @lunch_money == 0
		exit
	end
end

def main_dish
	puts "What main dish would you like? Type 'quit' to start over"
	puts "1: #{@mains[1]} #{@price['Meatloaf']}"
	puts "2: #{@mains[2]} #{@price['Mystery Meat']}"
	puts "3: #{@mains[3]} #{@price['Slop']}"
	@main_dish = gets.strip.to_i
	if @main_dish == 0
		lunch
	end
end

@side_choices = []

# user chooses 2 side dish items
def side_dish
	puts "What side dish would you like? Type 'quit' to start over"
	puts "1: #{@sides[1]} #{@price['Carrots']}"
	puts "2: #{@sides[2]} #{@price['Mystery Yogurt']}"
	puts "3: #{@sides[3]} #{@price['Beef Jerkey']}"
	@side_dish = gets.strip.to_i
	if @side_dish == 0
		lunch
	elsif @side_dish == 4
	end
	@side_choices << "#{@sides[@side_dish]}"
		if @side_choices.count <= 1
		side_dish
		end
end


# computer repeats users order
def repeat_order
	puts "Your order consists of:"
	puts "#{@mains[@main_dish]}, #{@side_choices[0]}, #{@side_choices[1]}"
end


# computer totals lunch items and displays total
def total
	bill = @price[@mains[@main_dish]] + @price[@side_choices[0]] + @price[@side_choices[1]]
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
