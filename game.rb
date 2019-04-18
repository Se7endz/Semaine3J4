require_relative "./Player.rb"
require_relative "./BoardCase.rb"
require_relative "./Board.rb"  

class Game
  def initialize # Création des players et du board. On assigne la lettre directement aux joueurs
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new
  end

  def go # Lance la partie et affiche le board, appelle la méthode turn pour que les joueurs puissent commencer à jouer
    puts "Bienvenue dans le Morback's game !!"
    puts "Le jeu qui gratte..."
    @board.to_s
    turn
  end

  def turn  #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). 
    while (@player1.state == "") && (@player2.state = "")
      puts @player1.name.to_s + "'s turn: " + @player1.value
      puts "choisi une case"
      @board.play(@player1, gets.chomp.to_i) # la méthode play a besoin des arguments
      @board.to_s
      @board.victory?(@player1, @player2)
      break if @player1 == "won" || @player2 == "won" # Check si il y a une victoire, la méthode victory casse le while si oui en changeant le state
      @player1, @player2 = @player2, @player1 # switch les joueurs
    end
  end
end
Game.new.go
