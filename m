Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A57196EE
	for <lists.virtualization@lfdr.de>; Thu,  1 Jun 2023 11:29:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2912B6151C;
	Thu,  1 Jun 2023 09:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2912B6151C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=EhqEWofQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dpW79pzFhaJ; Thu,  1 Jun 2023 09:29:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CEE8661516;
	Thu,  1 Jun 2023 09:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE8661516
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8AEBC0088;
	Thu,  1 Jun 2023 09:29:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61E8EC0029
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 09:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D6C842084
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 09:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6C842084
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=susede1 header.b=EhqEWofQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAFWoz2aRox0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 09:29:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12FF042082
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12FF042082
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 09:29:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CAFF82197D;
 Thu,  1 Jun 2023 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685611768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1q6Hag9Y9ezJD8WEei7X14aEA4bHQczpGjzWdaBKt1E=;
 b=EhqEWofQI4QLdklr7UjXb+QxTzRMSjgtTj/rX90Wcb9urlnkjzRJYwQ0ehWySAul1TMUY3
 ZVa+wO3K2bCjIITy2JJHB7EQClqAfXq3hJ0vXM0Xjxo9MX55tUC1EeEb7MHxUd2/oLFqVp
 wdYFV+lFV+2IA48wNgfrnJW28P439co=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 402AB13441;
 Thu,  1 Jun 2023 09:29:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A9PfDfhkeGT5JgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 01 Jun 2023 09:29:28 +0000
Message-ID: <44e2fb4d-151c-dba9-9cb8-0d99c3668a6f@suse.com>
Date: Thu, 1 Jun 2023 11:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
 <d0e601438f4d140c0c383c6ad09483b34c7c572e.1682673543.git.houwenlong.hwl@antgroup.com>
Subject: Re: [PATCH RFC 13/43] x86/paravirt: Use relative reference for
 original instruction
In-Reply-To: <d0e601438f4d140c0c383c6ad09483b34c7c572e.1682673543.git.houwenlong.hwl@antgroup.com>
Cc: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Garnier <thgarnie@chromium.org>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Lai Jiangshan <jiangshan.ljs@antgroup.com>,
 virtualization@lists.linux-foundation.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Alexey Makhalov <amakhalov@vmware.com>,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 Song Liu <song@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============4321155859971202782=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4321155859971202782==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pSEiQCQ0mMm06Gdi70dae9uE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pSEiQCQ0mMm06Gdi70dae9uE
Content-Type: multipart/mixed; boundary="------------g4h39aBPOJ2gKFz0pWZiXEwc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
Cc: Thomas Garnier <thgarnie@chromium.org>,
 Lai Jiangshan <jiangshan.ljs@antgroup.com>, Kees Cook
 <keescook@chromium.org>, "Srivatsa S. Bhat (VMware)"
 <srivatsa@csail.mit.edu>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Song Liu <song@kernel.org>,
 Nadav Amit <namit@vmware.com>, Arnd Bergmann <arnd@arndb.de>,
 virtualization@lists.linux-foundation.org
Message-ID: <44e2fb4d-151c-dba9-9cb8-0d99c3668a6f@suse.com>
Subject: Re: [PATCH RFC 13/43] x86/paravirt: Use relative reference for
 original instruction
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
 <d0e601438f4d140c0c383c6ad09483b34c7c572e.1682673543.git.houwenlong.hwl@antgroup.com>
In-Reply-To: <d0e601438f4d140c0c383c6ad09483b34c7c572e.1682673543.git.houwenlong.hwl@antgroup.com>

--------------g4h39aBPOJ2gKFz0pWZiXEwc
Content-Type: multipart/mixed; boundary="------------BHnx6M1xJVQ0UkCaAd7kFyC8"

--------------BHnx6M1xJVQ0UkCaAd7kFyC8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjMgMTE6NTAsIEhvdSBXZW5sb25nIHdyb3RlOg0KPiBTaW1pbGFyIHRvIHRo
ZSBhbHRlcm5hdGl2ZSBwYXRjaGluZywgdXNlIHJlbGF0aXZlIHJlZmVyZW5jZSBmb3Igb3Jp
Z2luYWwNCj4gaW5zdHJ1Y3Rpb24gcmF0aGVyIHRoYW4gYWJzb2x1dGUgb25lLCB3aGljaCBz
YXZlcyA4IGJ5dGVzIGZvciBvbmUgZW50cnkNCj4gb24geDg2XzY0LiAgQW5kIGl0IGNvdWxk
IGdlbmVyYXRlIFJfWDg2XzY0X1BDMzIgcmVsb2NhdGlvbiBpbnN0ZWFkIG9mDQo+IFJfWDg2
XzY0XzY0IHJlbG9jYXRpb24sIHdoaWNoIGFsc28gcmVkdWNlcyByZWxvY2F0aW9uIG1ldGFk
YXRhIG9uDQo+IHJlbG9jYXRhYmxlIGJ1aWxkcy4gQW5kIHRoZSBhbGlnbm1lbnQgY291bGQg
YmUgaGFyZCBjb2RlZCB0byBiZSA0IG5vdy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhvdSBX
ZW5sb25nIDxob3V3ZW5sb25nLmh3bEBhbnRncm91cC5jb20+DQo+IENjOiBUaG9tYXMgR2Fy
bmllciA8dGhnYXJuaWVAY2hyb21pdW0ub3JnPg0KPiBDYzogTGFpIEppYW5nc2hhbiA8amlh
bmdzaGFuLmxqc0BhbnRncm91cC5jb20+DQo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNo
cm9taXVtLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4NCg0KSSB0aGluayB0aGlzIHBhdGNoIHNob3VsZCBiZSB0YWtlbiBldmVuIHdpdGhv
dXQgdGhlIHNlcmllcy4NCg0KDQpKdWVyZ2VuDQo=
--------------BHnx6M1xJVQ0UkCaAd7kFyC8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BHnx6M1xJVQ0UkCaAd7kFyC8--

--------------g4h39aBPOJ2gKFz0pWZiXEwc--

--------------pSEiQCQ0mMm06Gdi70dae9uE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmR4ZPcFAwAAAAAACgkQsN6d1ii/Ey/L
xQf+LbM8IPP3DJKBcK6W3cCmFt4AlrbDw8VTxSwHOvNCtQz3E4QuAIjEuUeXndxbiUJZCKpf1uAj
3qwWfYeUrvvUL06TnpQ5ElyG6fLV+Qwb5Iny3U49bXUt0zslh7AGWq4wfIlILBK/292MYyfok8jl
bAn/LbOX5TUK8Sf3mTjY45wqPaD8X0/8GQhHm1nRuMCxqHfoSmeWWoFvYiacqwRmLP0CHDF9f8iH
BMRmfHWOxHUj+68AbsyZcG9QFif4f4L90EegSgSCNSuDZrAarS8FlHWPEGftSlgeGLGRy3+xhd5v
vV/1A9ovHy0PA8xWaveXsXf5JzhTJxp78tklG0jdPA==
=PHGb
-----END PGP SIGNATURE-----

--------------pSEiQCQ0mMm06Gdi70dae9uE--

--===============4321155859971202782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4321155859971202782==--
