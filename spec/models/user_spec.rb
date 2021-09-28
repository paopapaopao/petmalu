require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build :user }

  context 'When the email attribute is invalid' do
    it 'is invalid' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :email
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.email = ''
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :email
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.email = ' '
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :email
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.email = (create :user).email
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :email
      expect(subject.errors.to_hash.values[0]).to include "has already been taken"
    end
  end

  context 'When the password attribute is invalid' do
    it 'is invalid' do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :password
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.password = ''
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :password
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.password = ' '
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :password
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.password = 'a' * 5
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :password
      expect(subject.errors.to_hash.values[0]).to include "is too short (minimum is 6 characters)"

      subject.password = 'a' * 129
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :password
      expect(subject.errors.to_hash.values[0]).to include "is too long (maximum is 128 characters)"
    end
  end

  context 'When the first name attribute is invalid' do
    it 'is invalid' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :first_name
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.first_name = ''
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :first_name
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.first_name = ' '
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :first_name
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"
    end
  end

  context 'When the last name attribute is invalid' do
    it 'is invalid' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :last_name
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.last_name = ''
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :last_name
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"

      subject.last_name = ' '
      expect(subject).to_not be_valid
      expect(subject.errors).to be_present
      expect(subject.errors.to_hash.keys).to include :last_name
      expect(subject.errors.to_hash.values[0]).to include "can't be blank"
    end
  end

  context 'When all attributes are valid' do
    it 'is valid' do
      expect(subject).to be_valid
      expect(subject.errors).to_not be_present
      expect(subject.errors.to_hash.keys).to_not include :email
      expect(subject.errors.to_hash.keys).to_not include :password
      expect(subject.errors.to_hash.keys).to_not include :first_name
      expect(subject.errors.to_hash.keys).to_not include :last_name
    end
  end

  context 'Association with Posts' do
    it { expect(described_class.reflect_on_association(:posts).macro).to eq :has_many }
  end

  context 'Association with Comments' do
    it { expect(described_class.reflect_on_association(:comments).macro).to eq :has_many }
  end

  context 'Returns the full name' do
    it do
      expect(subject.full_name).to eq "#{subject.first_name.capitalize} #{subject.last_name.capitalize}"
    end
  end
end
