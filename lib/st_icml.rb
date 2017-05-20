require "st_icml/version"

module StICML

end

Dir.glob(File.join(File.dirname(__FILE__),'st_icml/**/*.rb')).each do |file|
  require_relative(file)
end

