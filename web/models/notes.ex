defmodule Jototter.Notes do
    import Ecto.Query

    alias Jototter.{Note,Repo}
    
    def list_notes(%{:tag => tag}) do 
        from(n in Note,
            join: t in assoc(n, :tags),
            where: t.label == ^tag.label
            )
        |> Repo.all
    end

    def list_notes(_args) do 
        Repo.all(Note)
    end

    def find_note(id) do 
        Repo.get(Note, id)
    end

end