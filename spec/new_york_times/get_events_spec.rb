require_relative '../spec_helper'

describe 'Column' do
  it "should return a column header given an alternate translation of that column" do

    binding.pry
     @client = Savon.client(
      wsdl: self.wsdl,
      env_namespace: :soapenv,
      namespace_identifier: :isal,
      namespace: 'http://www.isalushealthcare.webservices/',
      convert_request_keys_to: :none,
      pretty_print_xml: true
    )
  end
end

