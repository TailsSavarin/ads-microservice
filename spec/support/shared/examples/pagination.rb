# frozen_string_literal: true

shared_examples 'pagination in headers' do
  %w[Current-Page Page-Items Total-Count Total-Pages].each do |header|
    it "include #{header} header" do
      expect(response.headers).to include(header)
    end
  end
end
