class Invitation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  REFER_TOKEN = "<referer_link>"

  attr_accessor :recipients, :message
  validates_presence_of :recipients, :message
  
  def initialize(recipients, message)
    @recipients, @message = recipients, message
  end
  
  def persisted?
    false
  end
 
end
