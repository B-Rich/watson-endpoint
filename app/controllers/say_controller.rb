require 'json'
require 'httparty'
require 'open-uri'

# Controller and action definition for uri say/hello
# See routing configuration in config/routes.rb
class SayController < ApplicationController
  def hello
    # Upcase forcing Watson Analysis and accent removal for url encoding with no problems
    text = I18n.transliterate(params[:text].upcase)
    switch = params[:switch]

    response_dev = HTTParty.get("https://USERNAME:PASSWORD@gateway.watsonplatform.net/natural-language-understanding/api/v1/analyze?version=2017-02-27&text=#{text}&features=#{switch}")

    puts "response_dev: #{response_dev}"

    render :json => response_dev
  end
end
