meta:
  id: basic_info
  endian: be

seq:
  - id: total
    type: u2
    doc: Pack voltage (raw)
  - id: current
    type: u2
    doc: Actual current (raw)
  - id: remain_cap
    type: u2
    doc: Capacity (raw)
  - id: typ_cap
    type: u2
    doc: Capacity (raw)
  - id: cycles
    type: u2
    doc: Cycle times
  - id: prod_date
    type: u2
    doc: Production date
  - id: balance_status
    type: balance_list
    doc: List of balance bits
  - id: prot_status
    type: prot_list
    size: 2
    doc: List of protection bits
  - id: software_version
    type: u1
  - id: remain_cap_percent
    type: u1
    doc: Portion of remaining capacity
  - id: fet_status
    type: fet_bits
    size: 1
  - id: cell_count
    type: u1
  - id: temp_count
    type: u1
  - id: temp_value
    type: u2
    repeat: expr
    repeat-expr: temp_count


enums:
  status:
    0x00: ok
    0x80: fail
  fet_bit:
    0: off
    1: on

types:
  balance_list:
    seq:
      - id: flag
        type: b1
        repeat: expr
        repeat-expr: 32
  prot_list:
    seq:
      - id: ovp_cell
        type: b1
      - id: uvp_cell
        type: b1
      - id: ovp_pack
        type: b1
      - id: uvp_pack
        type: b1
      - id: otp_charge
        type: b1
      - id: utp_charge
        type: b1
      - id: otp_discharge
        type: b1
      - id: utp_discharge
        type: b1
      - id: ocp_charge
        type: b1
      - id: ocp_discharge
        type: b1
      - id: ocp_short
        type: b1
      - id: ic_error
        type: b1
      - id: fet_lock
        type: b1
              
  fet_bits:
    seq:
      - id: charge
        type: b1
        enum: fet_bit
      - id: discharge
        type: b1
        enum: fet_bit

instances:
  total_v:
    value: total * 0.01
    doc: Pack voltage (V)
  current_a:
    value: current * 0.01
    doc: Actual current (A)
  remain_cap_ah:
    value: remain_cap * 0.01
    doc: Capacity (Ah)
  typ_cap_ah:
    value: typ_cap * 0.01
    doc: Capacity (Ah)
  # temp_celsius:
  #   value: temp_value * 0.1 - 273.1
  #   doc: Temperature of NTCs