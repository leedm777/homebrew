require 'formula'

class Fio < Formula
  homepage 'http://freecode.com/projects/fio'
  url 'http://brick.kernel.dk/snaps/fio-2.0.13.tar.bz2'
  sha1 'c2849065bc87bb3382a1b5877d9d0155b37cca17'

  def patches
    # Allow CFLAGS to be specified on the command line
    DATA
  end

  def install
    system "make", "prefix=#{prefix}",
                   "mandir=#{man}",
                   "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "install"
  end
end

__END__
diff --git a/Makefile b/Makefile
index ba8b997..38fdc33 100644
--- a/Makefile
+++ b/Makefile
@@ -130,7 +130,7 @@ FIO-VERSION-FILE: FORCE
        @$(SHELL) ./FIO-VERSION-GEN
 -include FIO-VERSION-FILE
 
-CFLAGS += -DFIO_VERSION='"$(FIO_VERSION)"'
+override CFLAGS += -DFIO_VERSION='"$(FIO_VERSION)"'
 
 .c.o: .depend FORCE
        $(QUIET_CC)$(CC) -o $@ -c $(CFLAGS) $(CPPFLAGS) $<
