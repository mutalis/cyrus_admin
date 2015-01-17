class DomainsController < ApplicationController
  
  # GET /domains
  # GET /domains.json
  def index
    @domains = Domain.all
  end

end
