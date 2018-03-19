defmodule Jototter.Guardian do 
    use Guardian, otp_app: :jototter

    alias Jototter.Users

    def subject_for_token(user, _claims) do 
        {:ok, to_string(user.id)}
    end

    def subject_for_token(_, _) do
        {:error, :reason_for_error}
    end

    def resource_from_claims(claims) do 
        user = claims["sub"]
        |> Users.find_user
        IO.puts "resource from calims"
        IO.inspect user
        {:ok, user}
    end
    
    def resource_from_claims(_claims) do
        IO.puts "Error from calims"
        {:error, :reason_for_error}
    end
end