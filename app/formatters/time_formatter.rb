class TimeFormatter
    def initialize(time)
        @time = time
    end

    def call
        @time = @time.split(":")

        return (@time[0].to_i * 60) + @time[1].to_i
    end
end