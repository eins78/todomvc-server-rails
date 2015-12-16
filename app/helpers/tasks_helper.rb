module TasksHelper

  def filter_mode(parameters = params)
    parameters.permit(:active, :completed).try(:first).try(:first).try(:to_sym)
  end
end
