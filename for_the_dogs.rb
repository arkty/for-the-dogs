require 'nokogiri'
require 'json'
require 'rest-client'

1.upto(152) do |page|
  Nokogiri::HTML(RestClient.get("magic://&page=#{page}")).css("cookie").each do 
    RestClient.post("https://meduza.io/embed/oscar-game/generate", 
      { id: 24, results: [1, 0, 1, 0, 1, 0, 1, 0, 0, 1], resultKey: 5}.to_json, # For the dogs
      {content_type: :json, accept: :json, cookies: {_ym_uid: 19.times.map{rand(10)}.join, __gfp_64b: c.text}
    })
  end
end
