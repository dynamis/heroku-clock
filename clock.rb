require 'clockwork'
require 'net/http'
require 'uri'
include Clockwork

ping_uri_list = [
  "http://dynamis.jp/",
  "http://hostedapp.dynamis.jp/"
]

# job: jobname set by every(period, jobname, options)
handler do |job|
  case job
  when 'webping.job' 
    puts "Running #{job}"
    ping_uri_list.each {|ping_uri|
      uri = URI.parse(ping_uri)
      response = Net::HTTP.get_response(uri)
      puts response.body
      
      # response = Net::HTTP.get(uri)
      # puts response
    }
  else # default job
    puts "Running #{job}"
    # something to do...
  end
end

# queueing jobs
#every(10.seconds, 'webping.job')
every(30.minutes, 'webping.job')
