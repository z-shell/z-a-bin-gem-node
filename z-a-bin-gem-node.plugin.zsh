# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
#   Annex bin-gem-node | Copyright Ⓒ 2022 Z-Shell Community
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# https://z.digitalclouds.dev/community/zsh_plugin_standard/#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://wiki.zshell.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[Z_A_BIN_GEM_NODE]="${0:h}"

# https://z.digitalclouds.dev/community/zsh_plugin_standard/#funtions-directory
if [[ $PMSPEC != *f* ]]; then
  fpath+=( "${0:h}/functions" )
fi

# Autoload functions
autoload -Uz .za-bgn-{bin-or-src-function-{body,body-cygwin},mod-function-body}
autoload -Uz .za-bgn-{{atclone,atload,atdelete,help}-handler,shim-list}

# An empty stub to fill the help handler fields
.za-bgn-null-handler() { :; }

@zi-register-annex "z-a-bin-gem-node" subcommand:shim-list \
.za-bgn-shim-list .za-bgn-help-handler

@zi-register-annex "z-a-bin-gem-node" hook:\!atload-50 \
.za-bgn-atload-handler .za-bgn-null-handler "fbin''|sbin|sbin''|gem''|node''|pip''|fmod''|fsrc''|ferc''"

@zi-register-annex "z-a-bin-gem-node" hook:atclone-50 \
.za-bgn-atclone-handler .za-bgn-null-handler

@zi-register-annex "z-a-bin-gem-node" hook:\%atpull-50 \
.za-bgn-atclone-handler .za-bgn-null-handler

@zi-register-annex "z-a-bin-gem-node" hook:atdelete-50 \
.za-bgn-atdelete-handler .za-bgn-null-handler
