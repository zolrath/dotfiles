function reveal
  set output (echo $argv[1] | rev | cut -c16- | rev)
  gpg --decrypt --output $output $argv[1]; and echo "$argv[1] -> $output"
end
