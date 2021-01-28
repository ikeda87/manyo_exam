require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
 let!(:task) { FactoryBot.create(:task, title: 'task') }
 before do

   describe '新規作成機能' do
     context 'タスクを新規作成した場合' do
       it '作成したタスクが表示される' do
         visit new_task_path
         fill_in "タイトル", with: "買う"
         fill_in "詳細", with: "見てみる"
         fill_in "終了期限", with: "002021-01-28"
         select "着手中", from: "ステータス"
         select "高", from: "優先度"
         # binding.irb
         # check ''
         click_button '登録する'
         expect(page).to have_content 'リュック買う'
       end
     end
   end

   describe '一覧表示機能' do
     context '一覧画面に遷移した場合' do
       it '作成済みのタスク一覧が表示される' do
         expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
       end
     end
     context 'タスクが作成日時の降順で並んでいた場合' do
       it '新しいタスクが一番上に表示される' do
         task_list = all('.task_row')
         expect(task_list[0]).to have_content 'Factoryで作ったデフォルトのタイトル３'
       end
     end
  end

  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
       end
     end
  end

  describe '検索機能' do
    before do
      visit tasks_path
    end
      context 'タイトルであいまい検索をした場合' do
        it "検索キーワードを含むタスクで絞り込まれる" do
          fill_in "search_textarea", with:"タイトル2"
          click_button '検索'
          expect(page).to have_content 'タイトル2'
        end
      end
      context 'ステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          select "未着手", from: "ステータス"
          click_button '検索'
          expect(page).to have_content '未着手'
        end
      end
      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          fill_in "search_textarea", with:"タイトル1"
          select "未着手", from: "ステータス"
          click_button '検索'
          expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
        end
      end
    end
   end
  end
