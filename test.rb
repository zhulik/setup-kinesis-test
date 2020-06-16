#!/usr/bin/env ruby
# frozen_string_literal: true

require 'aws-sdk-kinesis'

client = Aws::Kinesis::Client.new(region: 'local', endpoint: 'http://localhost:4567')

client.create_stream(
  stream_name: 'StreamName',
  shard_count: 1
)

client.wait_until(:stream_exists, stream_name: 'StreamName')

client.put_record(
  stream_name: 'StreamName',
  data: 'data',
  partition_key: 'PartitionKey',
  explicit_hash_key: '123456789',
  sequence_number_for_ordering: '123456789'
)