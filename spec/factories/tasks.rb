FactoryBot.define do
  factory :task do
    title { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    deadline { '002021-01-25' }
    status { '未着手' }
    priority { '高' }
  end
  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    deadline { '002021-01-30' }
    status { '完了' }
    priority { '中' }
  end
end
