defmodule Testapp.Tags do
  @moduledoc """
  The tags context.
  """

  import Ecto.Query, warn: false
  alias Testapp.Repo

  alias Testapp.Tags.Tag
  alias Testapp.Jobs.Job
  alias Testapp.JobTag

  def list_tags do
    Repo.all(Tag)
  end

  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def add_tag(job, title) when is_binary(title) do
    tag =
      case Repo.get_by(Tag, %{title: title}) do
        nil ->
          %Tag{} |> Topic.changeset(%{title: title}) |> Repo.insert!()
        tag ->
          tag
      end
    add_tag(job, tag.id)
  end

  def add_tag(%{job_id: job_id}, tag_id) do
    add_tag(job_id, tag_id)
  end

  def add_tag(%Job{} = job, tag_id) do
    add_tag(job.id, tag_id)
  end

  def add_tag(job_id, tag_id) do
    JobTag.changeset(%JobTag{}, %{job_id: job_id, tag_id: tag_id})
    |> Repo.insert()
  end
end
