# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Reddit::Application.config.secret_key_base = '4e8d00418150bdd656d6199cacf4adf75a8e25f1b50cd7ddf92c94bf703702b7921781d5fc837aff843496b3b1612555eaac035cdaf5c66417c22a8a53f18dc3'
