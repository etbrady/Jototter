defmodule Jototter.Tags do
    import Ecto.Query

    alias Jototter.{Tag,Repo}

    def list_tags do 
        Repo.all(Tag)
    end

end