# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# SampleApp::Application.config.secret_key_base = 'e5abbe48a727d6631ccc06fafb68816b89891aa91d5538ad46fc32f08d5635bae12071a8257c48dcb665c407c23697cb218cc5aa11c87e374c63957e9f1cb8d0'
#
require 'securerandom'

def secure_token
	token_file = Rails.root.join('secret')
	if File.exist?(token_file)
	File.read(token_file).chomp
	else
	token = SecureRandom.hex(64)
	File.write(token_file, token)
	token
	end
end
SampleApp::Application.config.secret_key_base = secure_token
