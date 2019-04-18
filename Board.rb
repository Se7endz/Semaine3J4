require 'pry'
class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
  attr_accessor :board_cases

  def initialize
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
    # Définition des instances et regroupement dans une array
    @boardcase_1 = BoardCase.new(1)
    @boardcase_2 = BoardCase.new(2)
    @boardcase_3 = BoardCase.new(3)
    @boardcase_4 = BoardCase.new(4)
    @boardcase_5 = BoardCase.new(5)
    @boardcase_6 = BoardCase.new(6)
    @boardcase_7 = BoardCase.new(7)
    @boardcase_8 = BoardCase.new(8)
    @boardcase_9 = BoardCase.new(9)
    @board_cases = [[@boardcase_1, @boardcase_2, @boardcase_3], [@boardcase_4, @boardcase_5, @boardcase_6], [@boardcase_7, @boardcase_8, @boardcase_9]]
  end

  def to_s # mise en String
    @board_cases.each do |board|
      board = board.to_s
    end
    puts @board_cases[0].join("|") # affichage du board
    puts @board_cases[1].join("|")
    puts @board_cases[2].join("|")
  end

  def victory?(player1, player2)
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
      combo_win = [[@boardcase_1, @boardcase_2, @boardcase_3], # Je definie un array des combinaisons gagnantes du jeu
                  [@boardcase_1, @boardcase_4, @boardcase_7],
                  [@boardcase_1, @boardcase_5, @boardcase_9],
                  [@boardcase_4, @boardcase_5, @boardcase_6],
                  [@boardcase_7, @boardcase_8, @boardcase_9],
                  [@boardcase_3, @boardcase_5, @boardcase_7],
                  [@boardcase_2, @boardcase_5, @boardcase_8],
                  [@boardcase_3, @boardcase_6, @boardcase_9]]
      combo_win.each do |combos| # Boucle de vérification de condition de victoire
          if combos[0].to_s == player1.value && combos[1].to_s == player1.value && combos[2].to_s == player1.value
            player1.state = "win"
            puts player1.name + " " + "won"
            
          elsif combos[0].to_s == player2.value && combos[1].to_s == player2.value && combos[2].to_s == player2.value
            puts player2.name + " " + "won"
            player2.state = "win"
          end
  end
        # à partir du tableau de tableau (qui n'a servi à rien au final), on le flatten
    # puis comme c'est un tableau de boardman
    # on .map value
    # pour qu'il devienne un tableau de value
    # càd un tableau de string ou de integer
    tablo = @board_cases.flatten.map(&:value)
    # on vérifie si le tableau est composé entièrement de string
    # càd c'est un draw
    # unless il y a déjà un win
    # unless (player1.state = "win" || player2.state = "win")
    if tablo.all?(String)
      puts "draw mfw"
      player1.state = "draw"
      player2.state = "draw"
    end
  end

  def play(player, num) # Changement des numéros initiaux en O ou X. Si l'input n'est pas un numéro, on passe le tour. Tolérance 0 !
    if @board_cases.flatten.fetch(num - 1, "non").value == "O"
      puts "invalid move, player change"
    elsif @board_cases.flatten.fetch(num - 1, "non").value == "X"
      puts "invalid move, player change"
    else @board_cases.flatten.fetch(num - 1, "non").value = player.value
    end
  end
end  

#binding.pry
