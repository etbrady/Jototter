defmodule Jototter.Resolvers.Note do
    alias Jototter.Repo 
    alias Jototter.Note

    def list_notes(_args, _info) do 
        {:ok, Repo.all(Note)}
    end

    def list_notes(_parent, _args, _resolution) do 
        {:ok, Repo.all(Note)}
    end

end
