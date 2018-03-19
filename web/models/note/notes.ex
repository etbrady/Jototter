defmodule Jototter.Notes do
    import Ecto.Query

    alias Jototter.{Note,Repo,Tag}

    defp authenticated_user(query, _args, context) 
    defp authenticated_user(query, _args, %{context: %{authenticated_user: user}}) do
        query 
        |> where([n], n.user_id == ^user.id)
    end 
    defp authenticated_user(query, _args, _context) do
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

    def list_notes(args, context) do 
        query = 
            Note 
            |> authenticated_user(args, context)
            |> tag(args)
        Repo.all(query)
    end

    def find_note(id) do 
        Repo.get(Note, id)
    end

end