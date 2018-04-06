defmodule Jototter.ContentQueryHelperTest do
    use Jototter.ModelCase

    alias Jototter.Content.{Note,QueryHelper} 

    @initial_query Note


    test "query filtering for authenticated user with no authenticated user leaves the query unchanged" do
        args = nil

        resulting_query = @initial_query
            |> QueryHelper.for_authenticated_user(args)
        
        assert resulting_query == @initial_query
    end

    test "query filtering for an authenticated user filters by user id" do
        user_id = 1
        args = %{context: %{authenticated_user: %{id: user_id}}}

        resulting_query = @initial_query
            |> QueryHelper.for_authenticated_user(args)
        
        expected_query = Note 
            |> where([n], n.user_id == ^user_id)

        assert queries_equal(expected_query, resulting_query)

    end

end
