module ActAsCsv

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def act_as_csv
           include InstanceMethods
        end
    end

    module InstanceMethods
        
        def read
            File.open(self.class.to_s.downcase + '.csv') do |file|
                @headers = file.gets.chomp.split ','
                file.each_line { |line| @content << CsvRow.new(line) }
            end
        end

        def each(&block)
            @content.each &block
        end

        attr_accessor :headers, :content

        def initialize
            @content = []
            read
        end

    end

    class CsvRow

        @@columns = {
            'one'   => 1,
            'two'   => 2,
            'three' => 3,
            'four'  => 4,
            'five'  => 5,
            'six'   => 6,
            'seven' => 7,
            'eight' => 8,
            'nine'  => 9
        }

        def initialize(line)
            @line = line.chomp.split(',')
        end

        def method_missing name, *args
            column = name.to_s
            index = @@columns[column]
            return @line[index-1] if index else return '0'
        end
    end

end


class RubyCsv

    include ActAsCsv
    act_as_csv

end


csv = RubyCsv.new
puts csv.headers.inspect
puts csv.content.inspect
csv.each { |line| puts "#{line.one} - #{line.two}" }
