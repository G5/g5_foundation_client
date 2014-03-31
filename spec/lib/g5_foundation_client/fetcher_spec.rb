require 'spec_helper'

describe G5FoundationClient::Fetcher do
  before { G5FoundationClient.access_token = "token" }

  describe ".fetch_url" do
    let(:url) { "http://example.com/?access_token=token" }
    subject(:fetch) do
      yielded_markup = nil
      G5FoundationClient::Fetcher.fetch_url(url) do |markup|
        yielded_markup = markup
      end

      yielded_markup
    end

    context "when the response is successful" do
      before { stub_json(url, "markup") }
      it { should eq("markup") }
    end

    context "when there is no Location at that UID" do
      before { stub_json(url, response, 404) }
      let(:response) { %["<html><body>Something went wrong</body></html>] }

      it "explodes violently" do
        expect { fetch }.to raise_error(
          G5FoundationClient::RecordNotFoundException, /example/
        )
      end
    end

    context "when there is an unexpected response" do
      before { stub_json(url, response, 418) }
      let(:response) { %[{"error":"I'm a teapot"}] }

      it "explodes violently" do
        expect { fetch }.to raise_error(/418/)
      end
    end
  end
end
