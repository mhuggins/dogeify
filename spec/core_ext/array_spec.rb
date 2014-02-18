require 'spec_helper'

describe Array do
  subject { ['My grandmom gave me a sweater for Christmas.', 'I like turtles.', 'I am a banana.'] }

  describe '#dogeify' do
    it 'delegates to Dogeify#process for each element' do
      subject.each do |item|
        expect_any_instance_of(Dogeify).to receive(:process).with(item).once
      end

      subject.dogeify
    end

    it 'returns an array of strings' do
      expect(subject.dogeify).to be_an Array
      expect(subject.dogeify.map(&:class).uniq).to eq [String]
    end
  end
end
