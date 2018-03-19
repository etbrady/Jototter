defmodule Jototter.Users do

    alias Jototter.{Repo,User}
    
    def find_user(id) do 
        Repo.get(Jototter.User, id)
    end

    def update_user(user, user_input) do 
        user
        |> User.update_changeset(user_input)
        |> Repo.update
    end

end