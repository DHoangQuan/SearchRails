module ErrorSerializer

  def ErrorSerializer.serialize(stt, msg)
    # return if errors.nil?

    json = {}
    new_hash = errors.to_hash(true).map do |k, v|
      v.map do |msg|
        { status: stt, title: msg }
      end
    end.flatten
    json[:errors] = new_hash
    json
  end

end