defmodule IntermediateGit.Repo do
  use Ecto.Repo,
    otp_app: :intermediate_git,
    adapter: Ecto.Adapters.Postgres
end
