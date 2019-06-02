
class PriceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.project_id.blank?
      record.errors[attribute] << I18n.t('activerecord.errors.messages.missing_project')
      return
    end

    if (record.project.value_missing - value) < 0
      record.errors[attribute] << I18n.t('activerecord.errors.messages.more_than_needs')
      return
    end
    return true
  end
end
