defmodule LogParser do
  def valid_line?(line), do: line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/

  def split_line(line), do: Regex.split(~r/<[\-*=~]*>/, line)

  def remove_artifacts(line), do: Regex.replace(~r/end-of-line\d+/i, line, "")

  def tag_with_user_name(line) do
    if Regex.match?(~r/User/, line) do
      user =
        Regex.run(~r/(?<=User\s)\s*(\S+)/, line)
        |> Enum.at(1)
        |> to_string()

      "[USER] #{user} #{line}"
    else
      line
    end
  end
end
