Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6376A0C7D
	for <lists.virtualization@lfdr.de>; Thu, 23 Feb 2023 16:06:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4B7361AEC;
	Thu, 23 Feb 2023 15:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4B7361AEC
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ddv/eYPk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W3XP9MVQBNWy; Thu, 23 Feb 2023 15:05:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3AD5761AED;
	Thu, 23 Feb 2023 15:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD5761AED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85C55C0078;
	Thu, 23 Feb 2023 15:05:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F760C002B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 15:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BF89822CE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 15:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BF89822CE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=susede1 header.b=ddv/eYPk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ueJF0BEg6Or
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 15:05:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6351482294
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6351482294
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Feb 2023 15:05:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A31037BE8;
 Thu, 23 Feb 2023 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1677164752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hzt+KmbRmYD50QuIrUrIr0eNQM15RZBAeybpNzPctRI=;
 b=ddv/eYPk3LeMZHsARuXhO/iQMuLtyhQ+LtbAf2SMYuqZpiLOUuRJI1q06ftyojxAianH6m
 q0Urbeqp34qUPg12NPTJ/1/2jLjOg/IWwtMBGlgAv7dGiVdduTqpti5ITbJ8UuyvZpp8ex
 A4q4UVS68u4DHrt2lxUWEJCTZksWXVw=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF016139B5;
 Thu, 23 Feb 2023 15:05:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iKGXNM+A92OBMQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Feb 2023 15:05:51 +0000
Message-ID: <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>
Date: Thu, 23 Feb 2023 16:05:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] x86/paravirt: merge activate_mm and dup_mmap callbacks
Content-Language: en-US
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org
References: <20230207075902.7539-1-jgross@suse.com>
 <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
In-Reply-To: <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Alexey Makhalov <amakhalov@vmware.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
Content-Type: multipart/mixed; boundary="===============6409490216049038717=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6409490216049038717==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NFgl39nKHzDiUPhSDQlQTM8u"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NFgl39nKHzDiUPhSDQlQTM8u
Content-Type: multipart/mixed; boundary="------------eTVzWK2dtVujaZI7b6l05T8D";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux-foundation.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Message-ID: <2b4b0590-8327-3567-f4cd-e610d52fbf1c@suse.com>
Subject: Re: [PATCH v2] x86/paravirt: merge activate_mm and dup_mmap callbacks
References: <20230207075902.7539-1-jgross@suse.com>
 <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
In-Reply-To: <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>

--------------eTVzWK2dtVujaZI7b6l05T8D
Content-Type: multipart/mixed; boundary="------------B8Dze1D9ZqSOJ01Oq0nj7iwI"

--------------B8Dze1D9ZqSOJ01Oq0nj7iwI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDIuMjMgMjI6MDksIFNyaXZhdHNhIFMuIEJoYXQgd3JvdGU6DQo+IE9uIDIvNi8y
MyAxMTo1OSBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFRoZSB0d28gcGFyYXZpcnQg
Y2FsbGJhY2tzIC5tbXUuYWN0aXZhdGVfbW0gYW5kIC5tbXUuZHVwX21tYXAgYXJlDQo+PiBz
aGFyaW5nIHRoZSBzYW1lIGltcGxlbWVudGF0aW9ucyBpbiBhbGwgY2FzZXM6IGZvciBYZW4g
UFYgZ3Vlc3RzIHRoZXkNCj4+IGFyZSBwaW5uaW5nIHRoZSBQR0Qgb2YgdGhlIG5ldyBtbV9z
dHJ1Y3QsIGFuZCBmb3IgYWxsIG90aGVyIGNhc2VzDQo+PiB0aGV5IGFyZSBhIE5PUC4NCj4+
DQo+PiBJbiB0aGUgZW5kIGJvdGggY2FsbGJhY2tzIGFyZSBtZWFudCB0byByZWdpc3RlciBh
biBhZGRyZXNzIHNwYWNlIHdpdGgNCj4+IHRoZSB1bmRlcmx5aW5nIGh5cGVydmlzb3IsIHNv
IHRoZXJlIG5lZWRzIHRvIGJlIG9ubHkgYSBzaW5nbGUgY2FsbGJhY2sNCj4+IGZvciB0aGF0
IHB1cnBvc2UuDQo+Pg0KPj4gU28gbWVyZ2UgdGhlbSB0byBhIGNvbW1vbiBjYWxsYmFjayAu
bW11LmVudGVyX21tYXAgKGluIGNvbnRyYXN0IHRvIHRoZQ0KPj4gY29ycmVzcG9uZGluZyBh
bHJlYWR5IGV4aXN0aW5nIC5tbXUuZXhpdF9tbWFwKS4NCj4+DQo+PiBBcyB0aGUgZmlyc3Qg
cGFyYW1ldGVyIG9mIHRoZSBvbGQgY2FsbGJhY2tzIGlzbid0IHVzZWQsIGRyb3AgaXQgZnJv
bQ0KPj4gdGhlIHJlcGxhY2VtZW50IG9uZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4NCj4gDQo+IA0KPiBSZXZpZXdl
ZC1ieTogU3JpdmF0c2EgUy4gQmhhdCAoVk13YXJlKSA8c3JpdmF0c2FAY3NhaWwubWl0LmVk
dT4NCg0KeDg2IG1haW50YWluZXJzLCBJIHRoaW5rIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIGNh
cnJpZWQgdmlhIHRoZSB0aXAgdHJlZS4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------B8Dze1D9ZqSOJ01Oq0nj7iwI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------B8Dze1D9ZqSOJ01Oq0nj7iwI--

--------------eTVzWK2dtVujaZI7b6l05T8D--

--------------NFgl39nKHzDiUPhSDQlQTM8u
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP3gM8FAwAAAAAACgkQsN6d1ii/Ey+p
0AgAkFgCxYSr2aXRtl6/wIFPWgtskT4u9JW8PqapvCgS5jkwoWZXr0mKWsj+Lz37AgyAFWYhohlC
J1oWirtKROlOD4S5TWeZ99IyZtnUBJBWA7uzh21mJwF/XztKtj8SnpGANSZ1hR7UOFTzQpHslR4+
A1ZUplDdl9i/TT4jrml3kQ6CmyQN1twiVhPpzhp+n+h0/ErQ0P1qzTVeOu5HGf7chZhUlHUz8GJ3
7R2jDSij7OmrLDKBVNGYtYHdT7hxPUBsVqYDo4P2WyosJDAxE5UZ5owBELvsr0+/VLxJXCyHaVGS
XsgRjHIFgSGWP3wTHILbk7xbihRH5eMxPJ8kHq1wPQ==
=nMg1
-----END PGP SIGNATURE-----

--------------NFgl39nKHzDiUPhSDQlQTM8u--

--===============6409490216049038717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6409490216049038717==--
