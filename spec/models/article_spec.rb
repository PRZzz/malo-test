require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "#valid?" do
    let(:article) { build(:article) }

    subject do
      article.valid?
    end

    it 'returns true' do
      expect(subject).to be_truthy
    end

    context 'when title is not defined' do
      let(:article) { build(:article, title: nil) }

      it 'returns false with adequate error' do
        expect { subject }.to change { article.errors.count }.from(0).to(1)

        expect(subject).to be_falsey
        expect(article.errors.details[:title][0]).to eq({ error: :blank })
      end
    end
  end
end
