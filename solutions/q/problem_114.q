minSubArraySum: {[nums]
  / Modified Kadane's algorithm for minimum subarray sum
  / At each position, track minimum sum ending at that position
  / minEnding[i] = min(nums[i], minEnding[i-1] + nums[i])
  minEnding: {min(y; x+y)}\[nums];
  min minEnding
 }
