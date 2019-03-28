# Print 4 numbers at once using Enumerable#each
numbers = (1..16).to_a

slices = []
numbers.each do |number| 
    slices.push(number)
    if slices.size == 4
        p slices
        slices.clear
    end
end


# Print 4 numbers at one using Enumerable#each_slice
numbers.each_slice(4) { |slice| p slice }
