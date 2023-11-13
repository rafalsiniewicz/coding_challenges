defmodule Newsletter do
  def read_emails(path) do
    File.read!(path) |> String.split(~r{\r\n}, trim: true)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails_list = read_emails(emails_path)
    pid = open_log(log_path)
    # do_send_email(emails_list, send_fun, pid)
    Enum.each(emails_list, fn x ->
      if send_fun.(x) == :ok do
        log_sent_email(pid, x)
      end
    end)
    close_log(pid)
  end

  # defp do_send_email([], _send_fun, _pid) do
  #   nil
  # end

  # defp do_send_email([head | tail], send_fun, pid) do
  #   if send_fun.(head) == :ok do
  #     log_sent_email(pid, head)
  #   end
  #   do_send_email(tail, send_fun, pid)
  # end
end

# 1
[
  "rick@example.com",
  "choochoo42@example.com",
  "anna@example.com"
] = Newsletter.read_emails(
  "model_train_friends_emails.txt"
  )

# 2
pid = Newsletter.open_log("newsletter_issue1_log.txt")
true = is_pid(pid)

# 3
:ok = Newsletter.log_sent_email(pid, "joe@example.com")

# 4
:ok = Newsletter.close_log(pid)

# 5
:ok = Newsletter.send_newsletter(
  "model_train_friends_emails.txt",
  "newsletter_issue1_log.txt",
  fn email -> :ok end
)
