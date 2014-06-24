require 'dogeify/version'
require 'engtagger'

class Dogeify
  ADJECTIVES = %w[so such very much many how].freeze
  EMOTIONS = %w[wow amaze excite].freeze

  def initialize
    @tagger = EngTagger.new
  end

  def process(str, options = {})
    # Parse sentences.
    sentences = str.downcase.split(/[\.!?]+/).map(&:strip)

    sentences = sentences.map do |sentence|
      # Ignore any provided patterns.
      sentence = ignore_patterns(sentence, options[:ignore]) if options[:ignore]
      
      # Select just the nouns.
      tagged_sentence = tagger.add_tags(sentence)
      phrases = tagger.get_nouns(tagged_sentence).keys rescue []

      # Prefix nouns with adjectives, and convert to sentences.
      phrases.map! { |phrase| correct_spelling(phrase) }
      phrases.map! { |phrase| "#{adjective} #{phrase}." }

      # Append a word or phrase describing emotion.
      phrases << "#{emotional_summary}."

      phrases.join(' ')
    end

    sentences.join(' ')
  end

  private

  attr_reader :tagger

  def correct_spelling(word)
    word.dup.tap do |word|
      word.gsub!(/er$/, 'ar')                    # super => supar
      word.gsub!(/ph/, 'f')                      # phone => fone
      word.gsub!(/cious/, 'shus')                # delicious => delishus, deliciousness => delishusness
      word.gsub!(/([^s])tion(s$)?/, '\1shun\2')  # emotion => emoshun, emotions => emoshuns, emotionless => emoshunless, question (unchanged)
      word.gsub!(/stion$/, 'schun')              # question => queschun, potion (unchanged)
      word.gsub!(/dog([^e]|\b)/, 'doge\1')       # dog => doge, dogs => doges, underdog => underdoge, doge (unchanged)
    end
  end

  def ignore_patterns(sentence, patterns)
    sentence.dup.tap do |sentence|
      Array(patterns).map { |pattern| sentence.gsub!(pattern, '') }
    end
  end

  def adjective
    ADJECTIVES[adjective_offset]
  end

  def adjective_offset
    @adjective_offset ||= -1
    @adjective_offset = (@adjective_offset + 1) % ADJECTIVES.size
  end

  def emotional_summary
    EMOTIONS[emotional_summary_offset]
  end

  def emotional_summary_offset
    @emotional_summary_offset ||= -1
    @emotional_summary_offset = (@emotional_summary_offset + 1) % EMOTIONS.size
  end
end
