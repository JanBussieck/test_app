defmodule Testapp.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Testapp.Jobs.Job

  schema "tags" do
    field :title, :string
    many_to_many(:jobs, Job, join_through: "job_tags")

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
