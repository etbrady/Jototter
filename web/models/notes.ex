defmodule Jototter.Notes do
    import Ecto.Query

    alias Jototter.{Note,Repo}
    
    def list_notes do 
        Repo.all(Note)
    end

end