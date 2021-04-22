class ApplicationController < ActionController::Base
  class EnvBasicAuth
    class << self
      def protected?
        env_value.present? && env_value.index(":").present?
      end

      def env_value
        ENV['BASIC_AUTH'] || ''
      end

      def username
        env_value.split(':')[0]
      end

      def password
        env_value.split(':')[1]
      end
    end
  end

  http_basic_authenticate_with name: EnvBasicAuth.username, password: EnvBasicAuth.password, if: -> {
    EnvBasicAuth.protected? && !request.format.json?
  }
end
