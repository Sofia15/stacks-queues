require './Stack.rb'
require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll, :fired, :hired

  def initialize (jobs_available, job_seekers)
    @waiting = Queue.new
    @workers = Stack.new

    i = 1
    jobs_available.times do
      @workers.push("Worker #{i}")
      i += 1
    end

    while i <= job_seekers
      @waiting.enqueue("Worker #{i}")
      i += 1
    end
    @jobs_available = jobs_available #input
    @fired = []
    @hired = []
  end

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

## RUN SAMPLE ##
# ------------------------------
# Before the simulation starts
# Employed: ["Worker 1", "Worker 2", "Worker 3", "Worker 4", "Worker 5", "Worker 6"]
# Waitlist: ["Worker 7", "Worker 8", "Worker 9", "Worker 10"]
# ------------------------------
# <enter to cycle>
#
# -------Cycle 1-------
# Managers roll a 5
# Employed: ["Worker 1", "Worker 7", "Worker 8", "Worker 9", "Worker 10", "Worker 6"]
# Waitlist: ["Worker 5", "Worker 4", "Worker 3", "Worker 2"]
#
# -------Cycle 2-------
# Managers roll a 6
# Employed: ["Worker 5", "Worker 4", "Worker 3", "Worker 2", "Worker 6", "Worker 10"]
# Waitlist: ["Worker 9", "Worker 8", "Worker 7", "Worker 1"]
