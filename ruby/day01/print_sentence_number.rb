for i in 1..10
    puts "This is sentence number #{i}"
end

puts

range_inclusive_end = (1..10)
puts "range_inclusive_end = #{range_inclusive_end}"
puts "range_inclusive_end.class = #{range_inclusive_end.class}"
puts 
range_exclusive_end = (1...10)
puts "range_excluive_end = #{range_exclusive_end}"
puts "range_exclusive_end.class = #{range_exclusive_end.class}"
