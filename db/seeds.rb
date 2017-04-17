require 'rest-client'
require 'json'


def cards_hash #loading db with card info
  counter = 0
  result = []
  until counter == 328
    hash = RestClient.get("https://api.magicthegathering.io/v1/cards?page=#{counter}")
    cards_hash = JSON.parse(hash)
    cards_hash["cards"].each do |card|

      Card.create(name: card["name"], image_url: card["imageUrl"])
    end
    counter += 1
  end
  result
end
