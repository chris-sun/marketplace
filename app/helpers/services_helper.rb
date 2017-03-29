module ServicesHelper
  def service_quantity_opts(service)
    price = service.price
    [].tap do |a|
      1.upto(5) do |i|
        text = "#{i} ($#{price * i})"
        a << [text, i]
      end
    end
  end
end
