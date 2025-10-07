defmodule TakeANumber do
  def start() do
    # Please implement the start/0 function
    background_process = spawn(fn -> TakeANumber.handle_msg(0) end)
    background_process
  end

  def handle_msg(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        handle_msg(state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1)
        handle_msg(state + 1)

      :stop ->
        Process.exit(self(), :kill)

      _ ->
        handle_msg(state)
    end
  end
end
