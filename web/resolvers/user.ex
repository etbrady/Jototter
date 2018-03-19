defmodule Jototter.Resolvers.User do
    alias Jototter.Repo 
    alias Jototter.Users

    def find_user(_parent, %{id: id}, _resolution) do
        case Users.find_user(id) do
            nil ->
                {:error, "User ID #{id} not found"}
            user ->
                {:ok, user}
        end
    end

    def update_user(parent, %{id: id, user: user} = args, resolution) do 
        case find_user(parent, args, resolution) do
            {:ok, found_user} -> 
                Users.update_user(found_user, user)
            {:error, error} -> 
                {:error, error}
        end
    end
end
