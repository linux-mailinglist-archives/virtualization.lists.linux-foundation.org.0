Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8911D7DB9FC
	for <lists.virtualization@lfdr.de>; Mon, 30 Oct 2023 13:39:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226B070769;
	Mon, 30 Oct 2023 12:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 226B070769
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Y5PKASa8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1-lz_3o3mwg; Mon, 30 Oct 2023 12:39:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E00A570851;
	Mon, 30 Oct 2023 12:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E00A570851
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94F41C008C;
	Mon, 30 Oct 2023 12:39:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB39BC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Oct 2023 12:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80E9A7076D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Oct 2023 12:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80E9A7076D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iLQqzqwSPyah
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Oct 2023 12:39:31 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4AFC70769
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Oct 2023 12:39:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4AFC70769
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B056219CD;
 Mon, 30 Oct 2023 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1698669569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Lngqcg+nkjGVgOoPgmcw4oMm+hcyGCopDw1fWfcrD/8=;
 b=Y5PKASa8dFVmFdnT6aL8z5iuwp4kcS3EeacVeKZUt/f07PMcW/mWWajKWL565n56G1hLov
 U3bRVzYyDJxOy2KSCtmT9hAXa8+XCMS3GI8vldRR0+Pd4xjCY75XRAmxWZh4LY5qxC+Gu4
 8j3I9oJ6K0OfNxn6YPbWpfHYe3QPz4g=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93B40138EF;
 Mon, 30 Oct 2023 12:39:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZbidIgCkP2UOegAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 30 Oct 2023 12:39:28 +0000
Message-ID: <3b6a8d5d-f766-49fd-aa35-992c5b048bc6@suse.com>
Date: Mon, 30 Oct 2023 13:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] x86/paravirt: move some functions and defines to
 alternative
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
References: <20231019091520.14540-1-jgross@suse.com>
 <20231019091520.14540-2-jgross@suse.com>
 <20231025103402.GBZTjvGse9c0utZGO0@fat_crate.local>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20231025103402.GBZTjvGse9c0utZGO0@fat_crate.local>
Cc: Wanpeng Li <wanpengli@tencent.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexey Makhalov <amakhalov@vmware.com>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Peter Zijlstra <peterz@infradead.org>, Ajay Kaher <akaher@vmware.com>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Juergen Gross via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Juergen Gross <jgross@suse.com>
Content-Type: multipart/mixed; boundary="===============6193462089797163151=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6193462089797163151==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CjY5AqY2i0DxVv5xgZzdvcJ0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CjY5AqY2i0DxVv5xgZzdvcJ0
Content-Type: multipart/mixed; boundary="------------WtUeyENtP6GaM0fFvnSU09ev";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>
Message-ID: <3b6a8d5d-f766-49fd-aa35-992c5b048bc6@suse.com>
Subject: Re: [PATCH v3 1/5] x86/paravirt: move some functions and defines to
 alternative
References: <20231019091520.14540-1-jgross@suse.com>
 <20231019091520.14540-2-jgross@suse.com>
 <20231025103402.GBZTjvGse9c0utZGO0@fat_crate.local>
In-Reply-To: <20231025103402.GBZTjvGse9c0utZGO0@fat_crate.local>

--------------WtUeyENtP6GaM0fFvnSU09ev
Content-Type: multipart/mixed; boundary="------------gKgRX3PD6Fey5HM02ylSIZYh"

--------------gKgRX3PD6Fey5HM02ylSIZYh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMTAuMjMgMTI6MzQsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gVGh1LCBP
Y3QgMTksIDIwMjMgYXQgMTE6MTU6MTZBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+ICsvKiBMb3ctbGV2ZWwgYmFja2VuZCBmdW5jdGlvbnMgdXNhYmxlIGZyb20gYWx0ZXJu
YXRpdmUgY29kZSByZXBsYWNlbWVudHMuICovDQo+PiArREVGSU5FX0FTTV9GVU5DKHg4Nl9u
b3AsICIiLCAuZW50cnkudGV4dCk7DQo+PiArRVhQT1JUX1NZTUJPTF9HUEwoeDg2X25vcCk7
DQo+IA0KPiBUaGlzIGlzIGFsbCB4ODYgY29kZSBzbyB5b3UgZG9uJ3QgcmVhbGx5IG5lZWQg
dGhlICJ4ODZfIiBwcmVmaXggLSAibm9wIg0KPiBpcyBwZXJmZWN0bHkgZmluZS4NCj4gDQo+
PiArbm9pbnN0ciB2b2lkIHg4Nl9CVUcodm9pZCkNCj4+ICt7DQo+PiArCUJVRygpOw0KPj4g
K30NCj4+ICtFWFBPUlRfU1lNQk9MX0dQTCh4ODZfQlVHKTsNCj4gDQo+IFRoYXQgZXhwb3J0
IGlzIG5lZWRlZCBmb3I/DQo+IA0KPiBQYXJhdmlydCBzdHVmZiBpbiBtb2R1bGVzPw0KPiAN
Cj4gSXQgYnVpbGRzIGhlcmUgd2l0aG91dCBpdCAtIEkgZ3Vlc3MgSSBuZWVkIHRvIGRvIGFu
IGFsbG1vZGNvbmZpZy4NCj4gDQoNClR1cm5zIG91dCBpdCBpcyBuZWVkZWQgYWZ0ZXIgYWxs
LiBXaXRoIHBhdGNoIDQgYXBwbGllZCBJIGdldDoNCg0KRVJST1I6IG1vZHBvc3Q6ICJCVUdf
ZnVuYyIgW2FyY2gveDg2L2V2ZW50cy9hbWQvcG93ZXIua29dIHVuZGVmaW5lZCENCkVSUk9S
OiBtb2Rwb3N0OiAiQlVHX2Z1bmMiIFthcmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9tY2UtaW5q
ZWN0LmtvXSB1bmRlZmluZWQhDQpFUlJPUjogbW9kcG9zdDogIkJVR19mdW5jIiBbYXJjaC94
ODYva2VybmVsL2NwdWlkLmtvXSB1bmRlZmluZWQhDQpFUlJPUjogbW9kcG9zdDogIkJVR19m
dW5jIiBbYXJjaC94ODYva3ZtL2t2bS5rb10gdW5kZWZpbmVkIQ0KRVJST1I6IG1vZHBvc3Q6
ICJCVUdfZnVuYyIgW2FyY2gveDg2L2t2bS9rdm0taW50ZWwua29dIHVuZGVmaW5lZCENCkVS
Uk9SOiBtb2Rwb3N0OiAiQlVHX2Z1bmMiIFthcmNoL3g4Ni9rdm0va3ZtLWFtZC5rb10gdW5k
ZWZpbmVkIQ0KRVJST1I6IG1vZHBvc3Q6ICJCVUdfZnVuYyIgW2ZzL25mc2QvbmZzZC5rb10g
dW5kZWZpbmVkIQ0KRVJST1I6IG1vZHBvc3Q6ICJCVUdfZnVuYyIgW2NyeXB0by9hZXNfdGku
a29dIHVuZGVmaW5lZCENCkVSUk9SOiBtb2Rwb3N0OiAiQlVHX2Z1bmMiIFtkcml2ZXJzL3Zp
ZGVvL2ZiZGV2L3V2ZXNhZmIua29dIHVuZGVmaW5lZCENCkVSUk9SOiBtb2Rwb3N0OiAiQlVH
X2Z1bmMiIFtkcml2ZXJzL3ZpZGVvL3ZnYXN0YXRlLmtvXSB1bmRlZmluZWQhDQoNCg0KSnVl
cmdlbg0K
--------------gKgRX3PD6Fey5HM02ylSIZYh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------gKgRX3PD6Fey5HM02ylSIZYh--

--------------WtUeyENtP6GaM0fFvnSU09ev--

--------------CjY5AqY2i0DxVv5xgZzdvcJ0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmU/pAAFAwAAAAAACgkQsN6d1ii/Ey9X
uQf9HVW5MAezF4sh5DKlZuUi81hLzbrceMI/4mgDEoARnFElG81OLh2+VbeukkopRfKFk83m3iDX
Nwczt7+A65fKi2X31jD2Qcwk+Roy22HyH3YOVGR8GyrwD+t40pnnA2j+ltwLNwT8NlnQ4sX/Xs54
/u43Mb372gE+gxQUR6JQq3aHeO+xcYoAvOYOeUn3JGOWoCu/HbQGwAoU6T2Xn5xwdeHTnTRugghs
DsS8QMJJXxmeTFMVokdeISwUqENxPiGTPyOlhzCxLtHkAQyatGHlUXcuOoE/9LeQ+yjOBa6QO8Zp
psAtk64ro1/ouewo/0WZUNT9G+g3r8jL2mkMZU5Bww==
=rD7o
-----END PGP SIGNATURE-----

--------------CjY5AqY2i0DxVv5xgZzdvcJ0--

--===============6193462089797163151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6193462089797163151==--
