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
end
