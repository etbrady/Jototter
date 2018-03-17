defmodule Jototter.Tags do
    import Ecto.Query

    alias Jototter.{Tag,Repo}

    def list_tags(%{:label => label}) do 
        from(tag in Tag,
            where: tag.label == ^label
            )
        |> Repo.all
    end

    def list_tags(_args) do 
        Repo.all(Tag)
    end

    def find_tag(id) do 
        Repo.get(Tag, id)
    end

end