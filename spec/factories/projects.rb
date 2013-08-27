FactoryGirl.define do
  factory :project do
    name 'test'
    city 'Alabama'
    close_date '2013-08-26 14:06:40'
    description 'Testing project'
    video_url 'out-1.ogv'
    amount '200'
    user_id 1
    category_id 1
  end
end
