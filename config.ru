class ToUpper
	# Our class will be initialize with another Rack app
	def initialize(app)
		@app = app
	end

	def call(env)
		# First, call '@app'
		status, headers, body = @app.call(env)

		# Iterate through the body, upcasing each chunk
		# upcased_body = body.map { |chunk| chunk.upcase }

		# Pass our new body on through
		[status, headers, body]
	end
end

class Hello
	def self.call(env)
		res = Rack::Response.new
		res.write "Hello from Rack!"
		res.finish
	end
end


use ToUpper # Tell Rack to use our newly-minted middleware
# # Tell Rack what to run our app
run Hello

