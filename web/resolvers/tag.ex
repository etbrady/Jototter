defmodule Jototter.Resolvers.Tag do
    alias Jototter.{Tag,Tags}

    def list_tags(_parent, args, resolution) do 
        {:ok, Tags.list_tags(args, resolution)}
    end

    def find_tag(_parent, %{id: id}, _resolution) do
        case Tags.find_tag(id) do
            nil ->
                {:error, "tag ID #{id} not found"}
            tag ->
                {:ok, tag}
        end
    end

end
