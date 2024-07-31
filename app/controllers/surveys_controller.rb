class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    load_form_data
  end

  def create
    @survey = Survey.new(user_id: 1, result: '暫定結果')
    if @survey.save
      create_associations(@survey, survey_params)

      # ChatGPTへの問い合わせ処理
      begin
        message = build_message(@survey)
        @result = ChatgptService.call(message)
      rescue StandardError => e
        # エラー処理
        Rails.logger.error("ChatGPT API request failed: #{e.message}")
        @result = "ChatGPT API error occurred. Please try again later."
      end

      @survey.update(result: @result)

      redirect_to @survey, notice: '問診票が正常に作成されました。'
    else
      # 保存に失敗した場合の処理
      load_form_data
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  private

  def survey_params
    params.require(:survey).permit(:body_part_id, :skin_concern_id, :environment_id, :skin_type_id, :skincare_type_id)
  end

  def create_associations(survey, params)
    survey.survey_body_parts.create(body_part_id: params[:body_part_id])
    survey.survey_skin_concerns.create(skin_concern_id: params[:skin_concern_id])
    survey.survey_environments.create(environment_id: params[:environment_id])
    survey.survey_skin_types.create(skin_type_id: params[:skin_type_id])
    survey.survey_skincare_types.create(skincare_type_id: params[:skincare_type_id])
  end

  def load_form_data
    @body_parts = BodyPart.all
    @skin_concerns = SkinConcern.all
    @environments = Environment.all
    @skin_types = SkinType.all
    @skincare_types = SkincareType.all
  end

  def build_message(survey)
    body_parts = survey.body_parts.map(&:name).join(', ')
    skin_concerns = survey.skin_concerns.map(&:concern).join(', ')
    environments = survey.environments.map(&:environment_type).join(', ')
    skin_types = survey.skin_types.map(&:skin_type_name).join(', ')
    skincare_types = survey.skincare_types.map(&:skincare_type_name).join(', ')

    <<-MESSAGE.strip_heredoc
      --- 問診票の回答 ---
      肌の悩みの該当部位: #{body_parts}
      肌の悩み: #{skin_concerns}
      日常的な環境: #{environments}
      肌質のタイプ: #{skin_types}
      使用しているスキンケア製品: #{skincare_types}

      問診票の回答の情報を元に、美容医療の施術で必要な診断結果を以下の形式で簡潔に回答してください：

      あなたにおすすめの治療は・・・
      【治療名】

      ・どんな施術？
      【施術内容】

      ・見込める効果は？
      【効果内容】

      ・平均価格は？
      【価格内容】

      ・施術の回数と期間は？
      【回数と期間内容】

      ・ダウンタイムは？
      【ダウンタイム内容】
    MESSAGE
  end
end
