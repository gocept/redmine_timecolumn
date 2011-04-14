# Copyright (c) 2011 gocept gmbh & co. kg
# See also LICENSE.txt

require File.expand_path(File.dirname(__FILE__) + '/../test_helper')
require 'time_column'


class TimeColumnTest < ActiveSupport::TestCase

  fixtures :projects, :issues, :time_entries

  def test_spent_time_yields_issue_cumulated_time
    column = SpentTimeColumn.new
    assert_equal 154.25, column.value(issues(:issues_001))
  end
end
