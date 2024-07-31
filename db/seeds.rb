# Body Parts
["顔", "腕", "手", "脚", "背中", "首", "全身"].each do |name|
  BodyPart.find_or_create_by!(name: name)
end

# Skin Concerns
["ニキビ・吹き出物", "シミ・そばかす", "シワ・たるみ", "毛穴の開き・黒ずみ", "乾燥・肌荒れ", "赤み・敏感肌", "テカリ・脂性肌", "クマ", "色素沈着", "脱毛、減毛したい"].each do |concern|
  SkinConcern.find_or_create_by!(concern: concern)
end

# Environments
["屋内", "屋内(エアコンの効いた環境)", "屋外", "湿度の高い環境", "屋内(エアコンの効いた環境)と屋外両方", "屋内(エアコン不使用)と屋外両方"].each do |environment|
  Environment.find_or_create_by!(environment_type: environment)
end

# Skin Types
["乾燥肌", "脂性肌", "混合肌", "普通肌", "わからない"].each do |skin_type_name|
  SkinType.find_or_create_by!(skin_type_name: skin_type_name)
end

# Skincare Types
["クレンジング", "洗顔", "化粧水", "美容液", "乳液・クリーム", "日焼け止め", "全て使用している", "何も使っていない"].each do |skincare_type_name|
  SkincareType.find_or_create_by!(skincare_type_name: skincare_type_name)
end
