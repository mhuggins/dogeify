require 'dogeify/version'
require 'engtagger'

class Dogeify
  ADJECTIVES = %w(so such very much many).freeze

  def initialize
    @tagger = EngTagger.new
  end

  def process(str)
    tagged_str = tagger.add_tags(str.downcase)
    phrases = tagger.get_nouns(tagged_str).keys

    phrases = phrases.each_with_index.map { |phrase, i| "#{adjective(i)} #{phrase}." }
    if str.include?("n't") || str.include?("not")
      phrases << 'plz no.'
    else
      phrases << ['wow.', 'amaze.', 'excite.'].sample
    end
    phrases.join(' ')
  end

  private

  attr_reader :tagger

  def adjective(i)
    ADJECTIVES[i % ADJECTIVES.size]
  end
end
