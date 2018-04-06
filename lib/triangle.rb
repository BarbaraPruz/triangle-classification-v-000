class Triangle
  attr_accessor :side1, :side2, :side3
  
  def initialize ( s1, s2, s3 )
    @side1 = s1
    @side2 = s2
    @side3 = s3
  end

  def valid?
    (side1>0 && side2>0 && side3>0) && (side1+side2>side3 && side2+side3>side1 && side1+side3>side2)
  end

  def kind
    rtn_kind = nil
    if !valid?
      begin
        raise PartnerError
      rescue PartnerError => error
        puts error.message
      end
    else if side1==side2 && side2==side3
      rtn_kind = :equilateral
    else if side1==side2  || side2==side3 || side1==side3
      rtn_kind = :isoscles
    else  
      rtn_kind = :scalene
    end
    rtn_kind
  end  

  class PartnerError < StandardError
    def message 
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end
end
