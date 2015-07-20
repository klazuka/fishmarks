# fishmarks bookmark dirs system
# inspired by Bashmarks (https://github.com/huyng/bashmarks)

# l: list
# j: jump
# p: print
# s: save

set fishmarks_file ~/.config/fish/.fishmarks

if not test -e $fishmarks_file
    touch $fishmarks_file
end

function l
    if test (count $argv) -ne 0
        echo "USAGE: l"
        return
    end
    while read name dir
        echo (set_color purple) $name (set_color cyan) $dir
    end < $fishmarks_file
end

function _fishmarks_find
    if test (count $argv) -ne 2
        echo "_fishmarks_find function requires 2 arguments"
        return -1
    end
    
    set user_input $argv[1]
    set cmd $argv[2] # either 'jump' or 'print'

    while read name dir
        if test $name = $user_input
            switch $cmd
            case "jump"
                # use eval so that tildes are expanded to $HOME
                eval "cd $dir"
            case "print"
                eval "echo $dir"
            end
            return
        end
    end < $fishmarks_file

    echo "not found"
end

function j
    if test (count $argv) -ne 1
        echo "USAGE: j <name>"
        return
    end
    _fishmarks_find $argv[1] jump
end

function p
    if test (count $argv) -ne 1
        echo "USAGE: r <name>"
        return
    end
    _fishmarks_find $argv[1] print
end

function s
    if test (count $argv) -ne 1
        echo "USAGE: s <name>"
        return
    end

    set name $argv[1]
    set dir (pwd)
    echo $name $dir >> $fishmarks_file
end
