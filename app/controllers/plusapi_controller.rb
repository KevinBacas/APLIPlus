# encoding: utf-8

require 'net/http'

class PlusapiController < ActionController::API

  def listAll
    list = Plus.all.to_json
    render json: list
  end

  def addPlus
    plus = Plus.find(params[:id])
    res = plus.addPlus
    plus.save

    if (res % 10) == 0
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

    render json: {plus_number: res}
  end

  def subPlus
    plus = Plus.find(params[:id])
    res = plus.subPlus
    plus.save
    render json: {plus_number: res}
  end

  def getLaid
    plus = Plus.find(params[:id])
    res = plus.getLaid
    plus.save
    render json: {plus_number: res}
  end

end
