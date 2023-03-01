class ApplicationController < ActionController::Base
  include ExceptionHandler

  before_action :log_start_of_request
  after_action :log_end_of_request

  private

  def log_start_of_request
    @start_time = Time.now.to_f
    log_msg(
      "Started #{request.request_method} #{request.path}",
      request_ip: request.ip,
      params: params,
      url: request.url,
      http_method: request.request_method
    )
  end

  def log_end_of_request
    log_msg(
      "Finished [#{status}] #{request.request_method} #{request.path}",
      action_method: "#{params[:controller]}##{params[:action]}",
      duration: ((Time.now.to_f - @start_time) * 1000).to_i,
      status: status
    )
  end

  def log_msg(message = 'Message', level: :info, **options)
    Rails.logger.send(
      level,
      options.merge(
        request_id: request_id,
        short_message: message,
      )
    )
  end

  def request_id
     @request_id ||= Time.now.to_i
  end
end
