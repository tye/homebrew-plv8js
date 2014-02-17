require 'formula'

class Plv8js < Formula
  homepage 'https://code.google.com/p/plv8js'

  url 'https://plv8js.googlecode.com/archive/5e428ab67663015c71b2b6783d039e185cfcdaea.zip'
  sha1 '7fc829488199b57f6fcf6312a692846cc3385b5e'
  version '1.4.1'

  head 'https://code.google.com/p/plv8js.git'

  depends_on 'v8'
  depends_on 'postgresql'

  def install
    ENV.prepend 'PATH', Formula.factory('postgresql').bin, ':'
    system 'pg_config'
    system "make"
    system "make install"
  end
 
  def test
    ENV.prepend 'PATH', Formula.factory('postgresql').bin, ':'
    system "make installcheck"
  end
end
