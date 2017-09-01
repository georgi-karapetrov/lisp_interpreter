class LispString < String
  def balance_whitespaces
    self.gsub(/\s\s+/, ' ')
  end

  def pretty_parenthesise
    self.gsub('(', ' ( ').gsub(')', ' ) ')
  end 
end
