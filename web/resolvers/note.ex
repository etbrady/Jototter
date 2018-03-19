defmodule Jototter.Resolvers.Note do
    alias Jototter.{Note,Notes}
    
    def list_notes(_parent, args, %{context: %{current_user: user}}) do 
        {:ok, Notes.list_notes(args)}
    end

    def list_notes(_parent, args, _resolution) do 
        {:error, "Access Denied"}
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
