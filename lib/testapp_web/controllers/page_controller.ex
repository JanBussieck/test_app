defmodule TestappWeb.PageController do
  use TestappWeb, :controller

  alias Testapp.Accounts
  alias Testapp.Accounts.User

  def index(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "index.html", changeset: changeset)
  end

  def thank_you(conn, _params) do
    render(conn, "thank_you.html")
  end

  def policy(conn, _params) do
    render(conn, "policy.html")
  end
end
