defmodule MediumGraphqlApi.Accounts.Session do
  alias MediumGraphqlApi.Accounts.User
  alias MediumGraphqlApi.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    IO.inspect(args)
    IO.inspect(user)

    case check_password(user, args) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credential"}
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> Argon2.no_user_verify()
      _ -> Argon2.verify_pass(args.password, user.password_hash)
    end
  end
end
