require 'csv'

class TestCase
	def self.load_data file_name = nil
		file_name ||= File.expand_path('../test-case-1.csv', __FILE__)
		data = []

		CSV.foreach(file_name).each do |row|
			data.concat(row.map { |e| e.to_i })
		end

		data
	end
end