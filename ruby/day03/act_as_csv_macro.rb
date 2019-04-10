class ActAsCsv

    def self.act_as_csv

        define_method 'read' do
            File.open(self.class.to_s.downcase + '.csv') do |file|
                @headers = file.gets.chomp.split ','
                file.each_line { |line| @content << line.chomp.split(',') }
            end
        end

        define_method 'headers' do
            @headers
        end

        define_method 'content' do
            @content
        end

        define_method 'initialize' do
            @content = []
            read
        end

    end

end


class RubyCsv < ActAsCsv
    act_as_csv
end


csv = RubyCsv.new
puts csv.headers.inspect
puts csv.content.inspect
