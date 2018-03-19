defmodule Jototter.Resolvers.User do
    alias Jototter.{Users,Session,Guardian} 

    def login(_parent, args, _context) do 
        with {:ok, user} <- Session.authenticate(args),
             {:ok, jwt, _ } <- Guardian.encode_and_sign(user, {}, :access) do
        {:ok, %{token: jwt}}
        end
    end

    def find_user(_parent, %{id: id}, _context) do
        case Users.find_user(id) do
            nil ->
                {:error, "User ID #{id} not found"}
            user ->
                {:ok, user}
        end
    end

    def find_user(_parent, %{email: email}, _context) do
        case Users.find_user_by_email(email) do
            nil ->
                {:error, "User not found"}
            user ->
                {:ok, user}
        end
    end

    def update_user(parent, %{id: id, user: user} = args, context) do 
        case find_user(parent, args, context) do
            {:ok, found_user} -> 
                Users.update_user(found_user, user)
            {:error, error} -> 
                {:error, error}
        end
    end
end
