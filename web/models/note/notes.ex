defmodule Jototter.Notes do
    import Ecto.Query

    alias Jototter.{Note,Repo,Tag}

    def context_user(query, _args, resolution) 
    def context_user(query, _args, %{context: %{current_user: user}}) do
        query 
        |> where([n], n.user_id == ^user.id)
    end 
    def context_user(query, _args, resolution) do
       query
    end 

    defp tag(query, args)
    defp tag(query, %{:tag => %Tag{:label => label}}) do 
        query 
        |> join(:inner, [n], t in assoc(n, :tags))
        |> where([_, t], t.label == ^label)
    end
    defp tag(query, _args) do 
        query
    end

    def list_notes(args, resolution) do 
        query = 
            Note 
            |> context_user(args, resolution)
            |> tag(args)
        Repo.all(query)
    end

    def find_note(id) do 
        Repo.get(Note, id)
    end

end