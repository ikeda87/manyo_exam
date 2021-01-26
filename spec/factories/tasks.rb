FactoryBot.define do
  factory :task do
    title { 'Factoryで作ったデフォルトのタイトル1' }
    content { 'Factoryで作ったデフォルトのコンテント1' }
    status { '未着手' }
    priority { '高' }
    deadline { '002021-02-25' }
  end
  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル2' }
    content { 'Factoryで作ったデフォルトのコンテント2' }
    status { '完了' }
    priority { '中' }
    deadline { '002021-02-26' }
  end
  factory :third_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル3' }
    content { 'Factoryで作ったデフォルトのコンテント3' }
    status { '着手中' }
    priority { '低' }
    deadline { '002021-02-27' }
  end
end
