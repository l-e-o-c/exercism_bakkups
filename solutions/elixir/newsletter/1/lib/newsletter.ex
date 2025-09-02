defmodule Newsletter do
  def read_emails(path) do
    case File.read(path) do
      {:ok, binary} ->
        binary
        |> String.trim()
        |> String.split("\n")
      {:error, _} -> []
    end
  end

  def open_log(path) do
    {:ok, pid} = File.open(path, [:write])
    pid
  end

  def log_sent_email(pid, email) do
    IO.binwrite(pid, email <> "\n")
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log = open_log(log_path)
    read_emails(emails_path)
    |> Enum.each(fn email ->
      if send_fun.(email) == :ok do
        log_sent_email(log, email)
      end
    end)

    close_log(log)
  end
end
