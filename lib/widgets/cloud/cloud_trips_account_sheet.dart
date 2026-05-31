import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/cloud_trips_auth_service.dart';
import 'package:luxora_ai/services/cloud_trips_entitlement.dart';
import 'package:luxora_ai/services/cloud_trips_sync_service.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/settings/luxora_premium_sheet_shell.dart';

/// Sign in, sync, and sign out for premium cloud trip backup.
class CloudTripsAccountSheet extends StatefulWidget {
  const CloudTripsAccountSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => FractionallySizedBox(
        heightFactor: 0.88,
        alignment: Alignment.bottomCenter,
        widthFactor: 1,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 920),
            child: const CloudTripsAccountSheet(),
          ),
        ),
      ),
    );
  }

  @override
  State<CloudTripsAccountSheet> createState() => _CloudTripsAccountSheetState();
}

class _CloudTripsAccountSheetState extends State<CloudTripsAccountSheet> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  bool _codeSent = false;
  bool _busy = false;
  String? _message;

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final palette = LuxoraPremiumSheetPalette.of(context);
    final tokens = luxThemeTokensOf(context);

    return ListenableBuilder(
      listenable: Listenable.merge([
        CloudTripsAuthService.instance,
        CloudTripsSyncService.instance,
      ]),
      builder: (context, _) {
        final signedIn = CloudTripsAuthService.instance.isSignedIn;
        final backendReady = CloudTripsEntitlement.isBackendReady;

        return LuxoraPremiumSheetShell(
          title: l.cloudTripsTitle,
          heightFraction: 1,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.cloudTripsSubtitle,
                  style: palette.subtitleStyle(Theme.of(context).textTheme),
                ),
                const SizedBox(height: 20),
                if (!backendReady) ...[
                  Text(
                    l.cloudTripsNotConfigured,
                    style: TextStyle(color: tokens.textMuted, height: 1.4),
                  ),
                ] else if (!CloudTripsEntitlement.hasPremium) ...[
                  Text(
                    l.cloudTripsUnlockRequired,
                    style: TextStyle(color: tokens.textMuted, height: 1.4),
                  ),
                  const SizedBox(height: 16),
                  LuxButton(
                    label: l.cloudTripsUnlockCta,
                    icon: Icons.lock_open_rounded,
                    fullWidth: true,
                    onPressed: () async {
                      Navigator.of(context).pop();
                      if (context.mounted) {
                        await PaywallService.showPaywall(context);
                      }
                    },
                  ),
                ] else if (signedIn) ...[
                  _signedInBody(context, l, tokens),
                ] else ...[
                  _signInBody(context, l, tokens),
                ],
                if (_message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    _message!,
                    style: TextStyle(
                      color: tokens.accent.withValues(alpha: 0.9),
                      fontSize: 13,
                      height: 1.35,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _signedInBody(
    BuildContext context,
    AppLocalizations l,
    LuxThemeTokens tokens,
  ) {
    final email = CloudTripsAuthService.instance.email ?? '';
    final sync = CloudTripsSyncService.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.cloudTripsMoreSubSignedIn(email),
          style: TextStyle(
            color: tokens.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        LuxButton(
          label: l.cloudTripsSyncNow,
          icon: Icons.sync_rounded,
          fullWidth: true,
          onPressed: sync.status == CloudSyncStatus.syncing || _busy
              ? null
              : () => _runSync(context, l),
        ),
        if (sync.status == CloudSyncStatus.success) ...[
          const SizedBox(height: 12),
          Text(
            l.cloudTripsSyncSuccess,
            style: TextStyle(color: tokens.textMuted, fontSize: 13),
          ),
        ],
        if (sync.status == CloudSyncStatus.error) ...[
          const SizedBox(height: 12),
          Text(
            l.cloudTripsSyncError,
            style: TextStyle(color: tokens.textMuted, fontSize: 13),
          ),
        ],
        const SizedBox(height: 12),
        TextButton(
          onPressed: _busy
              ? null
              : () async {
                  setState(() => _busy = true);
                  await CloudTripsAuthService.instance.signOut();
                  if (mounted) {
                    setState(() {
                      _busy = false;
                      _codeSent = false;
                      _message = null;
                    });
                  }
                },
          child: Text(l.cloudTripsSignOut),
        ),
      ],
    );
  }

  Widget _signInBody(
    BuildContext context,
    AppLocalizations l,
    LuxThemeTokens tokens,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          decoration: InputDecoration(
            labelText: l.cloudTripsEmailHint,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 12),
        if (_codeSent) ...[
          TextField(
            controller: _codeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: l.cloudTripsCodeHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          LuxButton(
            label: l.cloudTripsVerify,
            icon: Icons.verified_user_outlined,
            fullWidth: true,
            onPressed: _busy ? null : () => _verifyCode(context, l),
          ),
        ] else ...[
          LuxButton(
            label: l.cloudTripsSendCode,
            icon: Icons.mail_outline_rounded,
            fullWidth: true,
            onPressed: _busy ? null : () => _sendCode(context, l),
          ),
        ],
      ],
    );
  }

  Future<void> _sendCode(BuildContext context, AppLocalizations l) async {
    final email = _emailController.text.trim();
    if (email.isEmpty) return;
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      await CloudTripsAuthService.instance.sendEmailOtp(email);
      if (mounted) {
        setState(() {
          _codeSent = true;
          _message = l.cloudTripsCodeSent;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _message = l.cloudTripsSyncError);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _verifyCode(BuildContext context, AppLocalizations l) async {
    final email = _emailController.text.trim();
    final code = _codeController.text.trim();
    if (email.isEmpty || code.isEmpty) return;
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      await CloudTripsAuthService.instance.verifyEmailOtp(
        email: email,
        token: code,
      );
      await CloudTripsSyncService.instance.syncAll();
      if (mounted) {
        setState(() => _message = l.cloudTripsSyncSuccess);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _message = l.cloudTripsSyncError);
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _runSync(BuildContext context, AppLocalizations l) async {
    setState(() {
      _busy = true;
      _message = null;
    });
    await CloudTripsSyncService.instance.syncAll();
    if (mounted) {
      setState(() {
        _busy = false;
        _message = CloudTripsSyncService.instance.status == CloudSyncStatus.success
            ? l.cloudTripsSyncSuccess
            : l.cloudTripsSyncError;
      });
    }
  }
}
