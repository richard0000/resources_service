require 'sinatra'
###
# @description This class represents (as a sort of template method design pattern)
#   a way to let this service servee resources from different sources.
#   So in this class we will require a concrete gateway to ask for the resources 
###
class ResourceProcessor
  def fetch
    raise NotImplementedError
  end
end