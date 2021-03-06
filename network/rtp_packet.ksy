meta:
  id: rtp_packet
  title: rtp protocol
  xref:
    rfc: 3550
    wikidata: https://en.wikipedia.org/wiki/Real-time_Transport_Protocol
  license: Unlicense
  endian: be
doc: |
  The Real-time Transport Protocol (RTP) is a widely used network protocol for transmitting audio or video. 
  It usually works with the RTP Control Protocol (RTCP). 
  The transmission can be based on Transmission Control Protocol (TCP) or User Datagram Protocol (UDP).
seq:
  - id: version
    type: b2
  - id: has_padding
    type: b1
  - id: has_extension
    type: b1
  - id: csrc_count
    type: b4
  - id: marker
    type: b1
  - id: payload_type
    type: b7
    enum: payload_type_enum
  - id: sequence_number
    type: u2
  - id: timestamp
    type: u4
  - id: ssrc
    type: u4
  - id: header_extension
    type: header_extention
    if: has_extension
  - id: data
    size-eos: true
    doc: may contain padding data(depending on `has_padding` field)
types:
  header_extention:
    seq:
      - id: id
        type: u2
      - id: length
        type: u2
enums: 
  payload_type_enum:
    0: pcmu
    1: reserved1
    2: reserved2
    3: gsm
    4: g723
    5: dvi4_1
    6: dvi4_2
    7: lpc
    8: pama
    9: g722
    10: l16_1
    11: l16_2
    12: qcelp
    13: cn
    14: mpa
    15: g728
    16: dvi4_3
    17: dvi4_4
    18: g729
    19: reserved3
    20: unassigned1
    21: unassigned2
    22: unassigned3
    23: unassigned4
    24: unassigned5
    25: celb
    26: jpeg
    27: unassigned6
    28: nv
    29: unassigned7
    30: unassigned8
    31: h261
    32: mpv
    33: mp2t
    34: h263
    96: mpeg_ps
