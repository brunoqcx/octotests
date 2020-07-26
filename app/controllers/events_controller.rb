class EventsController < ApplicatonController
  def create
    if form.save
      render json: form.event, status: :created
    else
      render json: { errors: form.errors }, status: :unprocessable_entity
    end
  end

  private

  def form
    @form ||= form_klass.new(params)
  end

  def form_klass
    EventFormRetriever.new(type_param).call
  end

  def type_param
    "issues" #TODO grab from header
  end
end
