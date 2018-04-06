defmodule Jototter.Resolvers.Content do
    alias Jototter.Content

    def find_note(_parent, %{id: id}, context) do
        case Content.find_note(id, context) do
            nil ->
                {:error, "Note ID #{id} not found"}
            note ->
                {:ok, note}
        end
    end
    
    def list_notes(_parent, args, context) do 
        {:ok, Content.list_notes(args, context)}
    end

    def list_notes(_parent, _args, _context) do 
        {:error, "Access Denied"}
    end

    def find_tag(_parent, %{id: id}, context) do
        case Content.find_tag(id, context) do
            nil ->
                {:error, "tag ID #{id} not found"}
            tag ->
                {:ok, tag}
        end
    end

    def list_tags(_parent, args, context) do 
        IO.inspect context
        {:ok, Content.list_tags(args, context)}
    end

    

end
