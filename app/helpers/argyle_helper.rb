module ArgyleHelper
  def plaid_link(options)
    raise "No Argyle configuration found. Does initializers/argyle.rb exist?" unless Argyle.configuration
    raise "Public key must be set in Argyle configuration" unless Argyle.configuration.key
    raise "options[:name] is required for Plaid Link" unless options[:name]
    raise "options[:action] is required for Plaid Link" unless options[:action]

    id = options[:form_id] || 'plaidForm'
    product = options[:product] || Argyle.configuration.product
    env = options[:env] || Argyle.configuration.env

    tag = <<-TAGS
    <form id="#{id}" method="GET" action="#{options[:action]}"></form>
    <script
    src="#{Argyle.configuration.plaid_src}"
    data-client-name="#{options[:name]}"
    data-form-id="#{id}"
    data-key="#{Argyle.configuration.key}"
    data-product="#{product}"
    data-env="#{env}"></script>
    TAGS

    tag
  end
end