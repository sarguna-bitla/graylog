module ExceptionHandler
    extend ActiveSupport::Concern
  
    included do
      rescue_from StandardError, with: :internal_server_error

      rescue_from ActiveRecord::RecordNotFound, with: :not_found
    end
  
    def internal_server_error(exception)
      log_exception(:error, exception, 500)
      render json: {
        status: false,
        message: 'Internal Server Error',
      }, status: :internal_server_error
    end

    def not_found(exception)
        log_exception(:error, exception, 404)
        render json: {
          status: false,
          message: "#{exception.model.titleize} Not Found",
        }, status: :not_found
    end

    def log_exception(level, exception, status_code, **options)
  
      log_msg(
        exception.inspect,
        level: level,
        backtrace: exception.backtrace.join("\r\n"),
        status: status_code,
        **options
      )
    end
  end
  