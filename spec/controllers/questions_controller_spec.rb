require 'rails_helper'

RSpec.describe QuestionsController do

  describe 'GET #new' do
    before do
      get :new
    end
    it '200レスポンスが返ってくること' do
      expect(response).to have_http_status "200"
    end
    it '@questionに新しいquestionを割り当てること' do
      expect(assigns(:question)).to be_a_new(Question)
    end
    it ':newテンプレートを表示すること' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    before do
      @test1 = create(:question, name: "test1", title: "test1", content: "test1")
      @test2 = create(:question, name: "test2", title: "test2", content: "test2")
      get :index
    end
    it '200レスポンスが返ってくること' do
      expect(response).to have_http_status "200"
    end
    it '@questionに全てのquestionを割り当てること' do
      expect(assigns(:questions)).to match_array([@test1,@test2])
    end
    it ':indexテンプレートを表示すること' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #edit' do
    before do
      @question = create(:question)
      get :edit, params: { id: @question.id }
    end
    it '200レスポンスが返ってくること' do
      expect(response).to have_http_status "200"
    end
    it '@questionに要求されたquestionを割り当てること' do
      expect(assigns(:question)).to eq @question
    end
    it ':editテンプレートを表示すること' do
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    before do
      @question = create(:question)
    end
    context '要求されたquestionが存在する場合' do
      before do
        get :show, params: { id: @question.id }
      end
      it '200レスポンスが返ってくること' do
        expect(response).to have_http_status "200"
      end
      it '@questionに要求されたquestionを割り当てること' do
        expect(assigns(:question)).to eq @question
      end
      it ':showテンプレートを表示すること' do
        expect(response).to render_template :show
      end
    end

    context '要求されたquestionが存在しない場合' do
      it 'リクエストはRecordNotFoundになること' do
          expect{
            get :show, params: { id: 00000 }
          }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end

  end

  describe 'POST #create' do

    context '有効なパラメータの場合' do
      before do
        @question = attributes_for(:question)
      end
      it 'リクエストは302リダイレクトになること' do
        post :create, params: { question: @question}
        expect(response).to have_http_status "302"
      end
      it 'データベースに新しいquestionが登録されること' do
        expect{
            post :create, params: { question: @question }
         }.to change(Question, :count).by(1)
      end
      it 'rootにリダイレクトすること' do
        post :create, params: { question: @question }
        expect(response).to redirect_to root_path
      end
    end

    context '無効なパラメータの場合' do
      before do
        @question = attributes_for(:question, name: ' ')
      end
      it '200レスポンスが返ってくること' do
        post :create, params: { question: @question }
        expect(response).to have_http_status "200"
      end
      it 'データベースに新しいquestionが登録されないこと' do
        expect{
            post :create, params: { question: @question }
         }.not_to change(Question, :count)
      end
      it ':newテンプレートを再表示すること' do
        post :create, params: { question: @question }
        expect(response).to render_template :new
      end
    end

  end



  describe 'DELETE #destroy' do
    before do
      @question = create(:question)
    end
    context '要求されたquestionが存在する場合' do
      it 'リクエストは302リダイレクトになること' do
        delete :destroy, params: { id: @question.id }
        expect(response).to have_http_status "302"
      end
      it 'データベースから要求されたquestionが削除されること' do
        expect{
            delete :destroy, params: { id: @question.id }
         }.to change(Question, :count).by(-1)
      end
      it 'questions#indexにリダイレクトされること' do
        delete :destroy, params: { id: @question.id }
        expect(response).to redirect_to root_path
      end
    end

    context '要求されたquestionが存在しない場合' do
      it 'リクエストはRecordNotFoundになること' do
        expect{
            delete :destroy, params: { id: 00000 }
         }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end

  end


end
