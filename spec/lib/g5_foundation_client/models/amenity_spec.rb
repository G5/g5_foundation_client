require 'spec_helper'

describe G5FoundationClient::Amenity do
  subject { described_class.new({
                                    id:         id,
                                    name:       name,
                                    icon:       icon,
                                    created_at: created_at,
                                    updated_at: updated_at
                                }) }
  let(:id) { 1 }
  let(:name) { 'Covered Parking' }
  let(:icon) { 'fa fa-parking-interior' }
  let(:created_at) { '2016-11-22T09:20:16.549-08:00' }
  let(:updated_at) { '2016-11-22T09:20:16.549-08:00' }

  its(:id) { is_expected.to eq(id) }
  its(:name) { is_expected.to eq(name) }
  its(:icon) { is_expected.to eq(icon) }
  its(:created_at) { is_expected.to eq(created_at) }
  its(:updated_at) { is_expected.to eq(updated_at) }
end