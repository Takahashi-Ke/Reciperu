class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :recipes, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  attachment :user_image
  
  # 中間テーブルアソシエーション
  
  # フォローするユーザ
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  # 自分がフォローしているユーザ
  has_many :followed_users, through: :active_relationships,
                            source: :followed
  # フォローされるユーザ
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  # 自分をフォローしているユーザ
  has_many :following_users, through: :passive_relationships,
                             source: :follower
  
  # アクション内で使用するメソッド定義
  def follow(user_id)
    active_relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followed_users.include?(user)
  end
  
end
