# frozen_string_literal: true

RSpec.describe Api::Controllers::TrainingTypes::Index, type: :action do
  let(:action) { described_class.new }
  let(:repo) { TrainingTypeRepository.new }
  let(:params) do
    {
      name: 'Strength Training'
    }
  end

  it 'is successful' do
    response = action.call(params)
    expect(response).to have_http_status(:ok)
  end

  context 'when no training types found' do
    it 'returns empty result' do
      response = action.call(params)

      result = JSON.parse(response[2].first)
      expect(result.size).to eq(0)
    end
  end

  context 'when training types are present' do
    it 'returns ID equals to last created training type' do
      repo.create(params)

      response = action.call(params)
      result = JSON.parse(response[2].first)

      expect(result.size).to eq(1)
      expect(result.first['id']).to eq(repo.last.id)
    end
  end
end
