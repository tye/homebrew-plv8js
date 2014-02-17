require 'formula'

class Plv8js < Formula
  homepage 'https://code.google.com/p/plv8js'

  url 'https://plv8js.googlecode.com/archive/5e428ab67663015c71b2b6783d039e185cfcdaea.zip'
  sha1 'ceb7579b1fae1c1fe795c03a23471fdf9c7c469e'
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
