require 'dogeify'

class Array
  def dogeify(options = {})
    dogeify = Dogeify.new
    map { |item| dogeify.process(item.to_s, options) }
  end
end
