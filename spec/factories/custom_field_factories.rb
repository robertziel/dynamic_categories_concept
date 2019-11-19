FactoryBot.define do
  factory :custom_field do
    name { 'Name' }

    factory :custom_string do
      datatype { CustomField::String }
    end
  end
end
