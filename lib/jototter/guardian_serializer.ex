defmodule Jototter.GuardianSerializer do
  @behaviour Guardian.Serializer
 
  alias Jototter.Repo
  alias Jototter.User
 
  def subject_for_token(user = %User{}), do: { :ok, "User:#{user.id}" }
  def subject_for_token(_), do: { :error, "Unknown resource type" }
 
  def from_token("User:" <> id), do: { :ok, Repo.get(User, id) }
  def from_token(_), do: { :error, "Unknown resource type" }
end