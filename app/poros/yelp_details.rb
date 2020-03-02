class YelpDetails
  attr_reader :name, :address, :city, :zip, :state

  def initialize(data)
    @name = data[:businesses][0][:name]
    @address = data[:businesses][0][:location][:address1]
    @city = data[:businesses][0][:location][:city]
    @zip = data[:businesses][0][:location][:zip_code]
    @state = data[:businesses][0][:location][:state]
  end
end
