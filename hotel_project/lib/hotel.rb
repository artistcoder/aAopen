require_relative "./room.rb"


class Hotel
    def initialize(name, cap_hash)
        # k = room names v = capacity

        @name = name
        @rooms = {}
        cap_hash.each {|k,v| @rooms[k] = Room.new(v)}
    end

    def name
        cap_name = @name.split(" ")
        cap_name.each{|word| word.capitalize!}.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        room_names = rooms.keys
        room_names.include?(room_name)
    end

    def check_in(person,room_name)
        return p "sorry, room does not exist" if !room_exists?(room_name)
        return p "sorry, room is full" if @rooms[room_name].full?

        @rooms[room_name].add_occupant(person)
        return p "check in successful"
    end

    def has_vacancy?
        rooms = @rooms.values
        rooms.any?{|room| !room.full?}
    end

    def list_rooms
        @rooms.each{|name, room|  print("#{name}.*#{room.available_space}\n")}
    end


end
