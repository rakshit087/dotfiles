function __wt_repo_root
    git rev-parse --show-toplevel 2>/dev/null
end

function __wt_base_dir
    set -l repo_root (__wt_repo_root)
    or return 1

    set -l repo_name (basename $repo_root)
    set -l repo_parent (dirname $repo_root)
    echo "$repo_parent/$repo_name-worktrees"
end

function __wt_copy_env_files --argument source_root target_root
    if not test -d "$source_root"
        return 0
    end

    for env_file in (command find "$source_root" -maxdepth 1 -type f \( -name '.env*' -o -name '.envrc' \) 2>/dev/null)
        set -l env_name (basename "$env_file")

        switch "$env_name"
            case '.env.example' '.env.sample' '.env.template'
                continue
        end

        if not test -e "$target_root/$env_name"
            command cp "$env_file" "$target_root/$env_name"
        end
    end
end

function __wt_run_install --argument install_tool
    if test -z "$install_tool"
        return 0
    end

    if not command -sq "$install_tool"
        echo "wt-new: '$install_tool' is not installed"
        return 1
    end

    switch "$install_tool"
        case bun
            command bun install
        case pnpm
            command pnpm install
        case yarn
            command yarn install
        case npm
            command npm install
    end
end

function wt-new --description "Create a git worktree for a branch" --argument branch_name
    argparse --name=wt-new h/help b/bun n/npm p/pnpm y/yarn -- $argv
    or return 1

    if set -ql _flag_help
        echo "Usage: wt-new <branch-name> [--bun|--npm|--pnpm|--yarn]"
        return 0
    end

    if test (count $argv) -lt 1
        echo "Usage: wt-new <branch-name> [--bun|--npm|--pnpm|--yarn]"
        return 1
    end

    set branch_name $argv[1]
    set -l repo_root (__wt_repo_root)
    or begin
        echo "wt-new: not inside a git repository"
        return 1
    end

    set -l install_flags
    set -q _flag_bun; and set install_flags $install_flags bun
    set -q _flag_npm; and set install_flags $install_flags npm
    set -q _flag_pnpm; and set install_flags $install_flags pnpm
    set -q _flag_yarn; and set install_flags $install_flags yarn

    if test (count $install_flags) -gt 1
        echo "wt-new: pass only one install flag"
        return 1
    end

    set -l install_tool $install_flags[1]
    set -l base_dir (__wt_base_dir)
    set -l worktree_dir "$base_dir/$branch_name"

    command mkdir -p (dirname "$worktree_dir")

    if git show-ref --verify --quiet "refs/heads/$branch_name"
        git worktree add "$worktree_dir" "$branch_name"
    else
        git worktree add -b "$branch_name" "$worktree_dir"
    end
    or return 1

    __wt_copy_env_files "$repo_root" "$worktree_dir"
    or return 1

    if test -n "$install_tool"
        pushd "$worktree_dir" >/dev/null
        __wt_run_install "$install_tool"
        set -l install_status $status
        popd >/dev/null
        test $install_status -eq 0; or return $install_status
    end

    echo "$worktree_dir"
end

function wt-list --description "List git worktrees"
    git worktree list
end

function wt-rm --description "Remove a git worktree" --argument branch_or_path
    argparse --name=wt-rm h/help d/delete-branch f/force -- $argv
    or return 1

    if set -ql _flag_help
        echo "Usage: wt-rm <branch-name|path> [--delete-branch] [--force]"
        return 0
    end

    if test (count $argv) -lt 1
        echo "Usage: wt-rm <branch-name|path> [--delete-branch] [--force]"
        return 1
    end

    set branch_or_path $argv[1]
    set -l target_path

    if test -d "$branch_or_path"
        set target_path "$branch_or_path"
    else
        set -l base_dir (__wt_base_dir)
        or begin
            echo "wt-rm: not inside a git repository"
            return 1
        end
        set target_path "$base_dir/$branch_or_path"
    end

    if not test -e "$target_path"
        echo "wt-rm: worktree not found: $target_path"
        return 1
    end

    set -l remove_args
    set -q _flag_force; and set remove_args $remove_args --force
    set -l branch_name (git -C "$target_path" branch --show-current 2>/dev/null)

    git worktree remove $remove_args "$target_path"
    or return 1

    git worktree prune >/dev/null 2>&1

    if set -ql _flag_delete_branch
        if test -n "$branch_name"
            git branch -D "$branch_name"
        else
            echo "wt-rm: skipped branch deletion because no branch was checked out"
        end
    end
end

alias wtn='wt-new'
alias wtl='wt-list'
alias wtr='wt-rm'
