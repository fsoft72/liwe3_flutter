# Changelog

# 0.1.5

- ADD: support for `fontSize` in `MarkdownView`

# 0.1.4

- ADD: `VScroll` component
- ADD: `MarkdownView` component

# 0.1.3

- ADD: first implementation of `SecureStorage`
- ADD: first implementation of encryption utils

# 0.1.2

- ENH: reworking some `Txt` fields, now if not specified they should take the default values.
- ENH: more robust Dialogs cancellation

# 0.1.1

- ADD: `confirmDialog` and `alertDialog` now support `result` and can be `await`ed.
- ADD: `onChange` in `TagInput`
- BREAKING: `onChanged` and `onSubmitted` are now called `onChange` and `onSubmit` in `InputText`

# 0.1.0

- FIX: `confirmDialog` created wrong Dialog layout on some phones.

# 0.0.10

- ADD: conversions utils.

# 0.0.9

- ADD: `fontSize` to `Button`
- ADD: `label`, `showBorder` and `borderColor` to `InputText`

# 0.0.8

- ADD: `cancelLabel` and `confirmLabel` props to `confirmDialog`
- ENH: added a lot of space between the buttons in `confirmDialog`
- ADD: `fontSize` to `InputText` component

# 0.0.7

- ADD: `InputText` now supports `textAlign` prop.

# 0.0.6

- ADD: `InputText` now supports `color` and `placeholderColor` props.

# 0.0.5

- ADD: Txt() component to display text with different styles.

# 0.0.4

- ADD: API for AppStore now support token refresh.
- ADD: appStore now stores all user data
- ADD: main app has been split into multiple screens

# 0.0.3

- ADD: TagInput now has a placeholder prop.
- ADD: appStore store
- ADD: API for appStore (still in progress)
- ENH: refactored demo app to separate various components into their own files.

# 0.0.2

- A lot of work on InputText field to add support for `type`, validChaaracters, right keyboard layout, and more.

# 0.0.1

- Initial release
