#!/usr/bin/perl

if (defined($ARGV[0]) && ($ARGV[0] eq "-v")) { $verbose = 1; }

$date = `/bin/date '+%Y%m%d_%H%H%S'`;
chomp($date);

$cmd = "/usr/bin/find /home/ray/.mozilla -name recovery.js";

@recoveries = `$cmd`;
chomp(@recoveries);

foreach (@recoveries) {
    $recovery = $_;
    # print "rec: \"".$recovery."\"\n";

    $cmd = "/bin/cp '".$recovery."' /home/ray/bak/firefoxRecovery/recovery_".$date.".js";

    if (defined($verbose)) {
        print "\"".$cmd."\"\n";
    }

    print `$cmd`;
}

exit(0);
