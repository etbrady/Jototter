defmodule Jototter.Notes do
    import Ecto.Query

    alias Jototter.{Note,Repo}

    defp tag(query, args)
    defp tag(query, %{:tag => tag}) do 
        query 
        |> join(:inner, [n], t in assoc(n, :tags))
        |> where([_, t], t.label == ^tag.label)
    end
    defp tag(query, _args) do 
        query
    end

    def list_notes(args) do 
        query = 
            Note 
            |> tag(args)
        Repo.all(query)
    end

    def find_note(id) do 
        Repo.get(Note, id)
    end

end