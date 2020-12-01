class ApiController < ApplicationController
  require 'jwt'

  skip_before_action :verify_authenticity_token

  def encode_token(payload)
    JWT.encode(payload,"s3cr3t");
  end

  def verify_jwt_token
    header_param = request.headers['Authorization']

    if !header_param.nil?

      # Send token in the form "Bearer token"
      token = header_param.split(" ")[1]

      begin
        JWT.decode(token,"s3cr3t",true, algorithm: 'HS256')
      rescue JWT::DecodeError
        render json: {message: "Unauthorized Access"}, status: :unauthorized
      end
    else
      render json: {message: "Unauthorized Access"}, status: :unauthorized
    end
  end

  def user_log_in
    @user = User.find_by_email(params[:email])
    if !@user.nil?
      if @user.valid_password?(params[:password])
        render json: {token: encode_token({user_id: @user.id})}
      else
        render json: { message: 'Wrong username or password' }, status: :unauthorized
      end
    else
      render json: { message: 'Wrong username or password' }, status: :unauthorized
    end
  end

end