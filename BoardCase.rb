
class BoardCase
    attr_accessor :value, :case_id #TO DO : la classe a 2 attr_accessor, sa valeur en string (X, O, ou vide), ainsi que son identifiant de case

    def initialize(case_id) 
    #TO DO : doit régler sa valeur, ainsi que son numéro de case
    #associe chaque case à sa valeur (en string, voir ci-dessous)
        @value = case_id
        @case_id = case_id
    end

    def to_s
        value.to_s
    end
  
end