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
    {:ok, res} = fetch("/events")
    Jason.decode(res.body)
  end

  # TODO: returned filtered events; issue, fork
  def repository(owner, repo) do
    {:ok, res} = fetch("/repos/#{owner}/#{repo}/events")
    Jason.decode(res.body)
  end

  def repository(url) when String.contains?(url, "/") do
    {:ok, res} = fetch("/repos/#{url}/events")
    Jason.decode(res.body)
  end
  

  defp fetch(url) do
    HTTPoison.get Application.fetch_env!(:github_wrapper, :base_url)  <> url
  end
end

