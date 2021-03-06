#--
# Copyleft meh. [http://meh.doesntexist.org | meh@paranoici.org]
#
# This file is part of ruby-mbox.
#
# ruby-mbox is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ruby-mbox is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with ruby-mbox. If not, see <http://www.gnu.org/licenses/>.
#++

class Mbox; class Mail; class Headers

class Status
	def self.parse (text)
		return text if text.is_a?(self)

		return Status.new unless text && text.is_a?(String)

		Status.new(text.include?('R'), text.include?('O'))
	end

	def initialize (read = false, old = false)
		@read = read
		@old  = old
	end

	def read?; @read; end
	def old?;  @old;  end

	def unread?; !read?; end

	def to_s
		"#{'R' if read?}#{'O' if old?}"
	end
end

end; end; end
