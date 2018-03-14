defmodule Jototter.Tags do
    alias Jototter.{Tag,Repo}

    def list_tags do 
        Repo.all(Tag)
    end

     def find_tag(id) do 
        Repo.get(Tag, id)
    end

end