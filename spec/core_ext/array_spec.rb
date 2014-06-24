require 'spec_helper'

describe Array do
  subject { ['My grandmom gave me a sweater for Christmas.', 'I like turtles.', 'I am a banana.'] }

  describe '#dogeify' do
    let(:options) { { ignore: [] } }
    let(:output) { subject.dogeify(options) }

    it 'delegates to Dogeify#process for each element' do
      subject.each do |item|
        expect_any_instance_of(Dogeify).to receive(:process).with(item, options).once
      end

      output
    end

    it 'returns an array of strings' do
      expect(output).to be_an_array_of String
    end
  end
end
