filename = ARGV[0] 
regex    = ARGV[1]
 
File.open(filename,'r') do |file|
    file.each_line {|line| puts line if line =~ /#{regex}/}
end


File.open(filename) do |file| # default mode is 'r'
    file.each_with_index { |line, index| puts "#{index}:#{line}" if line =~ /#{regex}/ }
end
