defmodule NameBadge do
  def print(id, name, department) do
    if id do
      if department do
        "[#{id}] - #{name} - #{String.upcase(department)}"
      else
        "[#{id}] - #{name} - OWNER"
      end
    else
      if department do
        "#{name} - #{String.upcase(department)}"
      else
        "#{name} - OWNER"
      end
    end
  end
end



"[67] - Katherine Williams - STRATEGIC COMMUNICATION" = NameBadge.print(67, "Katherine Williams", "Strategic Communication")
"Robert Johnson - PROCUREMENT" = NameBadge.print(nil, "Robert Johnson", "Procurement")
"[204] - Rachel Miller - OWNER" = NameBadge.print(204, "Rachel Miller", nil)
"Rachel Miller - OWNER" = NameBadge.print(nil, "Rachel Miller", nil)
