defmodule Jototter.Resolvers.Tag do
    alias Jototter.{Tag,Tags}

    def list_tags(_parent, _args, _resolution) do 
        {:ok, Tags.list_tags()}
    end

end
