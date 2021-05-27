module Types
  class ValidationErrorsType < Types::BaseObject
    field :details, String, null: false
    field :message, String, null: false

    def details
      object.details.to_json
    end
  end
end
