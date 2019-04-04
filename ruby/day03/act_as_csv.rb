class ActAsCsv

    attr :header, :content

    def read
        File.open(self.class.to_s.downcase + '.csv') do |file|
            @header = file.gets.chomp.split(',')
            file.each { |line| @content << line.chomp.split(',') }
        end
    end

    def initialize
        @content = []
        read
    end 

end


class RubyCsv < ActAsCsv
end

csv = RubyCsv.new
puts csv.header.inspect
puts csv.content.inspect
