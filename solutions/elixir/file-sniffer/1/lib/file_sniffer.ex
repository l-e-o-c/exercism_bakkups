defmodule FileSniffer do
  def type_from_extension("exe"), do: "application/octet-stream"
  def type_from_extension("bmp"), do: "image/bmp"
  def type_from_extension("png"), do: "image/png"
  def type_from_extension("jpg"), do: "image/jpg"
  def type_from_extension("gif"), do: "image/gif"
  def type_from_extension(_), do: nil

  def type_from_binary(<<0x7f, 0x45, 0x4c, 0x46, _::binary>>), do: "application/octet-stream"
  def type_from_binary(<<0x42, 0x4d, _::binary>>), do: "image/bmp"
  def type_from_binary(<<0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a, _::binary>>), do: "image/png"
  def type_from_binary(<<0xff, 0xd8, 0xff, _::binary>>), do: "image/jpg"
  def type_from_binary(<<0x47, 0x49, 0x46, _::binary>>), do: "image/gif"
  def type_from_binary(_), do: nil

  def verify(file_binary, extension) do
    if type_from_binary(file_binary) == type_from_extension(extension) and type_from_extension(extension) != nil do
      {:ok, type_from_binary(file_binary)}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
