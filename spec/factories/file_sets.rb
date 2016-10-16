FactoryGirl.define do
  # The ::FileSet model is defined in .internal_test_app/app/models by the
  # curation_concerns:install generator.
  factory :file_set, class: FileSet do
    transient do
      user { FactoryGirl.create(:user) }
      content nil
    end

    after(:create) do |file, evaluator|
      if evaluator.content
        Hydra::Works::UploadFileToFileSet.call(file, evaluator.content)
      end
    end

    after(:build) do |file, evaluator|
      file.apply_depositor_metadata(evaluator.user.user_key)
    end
  end
end
