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
                file.each_line { |line| @content << line.chomp.split(',') }
            end
        end

        attr_accessor :headers, :content

        def initialize
            @content = []
            read
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
