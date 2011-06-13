require 'spec_helper'

describe ZoneMember do
  context 'validation' do
    it { should have_valid_factory(:zone_member) }
  end

  let(:zone_member) { Factory(:zone_member, :zoneable => Factory(:country, :name => "USA")) }

  describe "#name" do
    context "when there is a zoneable" do
      it "should return name" do
        zone_member.name.should == "USA"
      end
    end

    context "when there is not a zoneable" do
      before(:each) { zone_member.zoneable = nil }
      it "should return nil" do
        zone_member.name.should be_nil
      end
    end
  end
end
