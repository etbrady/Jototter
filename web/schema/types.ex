defmodule Jototter.Schema.Types do 
    use Absinthe.Schema.Notation
    use Absinthe.Ecto, repo: Jototter.Repo

    object :user do 
        field :id, :id 
        field :first_name, :string
        field :last_name, :string
        field :email, :string 
        field :notes, list_of(:note), resolve: assoc(:notes)
        field :tags, list_of(:tag), resolve: assoc(:tags)
    end
    
    object :note do 
        field :id, :id
        field :text, :string
        field :user, :user, resolve: assoc(:user)
        field :tags, list_of(:tag), resolve: assoc(:tags)
 
    end

    object :tag do 
        field :id, :id 
        field :label, :string
        field :user, :user, resolve: assoc(:user)
        field :notes, list_of(:note), resolve: assoc(:notes)
    end

    input_object :tag_input do 
        field :label, :string
    end
end
