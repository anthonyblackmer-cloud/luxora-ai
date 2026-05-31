import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:luxora_ai/services/cloud_trips_entitlement.dart';
import 'package:luxora_ai/services/cloud_trips_sync_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Email OTP sign-in for premium cloud trip backup.
class CloudTripsAuthService extends ChangeNotifier {
  CloudTripsAuthService._();

  static final CloudTripsAuthService instance = CloudTripsAuthService._();

  User? _user;
  StreamSubscription<AuthState>? _authSub;

  User? get user => _user;

  bool get isSignedIn => _user != null;

  String? get email => _user?.email;

  Future<void> initialize() async {
    if (!CloudTripsEntitlement.isBackendReady) return;
    _user = Supabase.instance.client.auth.currentUser;
    await _authSub?.cancel();
    _authSub = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      _user = data.session?.user;
      notifyListeners();
      if (data.session != null && CloudTripsEntitlement.canUseCloud) {
        unawaited(CloudTripsSyncService.instance.syncAll());
      }
    });
    notifyListeners();
  }

  Future<void> sendEmailOtp(String email) async {
    _assertReady();
    await Supabase.instance.client.auth.signInWithOtp(
      email: email.trim(),
    );
  }

  Future<void> verifyEmailOtp({
    required String email,
    required String token,
  }) async {
    _assertReady();
    await Supabase.instance.client.auth.verifyOTP(
      email: email.trim(),
      token: token.trim(),
      type: OtpType.email,
    );
  }

  Future<void> signOut() async {
    if (!CloudTripsEntitlement.isBackendReady) return;
    await Supabase.instance.client.auth.signOut();
    _user = null;
    notifyListeners();
  }

  void _assertReady() {
    if (!CloudTripsEntitlement.isBackendReady) {
      throw StateError('Supabase is not configured');
    }
  }

  @override
  void dispose() {
    unawaited(_authSub?.cancel());
    super.dispose();
  }
}
