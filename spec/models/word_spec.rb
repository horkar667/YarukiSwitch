# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト(Word)' do
  it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:word)).to be_valid
  end
end