defmodule Testapp.JobsLive do
  use Phoenix.LiveView

  alias Testapp.Jobs
  alias Testapp.Tags
  alias TestappWeb.JobView

  def mount(_params, _session, socket) do
    Jobs.subscribe()

    {:ok, fetch(socket)}
  end

  def render(assigns) do
    JobView.render("jobs.html", assigns)
  end

  def handle_event("create", %{"job" => job}, socket) do
    Jobs.create_job(job)

    {:noreply, fetch(socket)}
  end

  # def handle_event("toggle_done", %{"id" => id}, socket) do
  #   todo = Jobss.get_todo!(id)
  #   Jobs.update_todo(todo, %{done: !todo.done})
  #   {:noreply, socket}
  # end

  def handle_info({Jobs, [:job | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    jobs = Jobs.list_jobs()
    tags = Tags.list_tags()
    assign(socket, %{jobs: jobs, tags: tags})
  end
end
