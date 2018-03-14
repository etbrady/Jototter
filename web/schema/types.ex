defmodule Jototter.Schema.Types do 
    use Absinthe.Schema.Notation
    
    object :note do 
        field :id, :id
        field :text, :string
    end
end
