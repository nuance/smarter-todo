#!/usr/bin/perl

# TODO.SH AIM Bot
# Author:  Gina Trapani (ginatrapani@gmail.com)
# Release date:  6/23/2006
# Last updated:  7/29/2006
# License:  GPL, http://www.gnu.org/copyleft/gpl.html
# Version: 0.5
# More info:  http://todotxt.com

use warnings;
use strict;
use Net::OSCAR qw(:standard);

# =========BEGIN CONFIGURATION============
my $screenname = 'roaringtodo';	# Your bot AIM nickname
my $password   = 'fh45m9rw';   # Your bot AIM pasword
my $commander  = 'roaringtofu';     # Your AIM name;  separate multiple commanders with comma no space
my $todoscript = '/home/matt/todo-drop/todo.py -p -v';# Path to todo script with options
my $linebreakchar = '<br />';	            # Defaults to HTML line breaks
# =========END CONFIGURATION==============


print "TodoBot v0.5 is starting...\n";
print "Visit todotxt.com for help and the latest version.\n";

my $oscar;
# Additional variables for multiple commanders
my @commanders;
my $elt;
my $is_there;

$oscar = Net::OSCAR->new();
$oscar->set_callback_im_in(\&im_in);
$oscar->signon($screenname, $password);

while(1) 
{
    $oscar->do_one_loop();
}

sub im_in {
    my($oscar, $sender, $message, $is_away, @commanders, $is_there, $elt) = @_;
    print "[AWAY] " if $is_away;
    print "$sender: $message\n";

    # Some AIM clients send HTML, we need
    # to convert it to plain text 
    # remove tags
    $message =~ s/<(.|\n)+?>//g;
    # convert &quot;'s
    $message =~ s/&quot;/\"/g;
    my $response = "\n";

    # Check to see if commander is in the allowed list.
    # This is not the most efficient way; but given that the list of allowed
    # commanders is going to be small and its only going to do it once every
    # command, the response time should not be affected drastically
    @commanders = split(',',$commander);
    $is_there = 0;
    foreach $elt (@commanders) {
	if ($elt eq $sender) {
	    $is_there = 1;
	    last;
	}
    }

    if ($is_there) {

		my $checkfordel = substr($message, 0, 3);
		print "$todoscript $message\n";
		if ($message eq "die") {
			$oscar->send_im($sender, "I'm out! See ya!");
			$oscar->signoff();
			exit();
		}
		
		if ($message eq "tc") {
		    $message = "ls \@class \@soda p:class p:e190 p:cs188 p:chem1a p:cs281a p:research"
		}
		
		open FH, "$todoscript $message |" or $response = "The Todo bot go BOOM!  Please check the path to your todo script is correct.";
		while(<FH>) {
			chomp;
			$response = $response.$_.$linebreakchar;
		}
		close FH;
		chomp($response);
		if (($response eq "\n") || $response eq "") {
			$response = $response."Nothing to display for command todo $message."
		}
		print "$screenname: $response\n";
		$oscar->send_im($sender, $response);
	 }
   
}

