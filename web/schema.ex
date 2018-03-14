defmodule Jototter.Schema do 
    use Absinthe.Schema
    import_types Jototter.Schema.Types 

    alias Jototter.Resolvers

    query do 
        field :notes, list_of(:note) do 
            resolve &Resolvers.Note.list_notes/3
        end

        field :note, :note do 
            arg :id, non_null(:id)
            resolve &Resolvers.Note.find_note/3
        end

        field :user, :user do 
            arg :id, non_null(:id)
            resolve &Resolvers.User.find_user/3
        end

        field :tags, list_of(:tag) do 
            resolve &Resolvers.Tag.list_tags/3
        end

        field :tag, :tag do 
            arg :id, non_null(:id)
            resolve &Resolvers.Tag.find_tag/3
        end

    end
end
