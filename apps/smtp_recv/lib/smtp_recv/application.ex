defmodule SMTPRecv.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    smtp_server = %{
      id: :gen_smtp_server,
      start: {:gen_smtp_server, :start_link,
        [SMTPRecv.SMTPServer, Application.get_env(
          :smtp_recv, :smtp_opts)]}}
    children = [
      smtp_server
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SMTPRecv.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
