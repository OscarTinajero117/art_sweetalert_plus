# CHANGELOG

## 0.1.1

* **Example Application:** Completely redesigned the UI/UX of the example application to adhere to modern design principles, utilizing Material Design 3 cards, adaptive theming, and ripple effects.
* **Alert Coverage:** Ensured that every alert type (`success`, `warning`, `danger`, `question`, `info`) has a dedicated demonstration button in the example application.
* **Testing:** Added acceptance and integration tests within the example application to automatically verify the display and dismissal of all alert types.
* **Documentation:** Enhanced the documentation across the repository to maintain a formal, professional tone in English.

## 0.1.0

* **UI/UX Improvements:**
  * Updated `ArtDialog` default border radius from `4.0` to `16.0` for a more modern appearance.
  * Increased default elevation to `8.0` to improve depth and shadowing.
  * `ArtButton` now uses `Material` and `InkWell` to provide proper ripple effects upon interaction, and the border radius was updated to `8.0`.
  * The dialog background and text colors now automatically adapt to the current `Theme.of(context)`, providing seamless support for Light and Dark modes.
  * Typography improvements: Titles are now slightly bolder (`FontWeight.w600`).
* **Testing:** Added comprehensive widget tests and integration tests.
* **Documentation:** Improved overall code documentation and added `AGENTS.md` for AI agent guidelines.

## 0.0.2

* Add comments.

## 0.0.1

* Create package.
