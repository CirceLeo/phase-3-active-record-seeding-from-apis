puts "seed some spells wooooo"

spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

spells.each do |spell|
    response = RestClient.get  "https://www.dnd5eapi.co/api/spells/#{spell}"
    spell_book = JSON.parse(response)
    Spell.create(
        name: spell_book["name"],
        level: spell_book["level"],
        description: spell_book["desc"][0]
    )
end

puts "you're welcome"