# Colors!

readonly colors=(   \
    black           \
    red             \
    green           \
    yellow          \
    blue            \
    magenta         \
    cyan            \
    white           \
    bright_black    \
    bright_red      \
    bright_green    \
    bright_yellow   \
    bright_blue     \
    bright_magenta  \
    bright_cyan     \
    bright_white    \
)

init_color_vars() {
    local color_index
    for color_index in ${!colors[@]}; do
        local color="${colors[$color_index]}"
        readonly "ansi_fg_${color}"="$(tput setaf ${color_index})"
        readonly "ansi_bg_${color}"="$(tput setab ${color_index})"
    done
    readonly ansi_reset="$(tput sgr0)"
    unset init_color_vars # self-destruct to avoid polluting the namespace
}
init_color_vars

# base16 mappings
# See https://github.com/vbwx/base16-terminal-app/blob/master/templates/default.mustache

init_base16() {
    local mode
    for mode in fg bg; do
        local color_index
        for color_index in ${!colors[@]}; do
            local color="${colors[$color_index]}"
            local "${color}_var"="ansi_${mode}_${color}"
        done

        # base00 - Default Background
        readonly "base00_${mode}"=${!black_var}
        # base01 - Lighter Background (Used for status bars)
        readonly "base01_${mode}"=${!bright_green_var}
        # base02 - Selection Background
        readonly "base02_${mode}"=${!bright_yellow_var}
        # base03 - Comments, Invisibles, Line Highlighting
        readonly "base03_${mode}"=${!bright_black_var}
        # base04 - Dark Foreground (Used for status bars)
        readonly "base04_${mode}"=${!bright_blue_var}
        # base05 - Default Foreground, Caret, Delimiters, Operators
        readonly "base05_${mode}"=${!white_var}
        # base06 - Light Foreground (Not often used)
        readonly "base06_${mode}"=${!bright_magenta_var}
        # base07 - Light Background (Not often used)
        readonly "base07_${mode}"=${!bright_white_var}
        # base08 - Variables, XML Tags, Markup Link Text, Markup Lists,
        #          Diff Deleted
        readonly "base08_${mode}"=${!red_var}
        # base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
        readonly "base09_${mode}"=${!bright_red_var}
        # base0A - Classes, Markup Bold, Search Text Background
        readonly "base0A_${mode}"=${!yellow_var}
        # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
        readonly "base0B_${mode}"=${!green_var}
        # base0C - Support, Regular Expressions, Escape Characters,
        #          Markup Quotes
        readonly "base0C_${mode}"=${!cyan_var}
        # base0D - Functions, Methods, Attribute IDs, Headings
        readonly "base0D_${mode}"=${!blue_var}
        # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
        readonly "base0E_${mode}"=${!magenta_var}
        # base0F - Deprecated, Opening/Closing Embedded Language Tags
        #          e.g. <?php ?>
        readonly "base0F_${mode}"=${!bright_cyan_var}
    done

    # Semantic variables
    readonly base16_bg_default="${base00_bg}"
    readonly base16_bg_status_bar="${base01_bg}"
    readonly base16_bg_selection="${base02_bg}"
    readonly base16_bg_line_highlight="${base03_bg}"
    readonly base16_bg_light="${base07_bg}"
    readonly base16_bg_search="${base0A_bg}"

    readonly base16_comment="${base03_fg}"
    readonly base16_invisibles="${base03_fg}"
    readonly base16_status_bar="${base04_fg}"
    readonly base16_default="${base05_fg}"
    readonly base16_caret="${base05_fg}"
    readonly base16_delimiters="${base05_fg}"
    readonly base16_operators="${base05_fg}"
    readonly base16_light="${base06_fg}"
    readonly base16_var="${base08_fg}"
    readonly base16_tag="${base08_fg}"
    readonly base16_link_text="${base08_fg}"
    readonly base16_list="${base08_fg}"
    readonly base16_diff_del="${base08_fg}"
    readonly base16_int="${base09_fg}"
    readonly base16_bool="${base09_fg}"
    readonly base16_const="${base09_fg}"
    readonly base16_attr="${base09_fg}"
    readonly base16_link_url="${base09_fg}"
    readonly base16_class="${base0A_fg}"
    readonly base16_bold="${base0A_fg}"
    readonly base16_string="${base0B_fg}"
    readonly base16_inherit="${base0B_fg}"
    readonly base16_code="${base0B_fg}"
    readonly base16_diff_ins="${base0B_fg}"
    readonly base16_support="${base0C_fg}"
    readonly base16_regex="${base0C_fg}"
    readonly base16_esc="${base0C_fg}"
    readonly base16_quote="${base0C_fg}"
    readonly base16_function="${base0D_fg}"
    readonly base16_method="${base0D_fg}"
    readonly base16_attr_id="${base0D_fg}"
    readonly base16_heading="${base0D_fg}"
    readonly base16_keyword="${base0E_fg}"
    readonly base16_storage="${base0E_fg}"
    readonly base16_selector="${base0E_fg}"
    readonly base16_italic="${base0E_fg}"
    readonly base16_diff_change="${base0E_fg}"
    readonly base16_deprecated="${base0F_fg}"
    readonly base16_lang_tag="${base0F_fg}"

    unset init_base16 # self-destruct to avoid polluting the namespace
}
init_base16

ansi_text() {
    local color="${1}"; shift
    echo -n "${color}${@}${ansi_reset}"
}

show_colors() {
    local color_index
    for color_index in ${!colors[@]}; do
        local color="${colors[${color_index}]}"
        local fg="ansi_fg_${color}"
        local bg="ansi_bg_${color}"
        printf "$(ansi_text ${!fg} ' %15s ')" "${color}"
        printf "$(ansi_text ${!bg} ' %15s ')" "${color}"
        local mode
        # 'dim' mode doesn't appear to do anything in Terminal.app
        # 'rev' and 'smso' appear identical
        for mode in bold smul smso; do
            local ansi_mode="$(tput ${mode})"
            printf "${ansi_mode}$(ansi_text ${!fg} ' %15s:%s ')" \
                   "${color}" \
                   "${mode}"
            printf "${ansi_mode}$(ansi_text ${!bg} ' %15s:%s ')" \
                   "${color}" \
                   "${mode}"
        done
        echo
    done
}

show_base16() {
    local index
    for index in {0..15}; do
        local base="$(printf 'base%02X' $index)"
        local fg="${base}_fg"
        local bg="${base}_bg"
        ansi_text ${!fg} " ${base} "
        ansi_text ${!bg} " ${base} "
        echo
    done
}

rgb2hex() {
    perl -e '
        (shift @ARGV) =~
            /rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/ &&
                printf "#%02X%02X%02X\n", $1, $2, $3
    ' \
    "${@}"
}

hex2rgb() {
    perl -e '
        (shift @ARGV) =~
            /#?([[:xdigit:]]{2})([[:xdigit:]]{2})([[:xdigit:]]{2})/ &&
                printf "rgb(%d, %d, %d)\n", hex($1), hex($2), hex($3)
    ' \
    "${@}";
}

#-------------------------------------------------------------
# enable color support
#-------------------------------------------------------------
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export __COLOR_OPTIONS='--color=auto'
  export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
else
  export __COLOR_OPTIONS=''
  unset GCC_COLORS
fi

