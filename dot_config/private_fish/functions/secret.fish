function secret
  set output ~/$argv[1].(date +%s).enc
  gpg --encrypt --armor --output $output $argv[1]; and echo "$argv[1] -> $output"
end
