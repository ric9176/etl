def class_exists?(class_name)
  eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)") == true
end
