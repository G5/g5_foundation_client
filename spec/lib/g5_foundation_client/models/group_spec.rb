require 'spec_helper'

describe G5FoundationClient::Group do
  let(:id) { 1 }
  let(:name) { 'San Diego' }
  let(:description) { 'San Diego group' }
  let(:urn) { 'g5-g-san-diego' }
  let(:core_group_id) { 2 }
  let(:created_at) { '2016-11-22T09:20:16.549-08:00' }
  let(:updated_at) { '2016-11-22T09:20:16.549-08:00' }

  subject do
    described_class.new({
      id:            id,
      name:          name,
      description:   description,
      urn:           urn,
      core_group_id: core_group_id,
      created_at:    created_at,
      updated_at:    updated_at
    })
  end

  its(:id) { is_expected.to eq(id) }
  its(:name) { is_expected.to eq(name) }
  its(:description) { is_expected.to eq(description) }
  its(:urn) { is_expected.to eq(urn) }
  its(:core_group_id) { is_expected.to eq(core_group_id) }
  its(:created_at) { is_expected.to eq(created_at) }
  its(:updated_at) { is_expected.to eq(updated_at) }
end
