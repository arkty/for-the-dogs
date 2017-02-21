require 'nokogiri'
require 'open-uri'
require 'json'
require 'rest-client'

def post(payload, kukka)
  JSON.parse(RestClient.post("https://meduza.io/embed/oscar-game/generate", payload, {
    content_type: :json, accept: :json,
    cookies: {_ym_uid: 19.times.map{rand(10)}.join, __gfp_64b: kukka}
  }))
end

def to_10bytes(num) Array.new(10) {|i| num[9-i]} end

cookies = []

# Make some humans
1.upto(152) do |page|
  Nokogiri::HTML(open("magic://&page=#{page}")).css("cookie").each {cookies << c.text}
end

# Define target
target = {
  id: 24,
  results: [1, 0, 1, 0, 1, 0, 1, 0, 0, 1],
  resultKey: 5
}.to_json

# For the dogs.
cookies.each {|c| post(target, c)}
