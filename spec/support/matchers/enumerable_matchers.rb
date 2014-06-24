RSpec::Matchers.define :be_an_array_of do |expected|
  match do |actual|
    actual.is_a?(Array) && actual.map(&:class).uniq == [expected]
  end
end
