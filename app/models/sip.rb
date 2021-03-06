class Sip < Sequel::Model(:sip)
  DEFAULT_ATTRIBUTES = {
    allow: 'alaw;ulaw;g729',
    deny: '0.0.0.0/0.0.0.0',
    permit: '0.0.0.0/0.0.0.0'
  }

  def before_validation
    set_default_attributes
    super
  end

  def validate
    super
    validates_presence :name
    validates_presence :number
    validates_unique :name
    validates_unique :number
  end

  def number=(num)
    super
    # Love this one
    self.accountcode = self.context = self.name = self.defaultuser = self.cid_number = num
  end

  private

  def set_default_attributes
    DEFAULT_ATTRIBUTES.each do |attribute, value|
      next unless self.send(attribute).nil?
      self.send("#{attribute}=", value)
    end
  end

  def default_variables
    { tchannel: 'SIP' }
  end
end
