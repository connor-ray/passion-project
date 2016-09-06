get '/' do
  if session[:id]
    redirect :"/users/#{session[:id]}"
  else
    redirect :'/sessions'
  end
end


