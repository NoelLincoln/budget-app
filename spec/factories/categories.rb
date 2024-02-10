FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Sample Category #{n}" }

    user # Assuming user association is required
    after(:build) do |category|
      file_path = Rails.root.join('spec', 'fixtures', 'images', 'test.png')
      category.icon.attach(io: File.open(file_path), filename: 'test.png', content_type: 'image/png')
    end
  end
end
