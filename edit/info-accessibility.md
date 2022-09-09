# Information about accessibility funtions

## Accessibility release checklist

Here is a non-exhaustive list of things to consider as you prepare your app for release.

 - [ ] Active interactions. Ensure that all active interactions do something. Any button that can be pushed should do something when pushed. For example, if you have a no-op callback for an onPressed event, change it to show a SnackBar on the screen explaining which control you just pushed.
- [ ] Screen reader testing. The screen reader should be able to describe all controls on the page when you tap on them, and the descriptions should be intelligible. Test your app with TalkBack (Android) and VoiceOver (iOS).
- [ ] Contrast ratios. We encourage you to have a contrast ratio of at least 4.5:1 between controls or text and the background, with the exception of disabled components. Images should also be vetted for sufficient contrast.
- [ ] Context switching. Nothing should change the user’s context automatically while typing in information. Generally, the widgets should avoid changing the user’s context without some sort of confirmation action.
- [ ] Tappable targets. 
All tappable targets should be at least 48x48 pixels.
- [ ] Errors. Important actions should be able to be undone. In fields that show errors, suggest a correction if possible.
- [ ] Color vision deficiency testing. Controls should be usable and legible in colorblind and grayscale modes.
- [ ] Scale factors.The UI should remain legible and usable at very large scale factors for text size and display scaling.

## Links

https://docs.flutter.dev/development/accessibility-and-localization/accessibility


https://medium.com/flutter-community/a-deep-dive-into-flutters-accessibility-widgets-eb0ef9455bc