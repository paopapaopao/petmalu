require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build :post }

  context 'When the content attribute is invalid' do
    it 'is invalid' do
      subject.content = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :content
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.content = ''
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :content
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.content = ' '
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :content
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"
    end
  end

  context 'When all attributes are valid' do
    it 'is valid' do
      expect(subject).to be_valid
      expect(subject.errors).to_not be_present
      expect(subject.errors.to_hash.keys).to_not include :content
    end
  end

  context 'Association with User' do
    it { expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to }
  end

  context 'Association with Comments' do
    it { expect(described_class.reflect_on_association(:comments).macro).to eq :has_many }
  end
end
