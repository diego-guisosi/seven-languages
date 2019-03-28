# functions
def even?(number)
    return number % 2 == 0
end

number = 10
puts number if even? number


# code blocks
number.times {puts "looping"}

def in_case_of_even
    yield if even? 10
end

in_case_of_even {puts "It's even"}

def within_transaction
    puts "Begin transaction..."
    yield
    puts "End transaction."
end

within_transaction do
    puts "insert into TABLE_SCORE(NAME,VALUE) values ('dixy',98)"
    puts "update TABLE_SCORE set VALUE = 100 where NAME = 'dixy'"
end


# arrays
colors = ['blue', 'red', 'green', 'yellow']
puts colors[0]
puts colors[-1]
puts colors[10]


# hashes
colors = {
    'blue'   => 0xFFFF,
    'red'    => 0xA9A9,
    'green'  => 0x0000,
    'yellow' => 0x25EE
}

puts colors['red']

def print_colors(colors={})
    puts "Right" if colors[:red] == 0xA9A9
end

print_colors(:red => 0xA9A9, :blue => 0xFFFF)
