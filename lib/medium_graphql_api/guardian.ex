defmodule MediumGraphqlApi.Guardian do
  use Guardian, otp_app: :medium_graphql_api
  alias MediumGraphqlApi.Accounts

  def subject_for_token(%Accounts.User{} = user, _claims), do: {:ok, to_string(user.id)}
  def subject_for_token(_, _), do: {:error, :reason_for_error}
  def resource_from_claims(%{"sub" => id}), do: {:ok, Accounts.get_user!(id)}
  def resource_from_claims(_claims), do: {:error, :reason_for_error}
end
