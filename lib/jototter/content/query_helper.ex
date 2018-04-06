defmodule Jototter.Content.QueryHelper do

    import Ecto.Query

    alias Jototter.Content.{Note,Tag}

    def for_authenticated_user(query, context) 
    def for_authenticated_user(query, %{context: %{authenticated_user: user}}) do
        query 
        |> where([n], n.user_id == ^user.id)
    end 
    def for_authenticated_user(query, _context) do
       query
    end 

    def with_label(query, args) 
    def with_label(query, %{:label => label}) do 
        query 
        |> where([t], t.label == ^label)
    end
    def with_label(query, _args) do 
        query 
    end

    def with_tag(query, args)
    def with_tag(query, %{:tag => %Tag{:label => label}}) do 
        query 
        |> join(:inner, [n], t in assoc(n, :tags))
        |> where([_, t], t.label == ^label)
    end
    def with_tag(query, _args) do 
        query
    end

end
