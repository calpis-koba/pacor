# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Jenre.create!(
    [{name: "Jポップ"},{name: "ヒップホップ"},{name: "ROCK"},{name: "R&B"},
    {name: "Kポップ"},{name: "演歌"},{name: "その他"}]
    )
  
  Label.create!(
      [{name: "ワーナーミュージック ジャパン"},{name: "Sony Music Japan International(SMJI)"},
      {name: "JYPエンターテインメント"},{name: "ユニバーサルミュージック"},{name: "エイベックス・グループ"},{name: "キングレコード"}]
    )
    
  Artist.create!(
        [
            {name: "KANABOON"},{name: "ポルノグラフィティ"},{name: "aika"},
            {name: "RAD"},{name: "flum"},{name: "KEYTOLK"}
        ]
    )