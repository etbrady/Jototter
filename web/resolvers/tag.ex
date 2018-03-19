defmodule Jototter.Resolvers.Tag do
    alias Jototter.Tags

    def list_tags(_parent, args, context) do 
        IO.inspect context
        {:ok, Tags.list_tags(args, context)}
    end

    def find_tag(_parent, %{id: id}, context) do
        case Tags.find_tag(id, context) do
            nil ->
                {:error, "tag ID #{id} not found"}
            tag ->
                {:ok, tag}
        end
    end

end
