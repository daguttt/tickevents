class FutureDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value||= Time.now # In case the user has not provided a date
    record.errors.add(attribute, :future_date) unless value > Time.now
  end
end
