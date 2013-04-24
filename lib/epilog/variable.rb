module Epilog
	class Variable
		def initialize( value = nil )
			@matter = Term.new
			if not value.nil?
				@matter.materialize( value )
			end
		end

		def matter
			@matter
		end

		def ground?
			@matter.ground?
		end

		def materialize( value )
			@matter.materialize( value )
		end

		def associate( variable )
			if @matter.constrained?
				@matter.materialize( variable.value )
			else
				@matter = variable.matter
				@matter.constrained
			end
		end

		def value
			@matter.value
		end
	end

	class Term 
		def initialize
			@materialized = false
			@constrained = false
		end

		def ground?
			@materialized
		end

		def constrained
			@constrained = true
		end

		def constrained?
			@constrained
		end

		def materialize( value )
			@materialized = true
			@value = value
			self
		end

		def value
			raise FreeVariableError if not @materialized
			@value
		end
	end

	class FreeVariableError < StandardError ; end
end
