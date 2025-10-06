eat: {[number; need; remaining]
  actualEaten: need & remaining;
  (number + actualEaten; remaining - actualEaten)
 }
