defmodule Jototter.Resolvers.Note do
    alias Jototter.{Note,Notes}

    def list_notes(_parent, _args, _resolution) do 
        {:ok, Notes.list_notes()}
    end

    def find_note(_parent, %{id: id}, _resolution) do
        case Notes.find_note(id) do
            nil ->
                {:error, "Note ID #{id} not found"}
            note ->
                {:ok, note}
        end
    end

end
