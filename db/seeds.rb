# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Price.find_or_create_by!(name: '少し贅沢')
Price.find_or_create_by!(name: '自分にご褒美')
Price.find_or_create_by!(name: 'お手頃価格')
Price.find_or_create_by!(name: '高級')
Price.find_or_create_by!(name: 'クラフト価格')
Atmosphere.find_or_create_by!(name: '楽しい')
Atmosphere.find_or_create_by!(name: 'わくわく')
Atmosphere.find_or_create_by!(name: 'ハンドメイド')
Atmosphere.find_or_create_by!(name: 'お祭り')
Atmosphere.find_or_create_by!(name: 'ワークショップ')
Atmosphere.find_or_create_by!(name: '新鮮')
Atmosphere.find_or_create_by!(name: '地元の魅力')
Atmosphere.find_or_create_by!(name: '朝市')
Atmosphere.find_or_create_by!(name: 'ナイトマルシェ')
Atmosphere.find_or_create_by!(name: 'ピクニック')
Atmosphere.find_or_create_by!(name: 'オーガニック')
Atmosphere.find_or_create_by!(name: '自然')
Atmosphere.find_or_create_by!(name: '海')
Atmosphere.find_or_create_by!(name: '山')
Target.find_or_create_by!(name: '女性')
Target.find_or_create_by!(name: '男性')
Target.find_or_create_by!(name: '20代')
Target.find_or_create_by!(name: '30代')
Target.find_or_create_by!(name: '40代')
Target.find_or_create_by!(name: '50代')
Target.find_or_create_by!(name: 'ファミリー')
Target.find_or_create_by!(name: '親子')
Target.find_or_create_by!(name: '一点ものを探している方')
Target.find_or_create_by!(name: '新鮮な食材を求めている方')
Target.find_or_create_by!(name: '新しい趣味を見つけたい方')
Target.find_or_create_by!(name: '親子で楽しみたい方')


