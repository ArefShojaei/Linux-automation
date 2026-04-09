class Request
  attr_reader :commands

  def initialize
    @commands = []
  end

  def GET(url, headers: {}, params: {})
    url = apply_params(url, params)
    @commands << build_command("GET", url, headers: headers)
  end

  def POST(url, headers: {}, data: nil, json: nil)
    @commands << build_command("POST", url, headers: headers, data: data, json: json)
  end

  def PUT(url, headers: {}, data: nil, json: nil)
    @commands << build_command("PUT", url, headers: headers, data: data, json: json)
  end

  def PATCH(url, headers: {}, data: nil, json: nil)
    @commands << build_command("PATCH", url, headers: headers, data: data, json: json)
  end

  def DELETE(url, headers: {})
    @commands << build_command("DELETE", url, headers: headers)
  end

  private

  def apply_params(url, params)
    return url if params.empty?
    query = URI.encode_www_form(params)
    url.include?("?") ? "#{url}&#{query}" : "#{url}?#{query}"
  end
end


class Curl < Request
  private

  def build_command(method, url, headers: {}, data: nil, json: nil)
    cmd = ["curl -X #{method} '#{url}'"]

    headers.each do |k, v|
      cmd << "-H '#{k}: #{v}'"
    end

    if json
      cmd << "-H 'Content-Type: application/json'"
      cmd << "-d '#{json.to_json}'"
    elsif data
      cmd << "-d '#{data.is_a?(Hash) ? URI.encode_www_form(data) : data}'"
    end

    cmd.join(" ")
  end
end


class Wget < Request
  private

  def build_command(method, url, headers: {}, data: nil, json: nil)
    case method
    when "GET"
      "wget '#{url}'"
    else
      # Wget فقط POST را پشتیبانی می‌کند — بقیه را شبیه‌سازی می‌کنیم
      cmd = ["wget --method=#{method} '#{url}'"]

      headers.each do |k, v|
        cmd << "--header='#{k}: #{v}'"
      end

      if json
        cmd << "--header='Content-Type: application/json'"
        cmd << "--body-data='#{json.to_json}'"
      elsif data
        cmd << "--body-data='#{data}'"
      end

      cmd.join(" ")
    end
  end
end
