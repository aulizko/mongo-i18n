require 'helper'

describe MongoI18n do
  it "autoloads Store" do
    lambda { MongoI18n::Store }.should_not raise_error(NameError)
  end
end