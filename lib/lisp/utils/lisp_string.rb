# Pretty string with some extra functionality
class LispString < String
  def balance_whitespaces
    gsub(/\s\s+/, ' ')
  end

  def pretty_parenthesise
    gsub('(', ' ( ').gsub(')', ' ) ')
  end
end
