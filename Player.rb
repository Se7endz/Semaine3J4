class Player
  attr_accessor :name, :value # Noms et valeurs
  attr_accessor :state # Victoire ou défaite

  def initialize(value) # Laisse les joueurs mettre leurs noms, le state est vide au début, la value est imposée (voir plus bas)
    puts "Entre donc ton nom mon ami ! :"
    @name = gets.chomp
    @name = name
    @value = value
    @state = ""
  end
end