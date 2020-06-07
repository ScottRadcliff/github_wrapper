defmodule GithubWrapper.Events do
  @moduledoc """
  A wrapper around the GitHub Events API.
  """

  @doc """
  Pull all public events.

  ## Examples

      iex> GithubWrapper.Events.public()
        {:ok,
         [
           %{
             "actor" => %{
               "avatar_url" => "https://avatars.githubusercontent.com/u/49699333?",
               "display_login" => "dependabot",
               "gravatar_id" => "",
               "id" => 49699333,
               "login" => "dependabot[bot]",
               "url" => "https://api.github.com/users/dependabot[bot]"
             }
          ]
         }
  """
  def public do
    {:ok, res} = HTTPoison.get "https://api.github.com/events"
    Jason.decode(res.body)
  end
end

