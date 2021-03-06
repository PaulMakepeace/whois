# encoding: utf-8

# This file is autogenerated. Do not edit it manually.
# If you want change the content of this file, edit
#
#   /spec/fixtures/responses/whois.educause.edu/property_contact_registrant_without_zip.expected
#
# and regenerate the tests with the following rake task
#
#   $ rake spec:generate
#

require 'spec_helper'
require 'whois/record/parser/whois.educause.edu.rb'

describe Whois::Record::Parser::WhoisEducauseEdu, "property_contact_registrant_without_zip.expected" do

  subject do
    file = fixture("responses", "whois.educause.edu/property_contact_registrant_without_zip.txt")
    part = Whois::Record::Part.new(:body => File.read(file))
    described_class.new(part)
  end

  describe "#registrant_contacts" do
    it do
      subject.registrant_contacts.should be_a(Array)
      subject.registrant_contacts.should have(1).items
      subject.registrant_contacts[0].should be_a(Whois::Record::Contact)
      subject.registrant_contacts[0].type.should          == Whois::Record::Contact::TYPE_REGISTRANT
      subject.registrant_contacts[0].id.should            == nil
      subject.registrant_contacts[0].name.should          == nil
      subject.registrant_contacts[0].organization.should  == "The American University of the Caribbean School of Medicine"
      subject.registrant_contacts[0].address.should       == "c/o Campbell Corporate Services, Ltd.\nScotiabank Building, P. O. Box 268"
      subject.registrant_contacts[0].city.should          == "Grand Cayman"
      subject.registrant_contacts[0].zip.should           == nil
      subject.registrant_contacts[0].state.should         == nil
      subject.registrant_contacts[0].country.should       == "CAYMAN ISLANDS"
      subject.registrant_contacts[0].country_code.should  == nil
      subject.registrant_contacts[0].phone.should         == nil
      subject.registrant_contacts[0].fax.should           == nil
      subject.registrant_contacts[0].email.should         == nil
    end
  end
end
