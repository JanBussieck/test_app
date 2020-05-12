defmodule Testapp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :accepts_terms, :boolean, default: false
    field :email, :string
    field :name, :string
    field :occupation, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :occupation, :accepts_terms])
    |> validate_required([:name, :email, :occupation, :accepts_terms])
  end
end
