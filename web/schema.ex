defmodule Jototter.Schema do 
    use Absinthe.Schema
    import_types Jototter.Schema.Types 

    alias Jototter.Resolvers

    query do 
        field :notes, list_of(:note) do 
            arg :tag, :tag_input
            resolve &Resolvers.Content.list_notes/3
        end

        field :note, :note do 
            arg :id, non_null(:id)
            resolve &Resolvers.Content.find_note/3
        end

        field :user, :user do 
            arg :id, non_null(:id)
            resolve &Resolvers.User.find_user/3
        end

        field :tags, list_of(:tag) do 
            arg :label, :string
            resolve &Resolvers.Content.list_tags/3
        end

        field :tag, :tag do 
            arg :id, non_null(:id)
            resolve &Resolvers.Content.find_tag/3
        end

    end

    mutation do 
        field :update_user, type: :user do
            arg :id, non_null(:id)
            arg :user, :user_input
            resolve &Resolvers.User.update_user/3
        end

        field :login, type: :session do
            arg :email, non_null(:string)
            arg :password, non_null(:string)
            resolve &Resolvers.User.login/3
        end
    end
end
