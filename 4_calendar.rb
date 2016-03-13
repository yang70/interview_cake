input = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

def merge_ranges(meetings)
  sorted_meetings = meetings.sort

  merged_meetings = []

  previous_meeting_start, previous_meeting_end = sorted_meetings[0]

  sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|
    # if the previous meeting can be merged with th ecurrent one, current starts before pr
    if current_meeting_start <= previous_meeting_end

      # merge the current_meeting back into the previous_meeting and keep the resulting meeting as the previous_meeting because this newly merged meeting might still need to be merged with the next meeting
      previous_meeting_end = [current_meeting_end, previous_meeting_end].max

    else

      # put it in merged_meetings and move on to trying to merge the current meeting
      merged_meetings.push([previous_meeting_start, previous_meeting_end])
      previous_meeting_start, previous_meeting_end = current_meeting_start, current_meeting_end
    end
  end

  # put last meeting trying to mergi in our final set
  merged_meetings.push([previous_meeting_start, previous_meeting_end])

  return merged_meetings
end

puts merge_ranges input
