#!/usr/bin/env ruby

class Schedule

  def self.rooms
  	#example 5 rooms
    {
    	room_1: [],
    	room_2: [],
    	room_3: [],
    	room_4: [],
    	room_5: [],
    }
  end

  def self.meetings
    #example data 20 meetings
    meetings = [
    	{name: "meeting1", starttime: "08:00", endtime: "09:00", duration: 1},
    	{name: "meeting2", starttime: "09:00", endtime: "10:00", duration: 1},
    	{name: "meeting3", starttime: "08:00", endtime: "10:00", duration: 2},
    	{name: "meeting4", starttime: "11:00", endtime: "12:00", duration: 1},
    	{name: "meeting5", starttime: "10:00", endtime: "11:00", duration: 1},
    	{name: "meeting6", starttime: "12:00", endtime: "13:00", duration: 1},
    	{name: "meeting7", starttime: "13:00", endtime: "14:00", duration: 1},
    	{name: "meeting8", starttime: "15:00", endtime: "16:00", duration: 1},
    	{name: "meeting9", starttime: "15:00", endtime: "16:00", duration: 1},
    	{name: "meeting10", starttime: "15:00", endtime: "16:00", duration: 1},
    	{name: "meeting11", starttime: "08:00", endtime: "10:00", duration: 2},
    	{name: "meeting12", starttime: "08:00", endtime: "09:00", duration: 1},
    	{name: "meeting13", starttime: "10:00", endtime: "11:00", duration: 1},
    	{name: "meeting14", starttime: "11:00", endtime: "13:00", duration: 2},
    	{name: "meeting15", starttime: "13:00", endtime: "14:00", duration: 1},
    	{name: "meeting16", starttime: "14:00", endtime: "15:00", duration: 1},
    	{name: "meeting17", starttime: "13:00", endtime: "14:00", duration: 1},
    	{name: "meeting18", starttime: "12:00", endtime: "14:00", duration: 2},
    	{name: "meeting19", starttime: "14:00", endtime: "16:00", duration: 2},
    	{name: "meeting20", starttime: "15:00", endtime: "16:00", duration: 1}
    ]
  end

  def self.generate
  	group_meetings = self.meetings.group_by{|x| x[:starttime]}
  	data = {}
    group_meetings.each do |starttime, meetings|
      ordered = meetings.sort_by{|x| x[:starttime]}
    	ordered.each_with_index do |meeting, i|
        data["room_#{i + 1}"] ||= []
        if data["room_#{i + 1}"].empty?
          data["room_#{i + 1}"] << meeting
        elsif data["room_#{i + 1}"].last[:endtime] <= meeting[:starttime]
          data["room_#{i + 1}"] << meeting
        else
          data["room_#{i + 2}"] << meeting
        end
    	end
    end
    puts data
    data
  end
end

Schedule.generate