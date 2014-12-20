# encoding: utf-8

require 'net/http'

class PlusapiController < ActionController::API

  def listAll
    list = Plus.all.to_json
    render json: list
  end

  def addPlus
    plus = Plus.find(params[:id])
    #res = plus.addPlus
    #plus.save

    #message = plus.first_name + " a gagné un plus !"
    #params = {
    #    'token' => 'xoxp-3217377900-3217377902-3223374508-251648',
    #    'channel' => '#apliplus',
    #    'text' => message,
    #    'username' => 'APLIBot',
    #}
    #url = 'https://slack.com/api/chat.postMessage?' + URI.encode_www_form(params)
    #url = URI.parse(url)

    #req = Net::HTTP::Get.new(url.to_s)
    #proxy_host = "193.49.200.22"
    #proxy_port = "3128"
    #http = Net::HTTP.new(url.host, url.port, proxy_host, proxy_port)
    #http.use_ssl = (url.scheme == "https")
    #response = http.request(req)
    #render json: {plus_number: res}
  end

  def getLaid
    plus = Plus.find(params[:id])
    res = plus.getLaid
    plus.save
    render json: {plus_number: res}
  end

end
