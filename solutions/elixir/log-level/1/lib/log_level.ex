defmodule LogLevel do
  @log_code_label_map %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }
  def to_label(level, legacy?) do
    cond do
      level > 5 or level < 0 -> :unknown
      (level == 0 or level == 5) and legacy? -> :unknown
      true -> @log_code_label_map[level]
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label == :error or label == :fatal -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end
