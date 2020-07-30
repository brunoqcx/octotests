class EventFormRetriever
  def initialize(type)
    @type = type
  end

  def call
    begin 
      "Events::#{klass}Form".constantize
    rescue NameError => e
      Events::BaseForm
    end
  end

  private

  attr_reader :type

  def klass
    type.singularize.capitalize
  end

end
