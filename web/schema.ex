defmodule Jototter.Schema do 
    use Absinthe.Schema
    import_types Jototter.Schema.Types 

    alias Jototter.Resolvers

    query do 
        field :notes, list_of(:note) do 
            resolve &Resolvers.Note.list_notes/3
        end

        field :user, :user do 
            arg :id, non_null(:id)
            resolve &Resolvers.User.find_user/3
        end
    end
end
