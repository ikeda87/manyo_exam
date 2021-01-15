FactoryBot.define do
  factory :task do
    title { 'Factoryで作ったデフォルトのタイトル2' }
    content { 'Factoryで作ったデフォルトのコンテンツ1' }
    deadline { '002021-01-10' }
    status { '未着手' }
    priority { '高' }
  end

  factory :second_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル2' }
    content { 'Factoryで作ったデフォルトのコンテンツ2' }
    deadline { '002021-01-11' }
    status { '完了' }
    priority { '中' }
  end

  factory :third_task, class: Task do
    title { 'Factoryで作ったデフォルトのタイトル3' }
    content { 'Factoryで作ったデフォルトのコンテンツ3' }
    deadline { '002021-01-12' }
    status { '着手中' }
    priority { '低' }
  end
end
