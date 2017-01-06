no strict;

my $helpMessage = "Rust express compiler and executer.
Version 1.0
    Usage: 
        rusti -[hrt] <argument>

    Options:
        -h      Show this screen.
        -r      Remove program after execution.
        -t      Time execution of program.";

quietly {
    sub showHelp() {
        say $helpMessage;

    }
    sub remove($filename) {
        shell 'rm -r ' ~ $filename;
    }
    sub contains(@list, $element) {
        for @list {
            if $_ == $element {
                return True;
            }
        }
        return False;
    }
    my $number_of_arguments = @*ARGS.elems;
    if $number_of_arguments == 0 {  #help
        showHelp();
    } elsif @*ARGS[0].substr(0, 1) ~~ '-' { #flags
        my @flags = (@*ARGS[0].split("", :skip-empty)[1..5]).gist;
        if (@flags.contains("h")) {
            showHelp();
        } else {
            my $time = @flags.contains("t");
            shell "rustc " ~ @*ARGS[1].perl;
            my $start = now if $time;
            shell (@*ARGS[1].substr(0, *-3) ~ @*ARGS[2..*].join(" "));
            my $end = now if $time;
            my $elapsed = $end - $start;
            say "Time elapsed after compilation: " ~ ($elapsed) ~ 's' if $time;
            remove(@*ARGS[1].substr(0, *-3) ~ '.exe') if @flags.contains("r");
        }
    } else { # no flags
        shell "rustc " ~ @*ARGS[0].perl;
        my $exit_code = shell (@*ARGS[0].substr(0, *-3) ~ @*ARGS[1..*].join(" "));
        } 
}