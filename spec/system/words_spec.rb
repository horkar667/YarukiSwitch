# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  let!(:word) { create(:word, word:'頑張れ') }
  describe 'Word一覧画面のテスト' do
    before do
      visit words_path
    end
    context '表示の確認' do
      it 'words_pathが"/words"であるか' do
        expect(current_path).to eq('/words')
      end
    end
  end

end