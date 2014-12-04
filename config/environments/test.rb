SampleApp::Application.configure do

  # Speed up tests by lowering bcrypt's cost function.
  ActiveModel::SecurePassword.min_cost = true
end