defmodule NameBadge do
  def print(id, name, department) do
    if id do
      if department == nil do
        "[#{id}] - #{name} - OWNER"
      else
        "[#{id}] - #{name} - #{department |> String.upcase()}"
      end
    else
      if department == nil do
        "#{name} - OWNER"
      else
        "#{name} - #{department |> String.upcase()}"
      end
    end
  end
end
