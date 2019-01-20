set -eU Z_DATA_DIR
set -eU Z_DATA
set -eU Z_EXCLUDE
set -eU Z_OWNER

set -x Z_DATA_DIR $HOME/.local/share/z
set -x Z_DATA $Z_DATA_DIR/data
set -x Z_EXCLUDE $HOME
set -x Z_OWNER $USER
