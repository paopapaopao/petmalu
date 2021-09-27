require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { build :comment }

  context 'When the body attribute is invalid' do
    it 'is invalid' do
      subject.body = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :body
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.body = ''
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :body
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.body = ' '
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :body
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"
    end
  end

  context 'When all attributes are valid' do
    it 'is valid' do
      expect(subject).to be_valid
      expect(subject.errors).to_not be_present
      expect(subject.errors.to_hash.keys).to_not include :body
    end
  end

  context 'Association with User' do
    it { expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to }
  end

  context 'Association with Post' do
    it { expect(described_class.reflect_on_association(:post).macro).to eq :belongs_to }
  end
end
