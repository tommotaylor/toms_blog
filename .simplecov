SimpleCov.start "rails" do
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  SimpleCov.minimum_coverage 98
  SimpleCov.minimum_coverage_by_file 88.5
end
