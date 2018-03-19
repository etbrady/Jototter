defmodule Jototter.Tags do
    import Ecto.Query

    alias Jototter.{Tag,Repo}

    defp authenticated_user(query, _args, context) 
    defp authenticated_user(query, _args, %{context: %{authenticated_user: user}}) do
        query 
        |> where([t], t.user_id == ^user.id)
    end 
    defp authenticated_user(query, _args, _context) do
       query
    end

    defp label(query, args) 
    defp label(query, %{:label => label}) do 
        query 
        |> where([t], t.label == ^label)
    end
    defp label(query, _args) do 
        query 
    end

    def list_tags(args, context) do 
        query = 
            Tag 
            |> authenticated_user(args, context)
            |> label(args)
        Repo.all(query)
    end

    def find_tag(id, context) do 
        query = 
            Tag 
            |> authenticated_user(nil, context)
        
        Repo.get(query, id)
    end

end