# README

This repo demonstrates a problem with brakeman 4.4.0.  To see the issue
run:
```
bundle install
brakeman .
```

It should report:
```
...
== Warnings ==

Confidence: High
Category: Command Injection
Check: Execute
Message: Possible command injection
Code: Open3.capture2e("ls", Shellwords.escape(A.new.z))
File: app/controllers/a_controller.rb
Line: 9
```

The key files are `app/controllers/a_controller.rb` and `app/models/a.rb`.
Note that AController contains a class, B, that is identical to the
class A, but does not trigger the same warning.

I have also noticed that if the class AController is renamed just AC,
the warning also goes away.

This issue is also seen using Ruby 2.4.1 (which is the verison of Ruby
I have setup by default).
