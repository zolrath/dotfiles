function aoc
  if test -z $AOC_SESSION
    echo "No AOC_SESSION export found. Please set AOC_SESSION to your AOC session token."
    return 1
  end

  set current_year (date +%Y)
  read -P "Enter year (default: $current_year): " entered_year
  # if entered_year is blank set it to current_year
  if test -z "$entered_year"
    set entered_year $current_year
  end

  set next_day (math (date +%-d) + 1)
  read -P "Enter day  (default:   $next_day): " entered_day
  if test -z "$entered_day"
    set entered_day $next_day
  end

  mkcd ~/code/personal/advent-of-rust/$entered_year/

  set dir day$entered_day

  cargo new $dir
  cd $dir

  curl -b "session=$AOC_SESSION" https://adventofcode.com/$entered_year/day/$entered_day/input > input.in
  touch test.in
end
