# 1. Define the save directory
SAVE_DIR="$HOME/Pictures/zoom-snaps"

# 2. Create the directory if it doesn't exist
mkdir -p "$SAVE_DIR"

# 3. Define the filename format
# Using $1 (e.g., 799699) as the prefix
CHART_DATE=$(date +%m_%d.%H%M_%S)
FILE_NAME="${1}-zoom-${CHART_DATE}.png"
FULL_PATH="$SAVE_DIR/$FILE_NAME"

# 4. Get the Window ID
# This script pauses to let you click the window you want to capture
echo "Click on the window you want to capture..."
WID=$(xwininfo | grep "Window id:" | awk '{print $4}')

# 5. Capture the window using 'import' from ImageMagick
if [ -n "$WID" ]; then
    import -window "$WID" "$FULL_PATH"
    echo "Saved: $FULL_PATH"
else
    echo "Error: Could not retrieve Window ID."
fi

