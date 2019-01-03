#!/usr/bin/perl
#just a comment
use Log::Syslog::Fast ':all';
use warnings;
#my $i=0;
for ( $i = 0; $i < 2000000; $i = $i + 1 ) {  #neverending fun


my $logger = Log::Syslog::Fast->new(LOG_UNIX, "/dev/log", "", LOG_LOCAL0, LOG_INFO, "mymachine", "logger");
$logger->send("rsyslog is abnormal in its functioning $i", 2);
$i++;
#print "it works like charm";
}
