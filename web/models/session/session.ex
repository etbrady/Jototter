defmodule Jototter.Session do
  use Jototter.Web, :model

  alias Jototter.{Repo,User,Users}
 
  def authenticate(args) do
    user = Users.find_user_by_email(String.downcase(args.email))
    case check_password(user, args.password) do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials"}
    end
  end
 
  defp check_password(nil, password) do 
    false
  end

  defp check_password(user, password) do
    Comeonin.Pbkdf2.checkpw(password, user.password_hash)
  end

end