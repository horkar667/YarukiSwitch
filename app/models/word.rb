class Word < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  has_many :unfavorites, dependent: :destroy
  has_many :unfavorite_users, through: :unfavorites, source: :user

  has_many :word_comments, dependent: :destroy

  has_many :notifications, dependent: :destroy

  validates :word, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def unfavorited_by?(user)
    unfavorites.where(user_id: user.id).exists?
  end

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and word_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        word_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, word_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = WordComment.select(:user_id).where(word_id: id).find_by(user_id: current_user)
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, word_comment_id, user_id) if temp_ids
  end

  def save_notification_comment!(current_user, word_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      word_id: id,
      word_comment_id: word_comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
