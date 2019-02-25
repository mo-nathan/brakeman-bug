require "open3"
require "shellwords"


class AController
  def a_cmd
    a = A.new
    result, status = Open3.capture2e("ls",
                                     Shellwords.escape(a.z))
  end

  def b_cmd
    b = B.new
    result, status = Open3.capture2e("ls",
                                     Shellwords.escape(b.z))
  end
end


class B
  def z
    "B.z"
  end
end
