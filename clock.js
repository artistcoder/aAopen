class Clock {
  constructor() {
    let date = new Date()
    this.hours = date.getHours()
    this.minutes = date.getMinutes()
    this.seconds = date.getSeconds()

    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    let time = this.hours + ":" + this.minutes + ":" + this.seconds;
    console.log(`the current time is ${time}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds += 1;
    this.printTime();
  }
}

const clock = new Clock();
clock.printTime()
