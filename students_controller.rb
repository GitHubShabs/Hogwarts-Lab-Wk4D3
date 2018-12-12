require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do # index
  @students = Student.all()
  erb( :index )
end

# new
get '/students/new' do # new
  erb( :new )
end

# create
post '/students' do # create
  @student = Student.new( params )
  @student.save()
  erb( :create )
end


# show
get '/students/:id' do # show
  @student = Student.find( params[:id] )
  erb( :show )
end


# update
post '/students/:id' do # update
  Student.new( params ).update
  redirect to '/students'
end


# edit
get '/students/:id/edit' do # edit
  @student = Student.find( params[:id] )
  erb( :edit )
end


# destroy
post '/students/:id/delete' do # delete a specific pizza in params
  student = Student.find( params[:id] )
  student.delete()
  redirect to '/students'
end
