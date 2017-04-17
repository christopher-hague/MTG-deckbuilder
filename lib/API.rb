require 'rest-client'
require 'json'
require 'pry'


def seeding_db

  cards_hash
  get_name

  # end

end

  def cards_hash
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



  def get_url
    cards_hash["cards"][0]["imageUrl"]
  end

cards_hash
