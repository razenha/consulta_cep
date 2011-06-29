class Application < Sinatra::Base


  class Cep < ActiveRecord::Base
  end

  Cep.establish_connection(YAML.load(File.open("database.yml")))


  get '/:id' do    
    numero = params[:id].gsub(/\-/, "")
    cep = Cep.first(:conditions => ["postal_8l = ? or postal_8r = ?", numero, numero])
    if cep
      content_type "text/xml"
      cep.to_xml
    else
      halt 404, {'Content-Type' => 'text/xml'}, "<erro>Cep não encontrado</erro>"
    end 
  end
end