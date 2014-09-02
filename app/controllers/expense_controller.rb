class Expensecontroller < ApplicationController

  def new
    @expense = Expense.new
  end
end
