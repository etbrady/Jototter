defmodule Jototter.Tags do
    import Ecto.Query

    alias Jototter.{Tag,Repo}

    defp context_user(query, _args, resolution) 
    defp context_user(query, _args, %{context: %{current_user: user}}) do
        query 
        |> where([t], t.user_id == ^user.id)
    end 
    defp context_user(query, _args, resolution) do
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

    def list_tags(args, resolution) do 
        query = 
            Tag 
            |> context_user(args, resolution)
            |> label(args)
        Repo.all(query)
    end

    def find_tag(id) do 
        Repo.get(Tag, id)
    end

end