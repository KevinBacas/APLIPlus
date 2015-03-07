# encoding: utf-8

require 'net/http'

class PlusapiController < ApplicationController

  before_action :adminFilter, only: [:addPlus, :subPlus, :getLaid]

  def listAllUser
    list = User.all.to_json(:only => [ :id, :first_name, :last_name, :plus_number ])
    render json: list
  end

  def listAllPlus
    list = Plus.all.to_json
    render json: list
  end

  def adminFilter
    @user = User.find(current_user)
    @is_admin = @user.is_admin?
    if @is_admin == false
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def addPlus
    user = User.find(params[:id])
    res = user.addPlus

    if (res.is_a? Integer) and ((res % 10) == 0) and false
      Thread.new do
        message = plus.first_name + ' a maintenant ' + res.to_s + ' plus ! Brace yourselves.'
        params = {
            'token' => 'xoxp-3217377900-3217377902-3223374508-251648',
            'channel' => '#apliplus',
            'text' => message,
            'username' => 'APLIBot',
        }
        url = 'https://slack.com/api/chat.postMessage?' + URI.encode_www_form(params)
        url = URI.parse(url)

        req = Net::HTTP::Get.new(url.to_s)
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == "https")
        response = http.request(req)
      end
    end

    render json: {plus_number: user.plus_number}
  end

  def subPlus
    user = User.find(params[:id])
    res = user.subPlus

    #TODO: message

    user.save
    render json: {plus_number: user.plus_number}
  end

  def getLaid
    user = User.find(params[:id])
    res = user.getLaid

    #TODO: message

    user.save
    render json: {plus_number: user.plus_number}
  end

end
