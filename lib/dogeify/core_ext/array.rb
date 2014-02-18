require 'dogeify'

class Array
  def dogeify
    dogeify = Dogeify.new
    map { |item| dogeify.process(item.to_s) }
  end
end
