defmodule Jototter.Content do
    import Jototter.Content.QueryHelper

    alias Jototter.{Repo}
    alias Jototter.Content.{Note,Tag}

    def find_note(id, context) do 
        query = 
            Note 
            |> for_authenticated_user(context)
        Repo.get(query, id)
    end

    def list_notes(args, context) do 
        query = 
            Note 
            |> for_authenticated_user(context)
            |> with_tag(args)
        Repo.all(query)
    end

    def find_tag(id, context) do 
        query = 
            Tag 
            |> for_authenticated_user(context)
        
        Repo.get(query, id)
    end

    def list_tags(args, context) do 
        query = 
            Tag 
            |> for_authenticated_user(context)
            |> with_label(args)
        Repo.all(query)
    end

end