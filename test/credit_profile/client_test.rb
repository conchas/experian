require 'test_helper'

describe Experian::CreditProfile::Client do

  before do
    @client = Experian::CreditProfile::Client.new
  end

  it "should perform a credit check" do
    stub_experian_request("connect_check", "response.xml")
    assert_kind_of Experian::CreditProfile::Response,
      @client.check_credit(first_name: "Homer", last_name: "Simpson", ssn: "123456789")
  end

  it "should raise an ArgumentError if passed bad arguments" do
    assert_raises(Experian::ArgumentError) do
      @client.assert_credit_profile_options({})
    end
  end

end