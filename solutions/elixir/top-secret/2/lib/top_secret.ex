defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part({op, metadata, args}, acc) when op in [:def, :defp],
    do: {{op, metadata, args}, decode_message(args, acc)}

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp decode_message([{_op, _metadata, nil} | _body], acc), do: ["" | acc]

  defp decode_message([{op, _metadata, args} | _body], acc) when op == :when,
    do: decode_message(args, acc)

  defp decode_message([{op, _metadata, args} | _body], acc) do
    msg = op
    |> Atom.to_string()
    |> String.slice(0, Enum.count(args))
    
    [msg | acc]
  end

  def decode_secret_message(string) do
    {_ast, msg} = string
    |> to_ast()
    |> Macro.prewalk([], &decode_secret_message_part/2)

    msg
    |> Enum.reverse()
    |> Enum.join()
  end
end
