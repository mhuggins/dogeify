require 'dogeify'

class String
  def dogeify(options = {})
    Dogeify.new.process(self, options)
  end
end
