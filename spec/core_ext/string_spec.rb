require 'spec_helper'

describe String do
  subject { 'My grandmom gave me a sweater for Christmas.' }

  describe '#dogeify' do
    it 'delegates to Dogeify#process' do
      expect_any_instance_of(Dogeify).to receive(:process).with(subject)
      subject.dogeify
    end

    it 'returns a string' do
      expect(subject.dogeify).to be_a String
    end
  end
end
