# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Region.create([{region_name: '北海道'}, {region_name: '東北'}, {region_name: '関東甲信'},{region_name: '北陸'},{region_name: '東海'},   {region_name: '中部'}, {region_name: '近畿'}, {region_name: '中国'}, {region_name: '四国'},{region_name: '九州'}, {region_name: '沖縄'}])

Prefecture.create([{:prefecture => '北海道', region_id: 1}, {:prefecture => '青森県', region_id: 2}, {:prefecture => '岩手県', region_id: 2}, {:prefecture => '宮城県', region_id: 2}, {:prefecture => '秋田県', region_id: 2},
       			   {:prefecture => '山形県', region_id: 2}, {:prefecture => '福島県', region_id: 2}, {:prefecture => '東京都', region_id: 3},{:prefecture => '栃木県', region_id: 2}, {:prefecture => '群馬県', region_id: 2},
                   {:prefecture => '埼玉県', region_id: 2}, {:prefecture => '茨城県', region_id: 2}, {:prefecture => '千葉県', region_id: 2}, {:prefecture => '神奈川県', region_id: 2}, {:prefecture => '長野県', region_id: 2},
                   {:prefecture => '山梨県', region_id: 2}, {:prefecture => '新潟県', region_id: 3}, {:prefecture => '富山県', region_id: 3}, {:prefecture => '石川県', region_id: 3}, {:prefecture => '福井県', region_id: 3},
				   {:prefecture => '静岡県', region_id: 5}, {:prefecture => '岐阜県', region_id: 5}, {:prefecture => '三重県', region_id: 5}, {:prefecture => '愛知県', region_id: 5}, {:prefecture => '京都府', region_id: 7},
				   {:prefecture => '大阪府', region_id: 7}, {:prefecture => '兵庫県', region_id: 7}, {:prefecture => '奈良県', region_id: 7}, {:prefecture => '滋賀県', region_id: 7}, {:prefecture => '和歌山県', region_id: 7},
				   {:prefecture => '鳥取県', region_id: 8}, {:prefecture => '島根県', region_id: 8}, {:prefecture => '岡山県', region_id: 8}, {:prefecture => '広島県', region_id: 8}, {:prefecture => '山口県', region_id: 8},
				   {:prefecture => '香川県', region_id: 9}, {:prefecture => '愛媛県', region_id: 9}, {:prefecture => '徳島県', region_id: 9}, {:prefecture => '高知県', region_id: 9}, {:prefecture => '福岡県', region_id: 10},
				   {:prefecture => '佐賀県', region_id: 10}, {:prefecture => '長崎県', region_id: 10}, {:prefecture => '熊本県', region_id: 10}, {:prefecture => '大分県', region_id: 10}, {:prefecture => '宮城県', region_id: 10},
				   {:prefecture => '鹿児島県', region_id: 10}, {:prefecture => '沖縄県', region_id: 11}])

Season.create([{season: '春'}, {season: '夏'}, {season: '秋'}, {season: '冬'}])

Organization.create([{organization: '一人旅'},{organization: '夫婦・カップル'},{organization: '家族'},{organization: '友達'}, {organization: 'その他'}])

Admin.create(email: 'aaa@aaa', password: 'aaaaaa')

User.create(name: 'aaa', email: 'aaa@aaa', password: 'aaaaaa')