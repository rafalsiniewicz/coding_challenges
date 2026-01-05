defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    bits_for_number(color_count - 1)
  end

  defp bits_for_number(n) when n <= 1 do
    n
  end

  defp bits_for_number(n) do
    Integer.floor_div(n, 2)
    |> bits_for_number()
    |> Kernel.+(1)
  end

  # defp bits_for_number(n, i \\ 1) do
  #   if Integer.pow(i, 2) >= n do
  #     1
  #   else
  #     1 + bits_for_number(n, i + 1)
  #   end
  # end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count) do
    nil
  end

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<first_pixel::size(bit_size), _rest::bitstring>> = picture
    first_pixel
  end


  def drop_first_pixel(<<>>, _color_count) do
    empty_picture()
  end

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)
    <<_first_pixel::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end

# 1
4 = PaintByNumber.palette_bit_size(13)
1 = PaintByNumber.palette_bit_size(2)
2 = PaintByNumber.palette_bit_size(4)

# 4
picture = <<2::4, 0::4>>
color_count = 13
pixel_color_index = 11
<<178, 0::size(4)>> = PaintByNumber.prepend_pixel(picture, color_count, pixel_color_index)
# (which is equal to <<11::4, 2::4, 0::4>>)

# 5
picture = <<19::5, 2::5, 18::5>>
color_count = 20

19 = PaintByNumber.get_first_pixel(picture, color_count)

# 6
picture = <<2::3, 5::3, 5::3, 0::3>>
color_count = 6

<<180, 0::size(1)>> = PaintByNumber.drop_first_pixel(picture, color_count)
# (which is equal to <<5::3, 5::3, 0::3>>)

# 7
picture1 = <<52::6, 51::6>>
picture2 = <<0::6, 34::6, 12::6>>

<<211, 48, 34, 12::size(6)>> = PaintByNumber.concat_pictures(picture1, picture2)
# (which is equal to <<52::6, 51::6, 0::6, 34::6, 12::6>>)
