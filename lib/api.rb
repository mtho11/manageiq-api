module Api
  # Semantic Versioning Regex for API, i.e. vMajor.minor.patch[-pre]
  VERSION_REGEX = /v[\d]+(\.[\da-zA-Z]+)*(\-[\da-zA-Z]+)?/

  VERBS_ACTIONS_MAP = {
    :get     => "show",
    :post    => "update",
    :put     => "update",
    :patch   => "update",
    :delete  => "destroy",
    :options => "options"
  }.freeze

  ApiError = Class.new(StandardError)
  AuthenticationError = Class.new(ApiError)
  ForbiddenError = Class.new(ApiError)
  BadRequestError = Class.new(ApiError)
  NotFoundError = Class.new(ApiError)
  UnsupportedMediaTypeError = Class.new(ApiError)

  def self.encrypted_attribute?(attr)
    Environment.encrypted_attributes.include?(attr.to_s) || attr.to_s.include?('password')
  end

  def self.time_attribute?(attr)
    Environment.time_attributes.include?(attr.to_s)
  end

  def self.url_attribute?(attr)
    Environment.url_attributes.include?(attr.to_s)
  end

  def self.resource_attribute?(attr)
    Environment.resource_attributes.include?(attr.to_s)
  end
end
