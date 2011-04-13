# Copyright (c) 2011 gocept gmbh & co. kg
# See also LICENSE.txt

require 'query'


class SpentTimeColumn < QueryColumn

  def initialize
    super(:spent_time, :groupable => false)
  end

  def value(issue)
    issue.spent_hours
  end
end


class RemainingTimeColumn < QueryColumn

  def initialize
    super(:remaining_time, :groupable => false)
  end

  def value(issue)
    field = IssueCustomField.find_by_name('Estimated time')
    estimated = issue.custom_value_for(field).value
    estimated = estimated.to_f unless estimated.blank?
    estimated ? estimated - issue.spent_hours : 'n/a'
  end
end
