defmodule Jototter.Users do

    alias Jototter.Repo
    
    def find_user(id) do 
        Repo.get(Jototter.User, id)
    end

end