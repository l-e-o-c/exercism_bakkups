defmodule RPNCalculator.Exception do

  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    @message "stack underflow occurred"
    defexception message: @message

    @impl true
    def exception([]), do: %__MODULE__{}
    def exception(context), do: %__MODULE__{message: @message <> ", context: #{context}"}
  end

  def divide(stack) when length(stack) < 2, do: raise(StackUnderflowError, "when dividing")
  def divide([0, _]), do: raise DivisionByZeroError
  def divide([divisor, dividend]), do: div(dividend, divisor)
end
