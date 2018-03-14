defmodule Jototter.Notes do
    import Ecto.Query

    alias Jototter.{Note,Repo}
    
    def list_notes do 
        Repo.all(Note)
    end

    def find_note(id) do 
        Repo.get(Note, id)
    end

end