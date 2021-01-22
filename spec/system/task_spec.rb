require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    user = FactoryBot.create(:user)
    FactoryBot.create(:task, user: user)
    FactoryBot.create(:second_task, user: user)
    visit new_session_path
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    click_button 'Log in'
    visit tasks_path
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "タイトル", with: "買う"
        fill_in "詳細", with: "見る"
        fill_in "終了期限", with: "002021-01-18"
        select "着手中", from: "ステータス"
        select "高", from: "優先度"
        # binding.irb
        # check ''
        click_button '登録する'
        expect(page).to have_content '買う'
      end
    end
  end

  describe 'タスク管理機能', type: :system do
    describe '一覧表示機能' do
      context '一覧画面に遷移した場合' do
        it '作成済みのタスク一覧が表示される' do
          task = FactoryBot.create(:task, title: 'task')
          visit tasks_path
          expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
        end
      end
    end
  end
