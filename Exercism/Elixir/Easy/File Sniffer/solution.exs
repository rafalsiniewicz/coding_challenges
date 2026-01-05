defmodule FileSniffer do
  def type_from_extension("exe") do
    "application/octet-stream"
  end

  def type_from_extension("bmp") do
    "image/bmp"
  end

  def type_from_extension("png") do
    "image/png"
  end

  def type_from_extension("jpg") do
    "image/jpg"
  end

  def type_from_extension("gif") do
    "image/gif"
  end

  def type_from_extension(_extension) do
    nil
  end

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _body::binary>>) do
    "application/octet-stream"
  end

  def type_from_binary(<<0x42, 0x4D, _body::binary>>) do
    "image/bmp"
  end

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _body::binary>>) do
    "image/png"
  end

  def type_from_binary(<<0xFF, 0xD8, 0xFF, _body::binary>>) do
    "image/jpg"
  end

  def type_from_binary(<<0x47, 0x49, 0x46, _body::binary>>) do
    "image/gif"
  end

  def type_from_binary(_file_binary) do
    nil
  end

  def verify(file_binary, extension) do
    tfe = type_from_extension(extension)
    tfb = type_from_binary(file_binary)
    if tfe == tfb and not is_nil(tfe) do
      {:ok, tfe}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end


# 1
"application/octet-stream" = FileSniffer.type_from_extension("exe")

nil = FileSniffer.type_from_extension("txt")

# 2
# file = File.read!("application.exe")
# |> IO.inspect()
# "application/octet-stream" = FileSniffer.type_from_binary(file)

# file = File.read!("example.txt")
# nil = FileSniffer.type_from_binary(file)

# 3
# file = File.read!("application.exe")

# {:ok, "application/octet-stream"} = FileSniffer.verify(file, "exe")

# {
#   :error,
#   "Warning, file format and file extension do not match."
# } = FileSniffer.verify(file, "png")
