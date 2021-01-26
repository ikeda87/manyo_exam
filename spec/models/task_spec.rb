require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    let!(:task) { FactoryBot.create(:task, title: 'task') }
    let!(:second_task) { FactoryBot.create(:second_task, title: "sample") }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.search_title('task')).to include(@task)
        expect(Task.search_title('task')).not_to include(@second_task)
        expect(Task.search_title('task')).not_to include(@third_task)
        expect(Task.search_title('task').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.search_status('着手中')).not_to include(@task)
        expect(Task.search_status('着手中')).to include(@second_task)
        expect(Task.search_status('着手中')).to include(@third_task)
        expect(Task.search_status('着手中').count).to eq 2
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.search_title('task').search_status('完了')).to include(@task)
        expect(Task.search_title('task').search_status('完了')).not_to include(@second_task)
        expect(Task.search_title('task').search_status('完了')).not_to include(@third_task)
        expect(Task.search_title('task').search_status('完了').count).to eq 1
      end
    end
  end
end
