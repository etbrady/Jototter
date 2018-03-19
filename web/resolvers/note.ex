defmodule Jototter.Resolvers.Note do
    alias Jototter.Notes
    
    def list_notes(_parent, args, context) do 
        {:ok, Notes.list_notes(args, context)}
    end

    def list_notes(_parent, _args, _context) do 
        {:error, "Access Denied"}
    end

    def find_note(_parent, %{id: id}, context) do
        case Notes.find_note(id, context) do
            nil ->
                {:error, "Note ID #{id} not found"}
            note ->
                {:ok, note}
        end
    end

end
