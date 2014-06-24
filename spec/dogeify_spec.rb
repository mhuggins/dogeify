require 'spec_helper'

describe Dogeify do
  subject { described_class.new }

  describe '#process' do
    let(:input) do
      %q{Doge is a slang term for "dog" that is primarily associated with
         pictures of Shiba Inus (nicknamed "Shibe") and internal monologue
         captions on Tumblr. These photos may be photoshopped to change the
         dog's face or captioned with interior monologues in Comic Sans font.
         The use of the misspelled word "doge" to refer to a dog dates back
         to June 24th, 2005, when it was mentioned in an episode of Homestar
         Runner's puppet show. In the episode titled "Biz Cas Fri 1",
         Homestar calls Strong Bad his "d-o-g-e" while trying to distract him
         from his work.}
    end

    let(:output) { subject.process(input) }

    it 'converts to lowercase' do
      expect(output.downcase).to eq output
    end

    it 'combines nouns with doge adjectives' do
      expected = 'so doge. such slang. very term. much doge. many pictures. ' <<
                 'how shiba. so inus. such shibe. very monologue. much ' <<
                 'capshuns. many tumblr.'
      expect(output).to start_with expected
    end

    it 'appends an emotional summary to the end of each sentence' do
      expect(output).to match /(wow\.).*(amaze\.).*(excite\.).*(wow\.)/
    end

    describe 'when the input is an empty string' do
      let(:input) { '' }

      it 'does not raise an error' do
        expect { output }.to_not raise_error
      end
    end

    describe 'when the input contains misspellable words' do
      let(:input) do
        %q{Mister Phoebe is always so emotionless. Maybe he needs a dog to
           cheer him up. It might be a question worth answering!}
      end

      it 'intentionally misspells words' do
        expect(output).to include 'mistar'
        expect(output).to include 'foebe'
        expect(output).to include 'emoshunless'
        expect(output).to include 'doge'
        expect(output).to include 'queschun'
      end
    end

    describe 'when an ignore option is passed' do
      let(:input) { '\e[35;47mHello world!\e[0m' }
      let(:pattern) { /\\e\[\d+(;\d+)?m/ }

      describe 'with a single pattern' do
        let(:output) { subject.process(input, ignore: pattern) }

        it 'removes the pattern' do
          expect(output).to start_with 'so world.'
        end
      end

      describe 'with multiple patterns' do
        let(:output) { subject.process(input, ignore: [pattern, /world/]) }

        it 'removes all patterns' do
          expect(output).to start_with 'wow.'
        end
      end
    end
  end
end
