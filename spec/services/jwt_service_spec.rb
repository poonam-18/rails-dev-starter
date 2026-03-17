require 'rails_helper'

RSpec.describe JwtService do
  describe '.encode' do
    it 'returns a JWT token string' do
      token = described_class.encode({ user_id: 1 })

      expect(token).to be_a(String)
      expect(token.split('.').length).to eq(3)
    end
  end

  describe '.decode' do
    it 'returns the original payload values' do
      payload = { user_id: 1, role: 'admin' }
      token = described_class.encode(payload)

      expect(described_class.decode(token)).to include(
        'user_id' => 1,
        'role' => 'admin'
      )
    end
  end
end
