defmodule Testapp.Tags do
  @moduledoc """
  The tags context.
  """

  import Ecto.Query, warn: false
  alias Testapp.Repo

  alias Testapp.Tags.Tag
  alias Testapp.JobTag

  def list_tags do
    Repo.all(Tag)
  end

  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def add_tag(job_id, tag_id) do
    JobTag.changeset(%JobTag{}, %{job_id: job_id, tag_id: tag_id})
    |> Repo.insert()
  end
end
