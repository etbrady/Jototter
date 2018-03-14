defmodule Jototter.Schema.Types do 
    use Absinthe.Schema.Notation

    object :user do 
        field :id, :id 
        field :first_name, :string
        field :last_name, :string
        field :email, :string 
        field :notes, list_of(:note)
    end
    
    object :note do 
        field :id, :id
        field :text, :string
        field :user, :user
    end

    object :tag do 
        field :id, :id 
        field :user, :user
    end
end
