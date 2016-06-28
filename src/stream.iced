stream = require('stream');
enc = require('./encoding');

exports.StreamEncoder = class StreamEncoder extends stream.Transform

  constructor : (@encoder) ->
    super({highWaterMark : Math.floor(4096/encoder.in_block_len)})

  _transform : (chunk, encoding, callback) ->
    @push(@encoder.encode(chunk))
    callback

exports.StreamDecoder = class Streamer extends stream.Transform

  constructor : (@encoder) ->
    super({highWaterMark : Math.floor(4096/encoder.out_block_len)})

  _transform : (chunk, encoding, callback) ->
    @push(@encoder.decode(chunk))
    callback
