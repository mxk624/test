class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @body_parts = BodyPart.all
    @skin_concerns = SkinConcern.all
    @environments = Environment.all
    @skin_types = SkinType.all
    @skincare_types = SkincareType.all
  end
  
  def create
    @survey = Survey.new(survey_params)
    @survey.user_id = 1 # 現時点では仮のユーザーIDを設定。ユーザー認証機能ができたらcurrent_userに変更。
    if @survey.save
      # AI診断結果を取得する処理をここに追加
      @survey.update(result: "AI診断結果")
      redirect_to @survey, notice: '問診票が正常に作成されました。'
    else
      render :new
    end
  end
  
  def show
    @survey = Survey.find(params[:id])
  end
  
  private
  
  def survey_params
    params.require(:survey).permit(:result, body_part_ids: [], skin_concern_ids: [], environment_ids: [], skin_type_ids: [], skincare_type_ids: [])
  end
end
