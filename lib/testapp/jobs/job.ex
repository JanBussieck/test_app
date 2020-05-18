defmodule Testapp.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset
  alias Testapp.Tags.Tag

  schema "jobs" do
    field :description, :string
    field :title, :string
    many_to_many(:tags, Tag, join_through: "job_tags")

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
