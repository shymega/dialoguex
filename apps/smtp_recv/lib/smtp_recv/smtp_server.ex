defmodule SMTPRecv.SMTPServer do
  @moduledoc """
  GenServer module for the SMTP server of the SMTPRecv app.
  Part of Dialoguex.
  """

  alias Mail.Parsers.RFC2822
  require Logger
  @behaviour :gen_smtp_server_session

  def init(hostname, session_count, _address, _options) do
    if session_count > 6 do
      Logger.warn(fn () -> "SMTP server connection limit exceeded!" end
      )
      Logger.warn(fn () -> "Rejecting."
      end)
      {:stop, :normal, ["421", hostname, " is unable to accept mail right now. Try again later."]}
    else
      banner = [hostname, " ESMTP"]
      state = %{}
      {:ok, banner, state}
    end
  end

  def handle_DATA(from, to, data, state) do
    Logger.debug(fn () -> "Received DATA message. Processing."
    end)
    Logger.debug(fn () -> "Parsing message."
    end)
    data_parsed = RFC2822.parse(data)
    Logger.debug(fn () -> "Message parsed!"
    end)

    Logger.debug(fn () ->
      "Updating state."
    end)
    state =
      state
      |> Map.put(:message, data_parsed)
      |> Map.put(:raw, data)
    Logger.debug(fn () ->
      "State updated."
    end)

    Logger.debug(fn () ->
      "Finished DATA handling."
    end)
    {:ok, data, state}
  end

  def handle_EHLO(hostname, extensions, state) do
    Logger.info(fn () ->
      "Received connection from #{hostname} (EHLO)"
    end)
    {:ok, extensions, state}
  end

  def handle_HELO(hostname, state) do
    Logger.info(fn () ->
      "Received connection from #{hostname} (HELO)"
    end)
    {:ok, 655360, state}
  end

  def handle_MAIL(from, state) do
    Logger.debug(fn () -> "Received MAIL command from #{from}"
    end)
    {:ok, Map.put(state, :from, from)}
  end

  def handle_MAIL_extension(extension, state) do
    Logger.debug(fn () -> "Received MAIL extension: #{extension}"
    end)
    {:ok, state}
  end

  def handle_RCPT(to, state) do
    Logger.debug(fn () -> "Received RCPT TO: #{to}"
    end)
    {:ok, Map.put(state, :to, to)}
  end

  def handle_RCPT_extension(extension, state) do
    Logger.debug(fn () -> "Received RCPT extension: #{extension}"
    end)
    {:ok, state}
  end

  def handle_RSET(state) do
    Logger.debug(fn () ->
      "Transmission reset."
    end)
    {:ok, state}
  end

  def handle_VRFY(address, state) do
    Logger.debug(fn () ->
      "Received VRFY request for address: #{address}"
    end)
    {:ok, state}
  end
  def handle_other(command, _args, state) do
    Logger.error(fn () -> "Command not recongised. Implement: #{command}"
    end)
    {["500 Error: command not recognized : #{command}"], state}
  end

  def code_change(_old, state, _extra) do
    {:ok, state}
  end

  def terminate(reason, state) do
    Logger.info("Terminating Session: #{reason}")
    {:ok, state}
  end
end
