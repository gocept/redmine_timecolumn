# Copyright (c) 2011 gocept gmbh & co. kg
# See also LICENSE.txt

require 'redmine'
require_dependency 'query'
require_dependency 'time_column'


Redmine::Plugin.register :redmine_timecolumn do
  name 'Redmine Time Column plugin'
  author 'Wolfgang Schnerring'
  description 'Add a column to issue queries containing the spent time'
  version '0.0.1'
end


Query.add_available_column(SpentTimeColumn.new)
Query.add_available_column(RemainingTimeColumn.new)

# note to self: run test with
# rake test:plugins:units PLUGIN=redmine_timecolumn
