defmodule PaintByNumber do
  def palette_bit_size(color_count), do: palette_bit_size(color_count, 0, 0)

  defp palette_bit_size(color_count, acc, exp) when acc >= color_count, do: exp

  defp palette_bit_size(color_count, _acc, exp),
    do: palette_bit_size(color_count, Integer.pow(2, exp + 1), exp + 1)

  def empty_picture(), do: <<>>

  def test_picture(), do: <<0::2, 1::2, 2::2, 3::2>>

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bits = palette_bit_size(color_count)
    <<pixel_color_index::size(bits), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _), do: nil

  def get_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<first_pixel::size(bits), _::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(<<>>, _), do: <<>>

  def drop_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<_::size(bits), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2), do: <<picture1::bitstring, picture2::bitstring>>
end
