# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

# Make redirects for SEO needs
class SeoAssist  
  
  def self.call(env)
    request = Rack::Request.new(env)
    params = request.params
    taxon_id = params['taxon']      
    if !taxon_id.blank? && !taxon_id.is_a?(Hash) && @taxon = Taxon.find(taxon_id)
      params.delete('taxon')
      get_query = params.map{|k,v| "#{k}=#{v}"}.join('&')
      return [301, {'Location'=> "/t/#{@taxon.permalink}?#{get_query}" }, []]
    end
    [404, {"Content-Type" => "text/html"}, "Not Found"]
  end
    
end
