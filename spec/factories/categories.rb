# spec/factories/categories.rb
FactoryBot.define do
  factory :category do
    name { 'Sample Category' }

    # Attach an icon (assuming you're using Active Storage)
    after(:build) do |category|
      category.icon.attach(io: URI.open('http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MTEsInB1ciI6ImJsb2JfaWQifX0=--d5b725ef31dcceec5920c399913d519c04008593/bird.PNG'),
                           filename: 'icon.png',
                           content_type: 'image/png')
    end
  end
end
