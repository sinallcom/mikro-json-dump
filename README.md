# Mikro Json Dump
Mikrotik Script for JSON dump

# MikroTik Function: Dump Array to JSON

This MikroTik function allows you to convert an array to JSON format. JSON (JavaScript Object Notation) is a lightweight data-interchange format that is easy for humans to read and write and for machines to parse and generate.

## Prerequisites

- MikroTik RouterOS device (7+)
- Basic understanding of MikroTik scripting
- Access to the MikroTik device either through Winbox, SSH, or Webfig interface

## Installation

1. Log in to your MikroTik device.
2. Navigate to the Terminal.
3. Create a System->script and paste the script into the Terminal.

```bash
# Script to dump the array to JSON
/import jsonDump.rsc
:put [$fJDump  {"key"={k1=2;k2=125}; "key22"={k1=1;k2=80}; "7"={k1=0;k2=8080}}
```

## Usage

1. Ensure that you have an array created in your MikroTik device.
2. Modify the `arrayName` variable in the script to match the name of your array.
3. Execute the script in the Terminal.

## Note

- Ensure that the array you are converting to JSON contains valid data.
- This script assumes that the array only contains string values. If your array contains other data types, you may need to modify the script accordingly.

## License

This script is provided under the MIT License. For details, see the [LICENSE](LICENSE) file.

## Author

This MikroTik function was written by Svyatoslav Potyeyenko. 

Feedback, issues, and contributions are welcome!
