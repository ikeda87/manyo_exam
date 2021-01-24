require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
 let!(:task) { FactoryBot.create(:task, title: 'task') }
 before do

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end
    # テスト内容を追加で記載する
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
        # 必要に応じて、テストデータの内容を変更して構わない
        FactoryBot.create(:task, title: "task")
        FactoryBot.create(:second_task, title: "sample")
      end
      context 'タイトルであいまい検索をした場合' do
        it "検索キーワードを含むタスクで絞り込まれる" do
          visit tasks_path
          # タスクの検索欄に検索ワードを入力する (例: task)
          # 検索ボタンを押す
          expect(page).to have_content 'task'
        end
      end
      context 'ステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          # ここに実装する
          # プルダウンを選択する「select」について調べてみること
        end
      end
      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          # ここに実装する
        end
      end
    end
  end
