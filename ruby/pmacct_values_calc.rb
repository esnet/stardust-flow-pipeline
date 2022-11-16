def filter(event)
    #Pull values from event
    start_ts = event.get('[start]').to_f
    end_ts = event.get('[end]').to_f
    packets = event.get('[values][num_packets]').to_f

    #Calculate duration
    duration = end_ts - start_ts
    event.set('[values][duration]', duration)

    #Calculate bits
    num_bits = event.get('bytes').to_i * 8
    event.set('[values][num_bits]', num_bits)

    #Calculate rates if duration is greater than 0...otherwise just call them 0
    bits_per_sec = 0
    packets_per_sec = 0
    if duration > 0
        event.set('[values][bits_per_second]', num_bits.to_f/duration.to_f)
        event.set('[values][packets_per_second]', packets/duration.to_f)
    end

    return [event]
end
