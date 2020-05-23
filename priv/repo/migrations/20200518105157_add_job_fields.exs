defmodule Testapp.Repo.Migrations.AddJobFields do
  use Ecto.Migration

  def change do
    alter table("jobs") do
      add :start_date, :date
      add :city, :string
      add :country, :string
      add :job_type, :string
    end
  end
end
