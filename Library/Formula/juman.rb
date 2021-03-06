class Juman < Formula
  homepage "http://nlp.ist.i.kyoto-u.ac.jp/index.php?JUMAN"
  url "http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2"
  sha1 "e22eb113f40216b8a04d811484a94f93f834ae9a"

  bottle do
    sha1 "124c6163b63a4ae87269419329ebb65c810f30b2" => :yosemite
    sha1 "d3c9051c201101118fdde6ae5a49dea75911a59e" => :mavericks
    sha1 "d886637082bfb1a55c528077abcaaf43d6b54372" => :mountain_lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    result = `echo \xe4\xba\xac\xe9\x83\xbd\xe5\xa4\xa7\xe5\xad\xa6 | juman | md5`.chomp
    assert_equal "a5dd58c8ffa618649c5791f67149ab56", result
  end
end
