Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 002D76B3698
	for <lists.virtualization@lfdr.de>; Fri, 10 Mar 2023 07:24:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDF5560B20;
	Fri, 10 Mar 2023 06:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDF5560B20
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=LRNsgfku
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFZeVv0pcCCl; Fri, 10 Mar 2023 06:24:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6726460AEE;
	Fri, 10 Mar 2023 06:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6726460AEE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89CA4C0089;
	Fri, 10 Mar 2023 06:24:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AE60C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 06:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0712A41151
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 06:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0712A41151
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=susede1 header.b=LRNsgfku
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MAJ1xD4e1MX
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 06:24:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 237B0400EA
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 237B0400EA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Mar 2023 06:24:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1DDF226DD;
 Fri, 10 Mar 2023 06:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678429457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o8lP7jcBLyhGrqPSMQBaFsjfgY/agrJPqmTdzxjBeXQ=;
 b=LRNsgfkuw/saxlLp4u9LAOmvi10CRVreMXMRlLsO7Hj1GJgcFZ2OTloSzkgqhY/m/clG6+
 SIbYUsyRYwYC++Bmd7TcTFwSel3fZVh5FFpFUIh7cawwThybh7W7lTuVzm1DmX5kh31nn/
 Kg5lBQ5TLtE5cFsNskoUJ46kbTB61Io=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99C4A134F7;
 Fri, 10 Mar 2023 06:24:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U0gYJBHNCmTtYQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Mar 2023 06:24:17 +0000
Message-ID: <e7e42a4b-cf0d-d6ad-2f66-0f52898e818a@suse.com>
Date: Fri, 10 Mar 2023 07:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] x86/paravirt: convert simple paravirt functions to asm
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
References: <20230308154210.18454-1-jgross@suse.com>
 <20230309133950.GDZAnhpnon5fk4Fg/X@fat_crate.local>
In-Reply-To: <20230309133950.GDZAnhpnon5fk4Fg/X@fat_crate.local>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Alexey Makhalov <amakhalov@vmware.com>,
 Thomas Gleixner <tglx@linutronix.de>
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
Content-Type: multipart/mixed; boundary="===============8305023303430109121=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8305023303430109121==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eox0B9bkaZ5uewweFWmZOYIf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eox0B9bkaZ5uewweFWmZOYIf
Content-Type: multipart/mixed; boundary="------------YOgKkC0T2GEL2c5kViSv0S72";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org,
 "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <e7e42a4b-cf0d-d6ad-2f66-0f52898e818a@suse.com>
Subject: Re: [PATCH] x86/paravirt: convert simple paravirt functions to asm
References: <20230308154210.18454-1-jgross@suse.com>
 <20230309133950.GDZAnhpnon5fk4Fg/X@fat_crate.local>
In-Reply-To: <20230309133950.GDZAnhpnon5fk4Fg/X@fat_crate.local>

--------------YOgKkC0T2GEL2c5kViSv0S72
Content-Type: multipart/mixed; boundary="------------SxhORv7i7BctHoocd7IS7xzV"

--------------SxhORv7i7BctHoocd7IS7xzV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDMuMjMgMTQ6MzksIEJvcmlzbGF2IFBldGtvdiB3cm90ZToNCj4gT24gV2VkLCBN
YXIgMDgsIDIwMjMgYXQgMDQ6NDI6MTBQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+IEFsbCBmdW5jdGlvbnMgcmVmZXJlbmNlZCB2aWEgX19QVl9JU19DQUxMRUVfU0FWRSgp
IG5lZWQgdG8gYmUgYXNzZW1ibGVyDQo+PiBmdW5jdGlvbnMsIGFzIHRob3NlIGZ1bmN0aW9u
cyBjYWxscyBhcmUgaGlkZGVuIGZyb20gZ2NjLiBJbiBjYXNlIHRoZQ0KPj4ga2VybmVsIGlz
IGNvbXBpbGVkIHdpdGggIi1memVyby1jYWxsLXVzZWQtcmVncyIgdGhlIGNvbXBpbGVyIHdp
bGwNCj4+IGNsb2JiZXIgY2FsbGVyLXNhdmVkIHJlZ2lzdGVycyBhdCB0aGUgZW5kIG9mIEMg
ZnVuY3Rpb25zLCB3aGljaCB3aWxsDQo+PiByZXN1bHQgaW4gdW5leHBlY3RlZGx5IHplcm9l
ZCByZWdpc3RlcnMgYXQgdGhlIGNhbGwgc2l0ZSBvZiB0aGUNCj4+IHJlbGF0ZWQgcGFyYXZp
cnQgZnVuY3Rpb25zLg0KPj4NCj4+IFJlcGxhY2UgdGhlIEMgZnVuY3Rpb25zIHdpdGggREVG
SU5FX1BBUkFWSVJUX0FTTSgpIGNvbnN0cnVjdHMgdXNpbmcNCj4+IHRoZSBzYW1lIGluc3Ry
dWN0aW9ucyBhcyB0aGUgcmVsYXRlZCBwYXJhdmlydCBjYWxscyBpbiB0aGUNCj4+IFBWT1Bf
QUxUX1tWXUNBTExFRSooKSBtYWNyb3MuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiAgIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmggfCAgOCArKysrKysrLQ0KPj4gICBhcmNoL3g4Ni9r
ZXJuZWwvcGFyYXZpcnQuYyAgICAgICAgICAgIHwgMjcgKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMjIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBSaWdodCwgd29ya3Mgd2l0aCBteSBwYXJ0aWN1bGFyIHJlcHJv
ZHVjZXIuDQo+IA0KPiBUdXJuaW5nIHRoZW0gaW50byBhc20gcHJldmVudHMgdGhlIGNvbXBp
bGVyIGZyb20gZG9pbmcgdGhlDQo+IGNhbGxlZS1jbG9iYmVyZWQgemVyb2luZyBhbmQgdGhh
dCdzIGZpbmUgYXMgdGhpcyB3aG9sZSBwYXJhdmlydCBndW5rIGlzDQo+IGhpZGluZyB0aGUg
IkNBTEwiIGluc24gZnJvbSBpdCBhbmQgeW91IHB1dHRpbmcgdGhlbSBpbiBhc20gaXMgaW4g
bGluZQ0KPiB3aXRoIHRoaXMuDQo+IA0KPiBBbmQgYSBuZWdhdGl2ZSBkaWZmc3RhdC4uDQo+
IA0KPiBTbyB5ZWFoLCBJJ2xsIHF1ZXVlIGl0IHNvb24gdW5sZXNzIHNvbWVvbmUgb2JqZWN0
cy4NCg0KVGhhbmtzLg0KDQo+IExvbmcgdGVybSwgSSB0aGluayB3ZSBzaG91bGQgY29udGlu
dWUgc3dpdGNoaW5nIGFsbCB0aGF0IHB2IHN0dWZmIHRvDQo+IHVzaW5nIHRoZSBhbHRlcm5h
dGl2ZXMuDQoNClRoZSAibm9ybWFsIiBjYXNlcyBub3QgdXNpbmcgYWx0ZXJuYXRpdmVzIHNo
b3VsZCByYXRoZXIgYmUgc3dpdGNoZWQgdG8NCnN0YXRpYyBjYWxscy4NCg0KV2hldGhlciBp
dCBpcyBwb3NzaWJsZSB0byBtaXggYSBzdGF0aWMgY2FsbCB3aXRoIGFsdGVybmF0aXZlcyBu
ZWVkcyB0bw0KYmUgZXZhbHVhdGVkLg0KDQoNCkp1ZXJnZW4NCg==
--------------SxhORv7i7BctHoocd7IS7xzV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------SxhORv7i7BctHoocd7IS7xzV--

--------------YOgKkC0T2GEL2c5kViSv0S72--

--------------eox0B9bkaZ5uewweFWmZOYIf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQKzREFAwAAAAAACgkQsN6d1ii/Ey9c
oAf6AidXjdl0B66qlmKTk97OI7cgYdGLZa7k2/7ET/mEkG3qhO5Rprmm3wESegWlka1vIAX23WpI
DrlUeHP/0RBN+7OnRxfXSVNG+nuKRsE8GhzEeZ6mABXULPgT3sylCuo+891uDNsu0ep1OzlCWptq
LQjkXAj89/EXk8yrK8aVeXXglrUz0wUu2/LnIRuUzHBNBq2W8GuLhBDSsp+d7ZjS3Jk+ObaD9SIK
SA38+wdKBj9037hH/wkgRBwVn/2tDlWJsHuuPRgOJeyt1chBUfk7sOf5GuUsN7cyYjgkCkjCT0zw
xwNPSu7vBpcJDcINtO/cDibXPH5tiQMXZ1CHgiMiKw==
=9yr7
-----END PGP SIGNATURE-----

--------------eox0B9bkaZ5uewweFWmZOYIf--

--===============8305023303430109121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8305023303430109121==--
