class ApplicationController < ActionController::Base; end
ApplicationController.view_paths = File.dirname(__FILE__)

class InvokeController < ApplicationController
  layout 'application'
  ext_action :acceptance_test, :text

  def nested
    render :action => 'nested'
  end

  def with_view
    render :inline => <<-EOS
      <html>
        <body>
          <%= invoke(:acceptance_test, :render) %>
        </body>
      </html>
    EOS
  end
end

# helpers
Object.const_set(:ApplicationHelper, Module.new)
