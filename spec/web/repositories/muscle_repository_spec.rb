# frozen_string_literal: true

RSpec.describe MuscleRepository, type: :repository do
  subject(:repo) { described_class.new }

  describe '#find_with_muscle_group' do
    it 'returns muscle group' do
      muscle_group = MuscleGroupRepository.new.create(name: 'Legs')
      muscle = repo.create(name: 'Quadriceps Femoris', muscle_group_id: muscle_group.id)

      expect(repo.find_with_muscle_group(muscle.id).muscle_group).to eq(muscle_group)
    end
  end
end
