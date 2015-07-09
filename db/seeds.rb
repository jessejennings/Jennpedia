admin = User.new(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin' 
)
admin.skip_confirmation!
admin.save!

 moderator = User.new(
   email:    'moderator@example.com',
   password: 'helloworld',
   role:     'moderator'
 )
 moderator.skip_confirmation!
 moderator.save!

