defmodule HighSchoolSweetheart do
  def first_letter(name) do 
    name 
    |> String.trim
    |> String.first
  end
  def initial(name) do
    name
    |> first_letter()
    |> String.upcase
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name
    |> String.split()
    |> Enum.map(fn x -> initial(x) end)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    heart = "     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     X. X.  +  X. X.     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"

    heart 
    |> String.replace("X. X.", initials(full_name1), global: false)
    |> String.replace("X. X.", initials(full_name2), global: false)
  end
end
