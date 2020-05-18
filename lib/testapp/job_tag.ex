defmodule Testapp.JobTag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Testapp.Jobs.Job
  alias Testapp.Tags.Tag

  schema "job_tags" do
    belongs_to :job, Job
    belongs_to :tag, Tag

    timestamps()
  end

  @doc false
  def changeset(job_tag, attrs) do
    job_tag
    |> cast(attrs, [:job_id, :tag_id])
    |> validate_required([])
  end
end
