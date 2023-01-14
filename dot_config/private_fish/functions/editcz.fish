function editcz 
  cd (chezmoi source-path)
  vim .
  chezmoi apply
  prevd
end
