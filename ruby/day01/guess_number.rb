# Program choose a number between the interval 1..10 and tell the user if she guessed the number

puts "Hello gamer!"
puts "Press CTRL+C if you want to quit"
puts "I bet you cannot guess the number I choose between 0 and 9"

number = rand(10)

while typed_number = gets
    guessed_number = typed_number.to_i
    if guessed_number == number
	puts "Lucky guess!"
        number = rand(10)
    elsif guessed_number < number
	puts "Too low"
    else
        puts "Too high"
    end
end
