# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  describe 'Word一覧画面のテスト' do
    before do
      visit words_path
    end
    context '表示の確認' do
      it 'words_pathが"/words"であるか' do
        expect(current_path).to eq('/words')
      end
      it '投稿されたものが表示されているか' do
        (1..5).each do |i|
	        Word.create(word:'hoge'+i.to_s)
        end
	      Word.all.each_with_index do |word|
          expect(page).to have_content word.word
          expect(page).to have_link word.word, href: word_path(word)
        end
      end
    end
  end

  describe 'Word詳細画面のテスト' do
	  let!(:word) { create(:word,word:'hoge') }
    before do
      visit word_path(word)
    end
    context '表示の確認' do
      it 'word_path(word)が"/word/:id"であるか' do
        expect(current_path).to eq("/words/#{word.id}")
      end
      it '投稿されたWordが表示されているか' do
        expect(page).to have_content word.word
      end
    end
  end

end