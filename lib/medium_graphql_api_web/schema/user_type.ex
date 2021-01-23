defmodule MediumGraphqlApiWeb.Schema.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :role, :string
  end

  input_object :user_input_type do
    field :first_name, not_null(:string)
    field :last_name, not_null(:string)
    field :email, not_null(:string)
    field :password, not_null(:string)
    field :password_confirmation, not_null(:string)
  end
end
