require 'spec_helper'

describe String do
  subject { 'My grandmom gave me a sweater for Christmas.' }

  describe '#dogeify' do
    let(:options) { { ignore: [] } }
    let(:output) { subject.dogeify(options) }

    it 'delegates to Dogeify#process' do
      expect_any_instance_of(Dogeify).to receive(:process).with(subject, options)
      output
    end

    it 'returns a string' do
      expect(output).to be_a String
    end
  end
end
