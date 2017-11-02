require 'rest-client'
require 'json'


def cards_hash #loading db with card info
  counter = 0
  result = []
  until counter == 347
    hash = RestClient.get("https://api.magicthegathering.io/v1/cards?page=#{counter}")
    cards_hash = JSON.parse(hash)
    cards_hash["cards"].each do |card|

      Card.create!(name: card["name"], image_url: card["imageUrl"], cardtype: card["type"], color: card["colors"])

    end
    counter += 1
  end
  result
end

cards_hash
