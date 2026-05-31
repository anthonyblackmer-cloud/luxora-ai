# In-App Purchases (StoreKit & Google Play)

Luxora city packs are **non-consumable** one-time purchases. Entitlements are granted after Apple/Google confirms the transaction, persisted locally, and re-applied via **Restore purchases**.

## Product IDs

Must match exactly in App Store Connect and Google Play Console:

| Pack | Product ID |
|------|----------------|
| Orlando City Pack | `com.luxora.luxoraAi.city.orlando` |
| Miami City Pack | `com.luxora.luxoraAi.city.miami` |
| Florida Keys City Pack | `com.luxora.luxoraAi.city.florida_keys` |
| Orlando Theme Parks add-on | `com.luxora.luxoraAi.addon.orlando_theme_parks` |

Bundle ID: `com.luxora.luxoraAi`

## App Store Connect (iOS)

1. **App Store Connect** → your app → **In-App Purchases**
2. Create **Non-Consumable** products with the IDs above
3. Set pricing (e.g. $9.99 tier)
4. Add localized display names and review notes
5. **Agreements, Tax, and Banking** must be complete
6. In Xcode: **Runner** target → **Signing & Capabilities** → add **In-App Purchase**

### Sandbox testing

- Create Sandbox testers in App Store Connect
- Sign out of Media & Purchases on device, sign in with sandbox account when prompted
- Purchases do not charge real money

### StoreKit Configuration (local)

Optional: add a `Products.storekit` file in Xcode for simulator testing without App Store Connect.

## Google Play Console (Android)

1. **Monetize** → **Products** → **In-app products**
2. Create **Managed products** (non-consumable) with the same product IDs
3. Activate each product
4. Upload at least an internal testing build
5. Add license testers under **Setup** → **License testing**

Billing permission is added by the `in_app_purchase` plugin.

## App behavior

- Paywall **Unlock** → `InAppPurchase.buyNonConsumable`
- **Restore purchases** on paywall → `InAppPurchase.restorePurchases`
- Silent restore on app launch (after entitlements load)
- Simulated unlock **removed** in production

### Dev without stores

**Web / Edge (debug)** — paywall is bypassed automatically (no store billing on web).

**Mobile/desktop debug** — either:

```bash
flutter run --dart-define=BYPASS_PAYWALL=true
```

or simulate purchases when the store is unavailable:

```bash
flutter run --dart-define=SIMULATE_IAP=true
```

To test the real paywall UI on web debug:

```bash
flutter run -d edge --dart-define=BYPASS_PAYWALL=false
```

Requires `kDebugMode`. Never use bypass flags in release builds.

## Verification

Client-side product ID matching is implemented today. For production hardening, add server receipt validation (App Store Server API / Play Developer API) via a Supabase edge function before scaling marketing spend.

## Checklist before TestFlight / internal testing

- [ ] All four product IDs created and **Approved/Active**
- [ ] Paywall shows localized store price (not fallback `$9.99`) when products load
- [ ] Purchase Orlando → Concierge unlocks
- [ ] Delete app → reinstall → **Restore purchases** → Orlando still unlocked
- [ ] Second device with same Apple ID / Google account → restore works
