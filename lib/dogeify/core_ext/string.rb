require 'dogeify'

class String
  def dogeify
    Dogeify.new.process(self)
  end
end
