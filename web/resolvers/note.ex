defmodule Jototter.Resolvers.Note do
    alias Jototter.{Note,Notes}

    def list_notes(_parent, _args, _resolution) do 
        {:ok, Notes.list_notes()}
    end

end
