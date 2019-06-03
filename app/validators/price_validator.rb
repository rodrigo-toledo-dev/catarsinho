
class PriceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.project_id.blank?
      record.errors[attribute] << I18n.t('activerecord.errors.messages.missing_project')
      return
    end

    if (record.project.value_missing - value.to_f) < 0
      record.errors[attribute] << I18n.t('activerecord.errors.messages.more_than_needs')
      return
    end
  end
end
