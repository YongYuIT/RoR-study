class HelloController < ApplicationController
  def say_hello
    info = ""
    info += "当前进程号:" + Process.pid.to_s + "\n"
    info += "当前线程号:" + Thread.current.object_id.to_s + "\n"
    info += "开始时间:" + Time.now.to_s + "\n"
    sleep(10)
    info += "结束时间:" + Time.now.to_s
    render plain: info
  end
end
