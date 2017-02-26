###### This file is without connection Stack and Queue classes ############

# require './Stack.rb'
# require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll, :fired, :hired

  def initialize (jobs_available, job_seekers)
    @waiting = Queue.new
    @workers = Stack.new
    @i = 1
    # @workders = @waiting[0...jobs_available]
    jobs_available.times do
      @workers.push("Worker #{@i}")
      @i += 1
    end

    while @i <= job_seekers
      @waiting.enqueue("Worker #{@i}")
      @i += 1
    end
    @jobs_available = jobs_available #input
    @fired = []
    @hired = []
  end
  #get rid of roll number from the waiting list and add roll number of workers from employed list

  def cycle
    @roll = rand(1..@jobs_available)
    i = 0
    until i == @roll
      a = @workers.pop
      @waiting.enqueue(a)
      i += 1
    end

    i = 0
    until i == @roll
      b = @waiting.dequeue
      @workers.push(b)
      i += 1
    end
  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Managers roll a #{sim.roll}"
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end
