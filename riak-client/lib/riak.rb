# Copyright 2010 Sean Cribbs, Sonian Inc., and Basho Technologies, Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
$KCODE = "UTF8" if RUBY_VERSION < "1.9"

require 'base64'
require 'uri'
require 'cgi'
require 'set'
require 'net/http'
require 'yaml'
require 'riak/i18n'

# Load JSON
unless defined? JSON
  begin
    require 'yajl/json_gem'
  rescue
    require 'json'
  end
end

require 'riak/core_ext/blank'
require 'riak/core_ext/extract_options'
require 'riak/core_ext/slice'
require 'riak/core_ext/stringify_keys'
require 'riak/core_ext/symbolize_keys'
require 'riak/core_ext/to_param'

# The Riak module contains all aspects of the HTTP client interface
# to Riak.
module Riak
  # Domain objects
  autoload :Bucket,          "riak/bucket"
  autoload :Client,          "riak/client"
  autoload :Link,            "riak/link"
  autoload :WalkSpec,        "riak/walk_spec"
  autoload :RObject,         "riak/robject"
  autoload :MapReduce,       "riak/map_reduce"

  # Cache store - only supports Rails 3 style
  if defined? ActiveSupport and ActiveSupport::VERSION::STRING >= "3.0.0"
    autoload :CacheStore,      "riak/cache_store"
  end

  # Exceptions
  autoload :FailedRequest,   "riak/failed_request"
  autoload :InvalidResponse, "riak/invalid_response"
  autoload :MapReduceError,  "riak/map_reduce_error"

  # Test server
  autoload :TestServer,      "riak/test_server"

  # Utility classes and mixins
  module Util
    autoload :Escape,        "riak/util/escape"
    autoload :Headers,       "riak/util/headers"
    autoload :Multipart,     "riak/util/multipart"
    autoload :Translation,   "riak/util/translation"
  end
end
