Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D10097D7CE0
	for <lists.virtualization@lfdr.de>; Thu, 26 Oct 2023 08:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11375402EB;
	Thu, 26 Oct 2023 06:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11375402EB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Mub/rcU/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Glj0oKX3ixU; Thu, 26 Oct 2023 06:33:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A519D408DC;
	Thu, 26 Oct 2023 06:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A519D408DC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EF16C008C;
	Thu, 26 Oct 2023 06:33:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E29BC0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9A5341F3B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A5341F3B
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=susede1 header.b=Mub/rcU/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZSe8264t0pK
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:33:22 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B41A41F34
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 06:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B41A41F34
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E04921B14;
 Thu, 26 Oct 2023 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1698301998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c0PrQo/5ylfzN9pxaAwNTPj5sf6WxWHTV5YnBbi4mlw=;
 b=Mub/rcU/5E/F1EzmOLSxVUyX1kxcfv3YfG9M+yCC6O+CFarOWPM+y6qo4u9HwSmqihKYi8
 YO2wD2iWSDcoS3K7efbUH/QE87Rm7+Zf9qQJxPzZwwh+CnjQ8I9zxLPrKR9ID8kTKiUDpV
 Zt0F6yiGeO4C1gK9TLE8StxRjXME1hA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 099CB133F5;
 Thu, 26 Oct 2023 06:33:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4zzkAC4IOmXXWAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 26 Oct 2023 06:33:18 +0000
Message-ID: <4d300f38-f906-4246-908a-3b9d757a9660@suse.com>
Date: Thu, 26 Oct 2023 08:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] x86/paravirt: switch mixed paravirt/alternative
 calls to alternative_2
Content-Language: en-US
To: kernel test robot <oliver.sang@intel.com>
References: <202310261032.76a10bc0-oliver.sang@intel.com>
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
In-Reply-To: <202310261032.76a10bc0-oliver.sang@intel.com>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-11.99 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.com:s=susede1];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_TWELVE(0.00)[15]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 MIME_UNKNOWN(0.10)[application/pgp-keys]
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Alexey Makhalov <amakhalov@vmware.com>, lkp@intel.com,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Ajay Kaher <akaher@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 oe-lkp@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
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
Content-Type: multipart/mixed; boundary="===============4959817673723384114=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4959817673723384114==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lzKKkXpwCv50m0d63i7ucD9c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lzKKkXpwCv50m0d63i7ucD9c
Content-Type: multipart/mixed; boundary="------------JK0KsUWdL8K5ifpC0yIf3I07";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, x86@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <akaher@vmware.com>,
 Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
Message-ID: <4d300f38-f906-4246-908a-3b9d757a9660@suse.com>
Subject: Re: [PATCH v3 4/5] x86/paravirt: switch mixed paravirt/alternative
 calls to alternative_2
References: <202310261032.76a10bc0-oliver.sang@intel.com>
In-Reply-To: <202310261032.76a10bc0-oliver.sang@intel.com>

--------------JK0KsUWdL8K5ifpC0yIf3I07
Content-Type: multipart/mixed; boundary="------------vXVY5q74bxCtMVo2nQsVkZjS"

--------------vXVY5q74bxCtMVo2nQsVkZjS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMTAuMjMgMDQ6NDQsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0KPiANCj4gDQo+
IEhlbGxvLA0KPiANCj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCAiQlVHOnVuYWJsZV90
b19oYW5kbGVfcGFnZV9mYXVsdF9mb3JfYWRkcmVzcyIgb246DQo+IA0KPiBjb21taXQ6IGIw
YjhiMDY1NDhmNzk4NDM1MWI1MDNlYzVmNWMxM2ZhODBiYWU2YTIgKCJbUEFUQ0ggdjMgNC81
XSB4ODYvcGFyYXZpcnQ6IHN3aXRjaCBtaXhlZCBwYXJhdmlydC9hbHRlcm5hdGl2ZSBjYWxs
cyB0byBhbHRlcm5hdGl2ZV8yIikNCj4gdXJsOiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwt
bGFiLWxrcC9saW51eC9jb21taXRzL0p1ZXJnZW4tR3Jvc3MveDg2LXBhcmF2aXJ0LW1vdmUt
c29tZS1mdW5jdGlvbnMtYW5kLWRlZmluZXMtdG8tYWx0ZXJuYXRpdmUvMjAyMzEwMTktMTcx
NzA5DQo+IGJhc2U6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC92aXJ0L2t2bS9rdm0u
Z2l0IHF1ZXVlDQo+IHBhdGNoIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIzMTAxOTA5MTUyMC4xNDU0MC01LWpncm9zc0BzdXNlLmNvbS8NCj4gcGF0Y2ggc3ViamVj
dDogW1BBVENIIHYzIDQvNV0geDg2L3BhcmF2aXJ0OiBzd2l0Y2ggbWl4ZWQgcGFyYXZpcnQv
YWx0ZXJuYXRpdmUgY2FsbHMgdG8gYWx0ZXJuYXRpdmVfMg0KPiANCj4gaW4gdGVzdGNhc2U6
IGJvb3QNCj4gDQo+IGNvbXBpbGVyOiBnY2MtMTINCj4gdGVzdCBtYWNoaW5lOiBxZW11LXN5
c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLWNwdSBTYW5keUJyaWRnZSAtc21wIDIgLW0gMTZH
DQo+IA0KPiAocGxlYXNlIHJlZmVyIHRvIGF0dGFjaGVkIGRtZXNnL2ttc2cgZm9yIGVudGly
ZSBsb2cvYmFja3RyYWNlKQ0KPiANCj4gDQo+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsNCj4gfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgZWZhMWE3MGYw
YiB8IGIwYjhiMDY1NDggfA0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rDQo+IHwgQlVHOnVuYWJs
ZV90b19oYW5kbGVfcGFnZV9mYXVsdF9mb3JfYWRkcmVzcyB8IDAgICAgICAgICAgfCAxNCAg
ICAgICAgIHwNCj4gfCBPb3BzOiNbIyNdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMCAgICAgICAgICB8IDE0ICAgICAgICAgfA0KPiB8IEVJUDphcHBseV9hbHRlcm5h
dGl2ZXMgICAgICAgICAgICAgICAgICAgICAgfCAwICAgICAgICAgIHwgMTQgICAgICAgICB8
DQo+IHwgS2VybmVsX3BhbmljLW5vdF9zeW5jaW5nOkZhdGFsX2V4Y2VwdGlvbiAgICB8IDAg
ICAgICAgICAgfCAxNCAgICAgICAgIHwNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKw0KPiANCj4g
DQo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChp
LmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YNCj4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0
KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncw0KPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8b2xpdmVyLnNhbmdAaW50ZWwuY29tPg0KPiB8IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2UtbGtwLzIwMjMxMDI2MTAzMi43NmExMGJjMC1vbGl2ZXIu
c2FuZ0BpbnRlbC5jb20NCj4gDQo+IA0KPiBbICAgIDEuMzgyNTAwXVsgICAgVDBdIEJVRzog
dW5hYmxlIHRvIGhhbmRsZSBwYWdlIGZhdWx0IGZvciBhZGRyZXNzOiA4NDg2NGU5MQ0KPiBb
ICAgIDEuMzgzNjMzXVsgICAgVDBdICNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBr
ZXJuZWwgbW9kZQ0KPiBbICAgIDEuMzg0NTc5XVsgICAgVDBdICNQRjogZXJyb3JfY29kZSgw
eDAwMDApIC0gbm90LXByZXNlbnQgcGFnZQ0KPiBbICAgIDEuMzg0NTc5XVsgICAgVDBdICpw
ZGUgPSAwMDAwMDAwMA0KPiBbICAgIDEuMzg0NTc5XVsgICAgVDBdIE9vcHM6IDAwMDAgWyMx
XSBQUkVFTVBUIFNNUA0KPiBbICAgIDEuMzg0NTc5XVsgICAgVDBdIENQVTogMCBQSUQ6IDAg
Q29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDYuNi4wLXJjNS0wMDEwMS1nYjBiOGIwNjU0
OGY3ICMxIDdjYjdmMDE2YzA1OTg2Y2M0NTNhM2FlNGIzN2NkMzcxMmM2MmMwYzANCj4gWyAg
ICAxLjM4NDU3OV1bICAgIFQwXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChp
NDQwRlggKyBQSUlYLCAxOTk2KSwgQklPUyAxLjE2LjItZGViaWFuLTEuMTYuMi0xIDA0LzAx
LzIwMTQNCj4gWyAxLjM4NDU3OV1bIFQwXSBFSVA6IGFwcGx5X2FsdGVybmF0aXZlcyAoYXJj
aC94ODYva2VybmVsL2FsdGVybmF0aXZlLmM6NDE5IGFyY2gveDg2L2tlcm5lbC9hbHRlcm5h
dGl2ZS5jOjQ4OSkNCj4gWyAxLjM4NDU3OV1bIFQwXSBDb2RlOiAzYyAwNiAwZiA4NSA0ZSAw
MiAwMCAwMCA4YiA4NSBlYyBmZSBmZiBmZiA4MCAzOCBmZiAwZiA4NSAzZiAwMiAwMCAwMCA4
MCA3OCAwMSAxNSAwZiA4NSAzNSAwMiAwMCAwMCA4YiA4ZCBlYyBmZSBmZiBmZiA4YiA0MSAw
MiA8OGI+IDQ0IDAxIDA2IDg1IGMwIDc0IDE3IDg5IGMyIDgxIGVhIDYwIDE4IDdjIGMyIDAx
IDk1IGYzIGZlIGZmIGZmDQo+IEFsbCBjb2RlDQo+ID09PT09PT09DQo+ICAgICAwOgkzYyAw
NiAgICAgICAgICAgICAgICAJY21wICAgICQweDYsJWFsDQo+ICAgICAyOgkwZiA4NSA0ZSAw
MiAwMCAwMCAgICAJam5lICAgIDB4MjU2DQo+ICAgICA4Ogk4YiA4NSBlYyBmZSBmZiBmZiAg
ICAJbW92ICAgIC0weDExNCglcmJwKSwlZWF4DQo+ICAgICBlOgk4MCAzOCBmZiAgICAgICAg
ICAgICAJY21wYiAgICQweGZmLCglcmF4KQ0KPiAgICAxMToJMGYgODUgM2YgMDIgMDAgMDAg
ICAgCWpuZSAgICAweDI1Ng0KPiAgICAxNzoJODAgNzggMDEgMTUgICAgICAgICAgCWNtcGIg
ICAkMHgxNSwweDEoJXJheCkNCj4gICAgMWI6CTBmIDg1IDM1IDAyIDAwIDAwICAgIAlqbmUg
ICAgMHgyNTYNCj4gICAgMjE6CThiIDhkIGVjIGZlIGZmIGZmICAgIAltb3YgICAgLTB4MTE0
KCVyYnApLCVlY3gNCj4gICAgMjc6CThiIDQxIDAyICAgICAgICAgICAgIAltb3YgICAgMHgy
KCVyY3gpLCVlYXgNCj4gICAgMmE6Kgk4YiA0NCAwMSAwNiAgICAgICAgICAJbW92ICAgIDB4
NiglcmN4LCVyYXgsMSksJWVheAkJPC0tIHRyYXBwaW5nIGluc3RydWN0aW9uDQo+ICAgIDJl
Ogk4NSBjMCAgICAgICAgICAgICAgICAJdGVzdCAgICVlYXgsJWVheA0KPiAgICAzMDoJNzQg
MTcgICAgICAgICAgICAgICAgCWplICAgICAweDQ5DQo+ICAgIDMyOgk4OSBjMiAgICAgICAg
ICAgICAgICAJbW92ICAgICVlYXgsJWVkeA0KPiAgICAzNDoJODEgZWEgNjAgMTggN2MgYzIg
ICAgCXN1YiAgICAkMHhjMjdjMTg2MCwlZWR4DQo+ICAgIDNhOgkwMSA5NSBmMyBmZSBmZiBm
ZiAgICAJYWRkICAgICVlZHgsLTB4MTBkKCVyYnApDQo+IA0KPiBDb2RlIHN0YXJ0aW5nIHdp
dGggdGhlIGZhdWx0aW5nIGluc3RydWN0aW9uDQo+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gICAgIDA6CThiIDQ0IDAxIDA2ICAgICAgICAgIAlt
b3YgICAgMHg2KCVyY3gsJXJheCwxKSwlZWF4DQo+ICAgICA0Ogk4NSBjMCAgICAgICAgICAg
ICAgICAJdGVzdCAgICVlYXgsJWVheA0KPiAgICAgNjoJNzQgMTcgICAgICAgICAgICAgICAg
CWplICAgICAweDFmDQo+ICAgICA4Ogk4OSBjMiAgICAgICAgICAgICAgICAJbW92ICAgICVl
YXgsJWVkeA0KPiAgICAgYToJODEgZWEgNjAgMTggN2MgYzIgICAgCXN1YiAgICAkMHhjMjdj
MTg2MCwlZWR4DQo+ICAgIDEwOgkwMSA5NSBmMyBmZSBmZiBmZiAgICAJYWRkICAgICVlZHgs
LTB4MTBkKCVyYnApDQo+IFsgICAgMS4zODQ1NzldWyAgICBUMF0gRUFYOiBjMzdlNzM3NCBF
Qlg6IGMzN2I3ZTNhIEVDWDogYzEwN2RiMTcgRURYOiAwMDAwMDAwNQ0KPiBbICAgIDEuMzg0
NTc5XVsgICAgVDBdIEVTSTogYzNmZmM3MGEgRURJOiAwMDAwMDAwMCBFQlA6IGMzN2I3ZjQ4
IEVTUDogYzM3YjdlMDANCj4gWyAgICAxLjM4NDU3OV1bICAgIFQwXSBEUzogMDA3YiBFUzog
MDA3YiBGUzogMDBkOCBHUzogMDAwMCBTUzogMDA2OCBFRkxBR1M6IDAwMjEwMjQ2DQo+IFsg
ICAgMS4zODQ1NzldWyAgICBUMF0gQ1IwOiA4MDA1MDAzMyBDUjI6IDg0ODY0ZTkxIENSMzog
MDQwMzcwMDAgQ1I0OiAwMDA0MDZkMA0KPiBbICAgIDEuMzg0NTc5XVsgICAgVDBdIERSMDog
MDAwMDAwMDAgRFIxOiAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwIERSMzogMDAwMDAwMDANCj4g
WyAgICAxLjM4NDU3OV1bICAgIFQwXSBEUjY6IGZmZmUwZmYwIERSNzogMDAwMDA0MDANCj4g
WyAgICAxLjM4NDU3OV1bICAgIFQwXSBDYWxsIFRyYWNlOg0KPiBbIDEuMzg0NTc5XVsgVDBd
ID8gc2hvd19yZWdzIChhcmNoL3g4Ni9rZXJuZWwvZHVtcHN0YWNrLmM6NDc5KQ0KPiBbIDEu
Mzg0NTc5XVsgVDBdID8gX19kaWUgKGFyY2gveDg2L2tlcm5lbC9kdW1wc3RhY2suYzo0MjEg
YXJjaC94ODYva2VybmVsL2R1bXBzdGFjay5jOjQzNCkNCj4gWyAxLjM4NDU3OV1bIFQwXSA/
IG9vcHNfZW50ZXIgKGtlcm5lbC9wYW5pYy5jOjYyNykNCj4gWyAxLjM4NDU3OV1bIFQwXSA/
IHBhZ2VfZmF1bHRfb29wcyAoYXJjaC94ODYvbW0vZmF1bHQuYzo3MDcpDQo+IFsgMS4zODQ1
NzldWyBUMF0gPyBrZXJuZWxtb2RlX2ZpeHVwX29yX29vcHMrMHg5Yy8weGY0DQo+IFsgMS4z
ODQ1NzldWyBUMF0gPyBfX2JhZF9hcmVhX25vc2VtYXBob3JlKzB4MTNmLzB4MjYwDQo+IFsg
MS4zODQ1NzldWyBUMF0gPyBpbnNuX2dldF9vcGNvZGUgKGFyY2gveDg2L2xpYi9pbnNuLmM6
Mjk5KQ0KPiBbIDEuMzg0NTc5XVsgVDBdID8gaW5zbl9nZXRfbW9kcm0gKGFyY2gveDg2L2xp
Yi9pbnNuLmM6MzQ0KQ0KPiBbIDEuMzg0NTc5XVsgVDBdID8gaW5zbl9nZXRfc2liIChhcmNo
L3g4Ni9saWIvaW5zbi5jOjQyMikNCj4gWyAxLjM4NDU3OV1bIFQwXSA/IGJhZF9hcmVhX25v
c2VtYXBob3JlIChhcmNoL3g4Ni9tbS9mYXVsdC5jOjg2NykNCj4gWyAxLjM4NDU3OV1bIFQw
XSA/IGRvX3VzZXJfYWRkcl9mYXVsdCAoYXJjaC94ODYvbW0vZmF1bHQuYzoxNDc2KQ0KPiBb
IDEuMzg0NTc5XVsgVDBdID8gb3B0aW1pemVfbm9wcyAoYXJjaC94ODYva2VybmVsL2FsdGVy
bmF0aXZlLmM6MjQ2KQ0KPiBbIDEuMzg0NTc5XVsgVDBdID8gZXhjX3BhZ2VfZmF1bHQgKGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmg6MjYgYXJjaC94ODYvaW5jbHVkZS9hc20v
aXJxZmxhZ3MuaDo2NyBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9pcnFmbGFncy5oOjEyNyBhcmNo
L3g4Ni9tbS9mYXVsdC5jOjE1MTMgYXJjaC94ODYvbW0vZmF1bHQuYzoxNTYxKQ0KPiBbIDEu
Mzg0NTc5XVsgVDBdID8gcHZjbG9ja19jbG9ja3NvdXJjZV9yZWFkX25vd2QgKGFyY2gveDg2
L21tL2ZhdWx0LmM6MTUxOCkNCj4gWyAxLjM4NDU3OV1bIFQwXSA/IGhhbmRsZV9leGNlcHRp
b24gKGFyY2gveDg2L2VudHJ5L2VudHJ5XzMyLlM6MTA0OSkNCj4gWyAxLjM4NDU3OV1bIFQw
XSA/IF9fX3B0ZV9mcmVlX3RsYiAoYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaDo5
MiBhcmNoL3g4Ni9tbS9wZ3RhYmxlLmM6NTcpDQo+IFsgMS4zODQ1NzldWyBUMF0gPyBwdmNs
b2NrX2Nsb2Nrc291cmNlX3JlYWRfbm93ZCAoYXJjaC94ODYvbW0vZmF1bHQuYzoxNTE4KQ0K
PiBbIDEuMzg0NTc5XVsgVDBdID8gYXBwbHlfYWx0ZXJuYXRpdmVzIChhcmNoL3g4Ni9rZXJu
ZWwvYWx0ZXJuYXRpdmUuYzo0MTkgYXJjaC94ODYva2VybmVsL2FsdGVybmF0aXZlLmM6NDg5
KQ0KPiBbIDEuMzg0NTc5XVsgVDBdID8gcHZjbG9ja19jbG9ja3NvdXJjZV9yZWFkX25vd2Qg
KGFyY2gveDg2L21tL2ZhdWx0LmM6MTUxOCkNCj4gWyAxLjM4NDU3OV1bIFQwXSA/IGFwcGx5
X2FsdGVybmF0aXZlcyAoYXJjaC94ODYva2VybmVsL2FsdGVybmF0aXZlLmM6NDE5IGFyY2gv
eDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jOjQ4OSkNCj4gWyAxLjM4NDU3OV1bIFQwXSA/IGxv
Y2tfYWNxdWlyZSAoa2VybmVsL2xvY2tpbmcvbG9ja2RlcC5jOjU2NzAga2VybmVsL2xvY2tp
bmcvbG9ja2RlcC5jOjU3NDQpDQo+IFsgMS4zODQ1NzldWyBUMF0gPyBfX19wdGVfZnJlZV90
bGIgKGFyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0Lmg6OTIgYXJjaC94ODYvbW0vcGd0
YWJsZS5jOjU3KQ0KPiBbIDEuMzg0NTc5XVsgVDBdIGFsdGVybmF0aXZlX2luc3RydWN0aW9u
cyAoYXJjaC94ODYva2VybmVsL2FsdGVybmF0aXZlLmM6MTY3NykNCj4gWyAxLjM4NDU3OV1b
IFQwXSA/IGZwdV9faW5pdF9jcHUgKGFyY2gveDg2L2tlcm5lbC9mcHUvaW5pdC5jOjU0KQ0K
PiBbIDEuMzg0NTc5XVsgVDBdIGFyY2hfY3B1X2ZpbmFsaXplX2luaXQgKGFyY2gveDg2L2tl
cm5lbC9jcHUvY29tbW9uLmM6MjQwNykNCj4gWyAxLjM4NDU3OV1bIFQwXSBzdGFydF9rZXJu
ZWwgKGluaXQvbWFpbi5jOjEwMzUpDQo+IFsgMS4zODQ1NzldWyBUMF0gPyBzZXRfaW5pdF9h
cmcgKGluaXQvbWFpbi5jOjUzMCkNCj4gWyAxLjM4NDU3OV1bIFQwXSBpMzg2X3N0YXJ0X2tl
cm5lbCAoYXJjaC94ODYva2VybmVsL2hlYWQzMi5jOjc0KQ0KPiBbIDEuMzg0NTc5XVsgVDBd
IHN0YXJ0dXBfMzJfc21wIChhcmNoL3g4Ni9rZXJuZWwvaGVhZF8zMi5TOjMwNSkNCj4gWyAg
ICAxLjM4NDU3OV1bICAgIFQwXSBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gWyAgICAxLjM4NDU3
OV1bICAgIFQwXSBDUjI6IDAwMDAwMDAwODQ4NjRlOTENCj4gWyAgICAxLjM4NDU3OV1bICAg
IFQwXSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gWyAxLjM4NDU3
OV1bIFQwXSBFSVA6IGFwcGx5X2FsdGVybmF0aXZlcyAoYXJjaC94ODYva2VybmVsL2FsdGVy
bmF0aXZlLmM6NDE5IGFyY2gveDg2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jOjQ4OSkNCj4gWyAx
LjM4NDU3OV1bIFQwXSBDb2RlOiAzYyAwNiAwZiA4NSA0ZSAwMiAwMCAwMCA4YiA4NSBlYyBm
ZSBmZiBmZiA4MCAzOCBmZiAwZiA4NSAzZiAwMiAwMCAwMCA4MCA3OCAwMSAxNSAwZiA4NSAz
NSAwMiAwMCAwMCA4YiA4ZCBlYyBmZSBmZiBmZiA4YiA0MSAwMiA8OGI+IDQ0IDAxIDA2IDg1
IGMwIDc0IDE3IDg5IGMyIDgxIGVhIDYwIDE4IDdjIGMyIDAxIDk1IGYzIGZlIGZmIGZmDQo+
IEFsbCBjb2RlDQo+ID09PT09PT09DQo+ICAgICAwOgkzYyAwNiAgICAgICAgICAgICAgICAJ
Y21wICAgICQweDYsJWFsDQo+ICAgICAyOgkwZiA4NSA0ZSAwMiAwMCAwMCAgICAJam5lICAg
IDB4MjU2DQo+ICAgICA4Ogk4YiA4NSBlYyBmZSBmZiBmZiAgICAJbW92ICAgIC0weDExNCgl
cmJwKSwlZWF4DQo+ICAgICBlOgk4MCAzOCBmZiAgICAgICAgICAgICAJY21wYiAgICQweGZm
LCglcmF4KQ0KPiAgICAxMToJMGYgODUgM2YgMDIgMDAgMDAgICAgCWpuZSAgICAweDI1Ng0K
PiAgICAxNzoJODAgNzggMDEgMTUgICAgICAgICAgCWNtcGIgICAkMHgxNSwweDEoJXJheCkN
Cj4gICAgMWI6CTBmIDg1IDM1IDAyIDAwIDAwICAgIAlqbmUgICAgMHgyNTYNCj4gICAgMjE6
CThiIDhkIGVjIGZlIGZmIGZmICAgIAltb3YgICAgLTB4MTE0KCVyYnApLCVlY3gNCj4gICAg
Mjc6CThiIDQxIDAyICAgICAgICAgICAgIAltb3YgICAgMHgyKCVyY3gpLCVlYXgNCj4gICAg
MmE6Kgk4YiA0NCAwMSAwNiAgICAgICAgICAJbW92ICAgIDB4NiglcmN4LCVyYXgsMSksJWVh
eAkJPC0tIHRyYXBwaW5nIGluc3RydWN0aW9uDQo+ICAgIDJlOgk4NSBjMCAgICAgICAgICAg
ICAgICAJdGVzdCAgICVlYXgsJWVheA0KPiAgICAzMDoJNzQgMTcgICAgICAgICAgICAgICAg
CWplICAgICAweDQ5DQo+ICAgIDMyOgk4OSBjMiAgICAgICAgICAgICAgICAJbW92ICAgICVl
YXgsJWVkeA0KPiAgICAzNDoJODEgZWEgNjAgMTggN2MgYzIgICAgCXN1YiAgICAkMHhjMjdj
MTg2MCwlZWR4DQo+ICAgIDNhOgkwMSA5NSBmMyBmZSBmZiBmZiAgICAJYWRkICAgICVlZHgs
LTB4MTBkKCVyYnApDQo+IA0KPiBDb2RlIHN0YXJ0aW5nIHdpdGggdGhlIGZhdWx0aW5nIGlu
c3RydWN0aW9uDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0NCj4gICAgIDA6CThiIDQ0IDAxIDA2ICAgICAgICAgIAltb3YgICAgMHg2KCVyY3gsJXJh
eCwxKSwlZWF4DQo+ICAgICA0Ogk4NSBjMCAgICAgICAgICAgICAgICAJdGVzdCAgICVlYXgs
JWVheA0KPiAgICAgNjoJNzQgMTcgICAgICAgICAgICAgICAgCWplICAgICAweDFmDQo+ICAg
ICA4Ogk4OSBjMiAgICAgICAgICAgICAgICAJbW92ICAgICVlYXgsJWVkeA0KPiAgICAgYToJ
ODEgZWEgNjAgMTggN2MgYzIgICAgCXN1YiAgICAkMHhjMjdjMTg2MCwlZWR4DQo+ICAgIDEw
OgkwMSA5NSBmMyBmZSBmZiBmZiAgICAJYWRkICAgICVlZHgsLTB4MTBkKCVyYnApDQo+IA0K
PiANCj4gVGhlIGtlcm5lbCBjb25maWcgYW5kIG1hdGVyaWFscyB0byByZXByb2R1Y2UgYXJl
IGF2YWlsYWJsZSBhdDoNCj4gaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNo
aXZlLzIwMjMxMDI2LzIwMjMxMDI2MTAzMi43NmExMGJjMC1vbGl2ZXIuc2FuZ0BpbnRlbC5j
b20NCg0KWWF5LCAzMi1iaXQgY29kZS4NCg0KSSdsbCB1cGRhdGUgdGhlIHBhdGNoIHRvIGNv
bnNpZGVyIFg4Nl8zMiwgd2hpY2ggaGFzIG5vICVyaXAgcmVsYXRpdmUgaW5kaXJlY3QNCmNh
bGwuDQoNCg0KSnVlcmdlbg0KDQo=
--------------vXVY5q74bxCtMVo2nQsVkZjS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vXVY5q74bxCtMVo2nQsVkZjS--

--------------JK0KsUWdL8K5ifpC0yIf3I07--

--------------lzKKkXpwCv50m0d63i7ucD9c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmU6CC0FAwAAAAAACgkQsN6d1ii/Ey9l
+Af/VvYHCk96aRxmoW1ZFC1xqbYTNbg3MN6Y1pUFRQGAwzxBzlHV8hcaNPDdGAerGBlZaOETOxzX
BeH6Mp14ZGocHCRfdGzjC9PmPvI/exCMBaBBsMiXc7hug6gv/SDWcdYcvrXOGabFZYyMMOkKLWIw
Hn9t1kbWy39nl+WF2OnJiEASlWN7kI4b7gzZ1RYitpA9yBt1XutUJNgzdMqN834WyF+g+adG2uC7
E3Ahg4m7/Zh/HW2RYS+JXUKxB7S9UwFa/QHYSfbwMZ8oho9OnLbP1Snp2w4mEXdomkyf0ybzm/XC
5hmve+NsXQCFP9QnNYeG98bPk+n37R/zxldDjUB3GA==
=joMq
-----END PGP SIGNATURE-----

--------------lzKKkXpwCv50m0d63i7ucD9c--

--===============4959817673723384114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4959817673723384114==--
