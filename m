Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5F4463B5
	for <lists.virtualization@lfdr.de>; Fri,  5 Nov 2021 14:00:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C920080CBF;
	Fri,  5 Nov 2021 13:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rhLKp9afXUsR; Fri,  5 Nov 2021 13:00:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9448B81ABB;
	Fri,  5 Nov 2021 13:00:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20635C0036;
	Fri,  5 Nov 2021 13:00:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B88B6C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 13:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA3C403C3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 13:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="bPiprZL7";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="IfMsFqCr"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gws8d4XiYf7J
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 13:00:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C60B4401B3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 13:00:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B7DA1FD37;
 Fri,  5 Nov 2021 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636117224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjnWxrfIUbkoahv7XQ0mkb34rkKEwu9iva4UCkL/Uzg=;
 b=bPiprZL7ZmOGy19QX38+b3CTSqukbvtVs7Vm/0Nri2gFsnOe7o3J1Fm5G0ZxkoWXWnUTWg
 IhzcWTycRQuQUd0P6DORk4mL9rUqPZrEplLxKBsgiGVNco+WljjyXrf0iUoA9YvZ9fDFrY
 iS7hYeOotlWPV9Ci6pdRs3fSdRO/QPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636117224;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tjnWxrfIUbkoahv7XQ0mkb34rkKEwu9iva4UCkL/Uzg=;
 b=IfMsFqCr6sUCPSpglCxZkkSTgHKZvB1Ud/VZGbn0cgD9RbqCNc+1ibpn5U3rQtcn3n2apN
 z++YZEXDZCUBU+Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AEE0914004;
 Fri,  5 Nov 2021 13:00:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6AK1KecqhWF4WAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Nov 2021 13:00:23 +0000
Message-ID: <7de8c495-7e01-98f9-71c7-9168d51733c3@suse.de>
Date: Fri, 5 Nov 2021 14:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87ilx7ae3v.fsf@intel.com>
 <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
 <d4a64906-69e5-3250-2362-79f2afac0a23@suse.de>
 <38dbcc8f-2f95-6846-537f-9b85468bfa87@redhat.com> <877ddmapfj.fsf@intel.com>
 <335a9e0f-cce9-480b-10e0-bd312b81e587@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <335a9e0f-cce9-480b-10e0-bd312b81e587@redhat.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 amd-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============7241332361024075457=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7241332361024075457==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------amYHNBfM0Vfmgj2bbPw0MP1t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------amYHNBfM0Vfmgj2bbPw0MP1t
Content-Type: multipart/mixed; boundary="------------NVDuFp0u3pp2xWcJiJ7yN6Es";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, virtualization@lists.linux-foundation.org,
 intel-gfx@lists.freedesktop.org, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Peter Robinson <pbrobinson@gmail.com>
Message-ID: <7de8c495-7e01-98f9-71c7-9168d51733c3@suse.de>
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87ilx7ae3v.fsf@intel.com>
 <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
 <d4a64906-69e5-3250-2362-79f2afac0a23@suse.de>
 <38dbcc8f-2f95-6846-537f-9b85468bfa87@redhat.com> <877ddmapfj.fsf@intel.com>
 <335a9e0f-cce9-480b-10e0-bd312b81e587@redhat.com>
In-Reply-To: <335a9e0f-cce9-480b-10e0-bd312b81e587@redhat.com>

--------------NVDuFp0u3pp2xWcJiJ7yN6Es
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTEuMjEgdW0gMTM6MDAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDExLzUvMjEgMTE6MDQsIEphbmkgTmlrdWxhIHdyb3RlOg0KPj4gT24g
RnJpLCAwNSBOb3YgMjAyMSwgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJl
ZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gW3NuaXBdDQo+IA0KPj4+DQo+Pj4gRG8geW91IGVu
dmlzaW9uIG90aGVyIGNvbmRpdGlvbiB0aGF0IGNvdWxkIGJlIGFkZGVkIGxhdGVyIHRvIGRp
c2FibGUgYQ0KPj4+IERSTSBkcml2ZXIgPyBPciBkbyB5b3UgdGhpbmsgdGhhdCBqdXN0IGZy
b20gYSBjb2RlIHJlYWRhYmlsaXR5IHBvaW50IG9mDQo+Pj4gdmlldyBtYWtlcyB3b3J0aCBp
dCA/DQo+Pg0KPj4gVGFraW5nIGEgc3RlcCBiYWNrIGZvciBwZXJzcGVjdGl2ZS4NCj4+DQo+
PiBJIHRoaW5rIHRoZXJlJ3MgYnJvYWQgY29uc2Vuc3VzIGluIG1vdmluZyB0aGUgcGFyYW1l
dGVyIHRvIGRybSwgbmFtaW5nDQo+PiB0aGUgY2hlY2sgZnVuY3Rpb24gdG8gZHJtX3NvbWV0
aGluZ19zb21ldGhpbmcoKSwgYW5kIGJyZWFraW5nIHRoZSB0aWVzDQo+PiB0byBDT05GSUdf
VkdBX0NPTlNPTEUuIEkgYXBwcmVjaWF0ZSB0aGUgd29yayB5b3UncmUgZG9pbmcgdG8gdGhh
dA0KPj4gZWZmZWN0Lg0KPj4NCj4gDQo+IFRoYW5rcywgSSBhcHByZWNpYXRlIHlvdXIgZmVl
ZGJhY2sgYW5kIGNvbW1lbnRzLg0KPiAgIA0KPj4gSSB0aGluayBldmVyeXRoaW5nIGJleW9u
ZCB0aGF0IGlzIHN0aWxsIGEgYml0IHZhZ3VlIGFuZC9vcg0KPj4gY29udGVudGlvdXMuIFNv
IGhvdyBhYm91dCBtYWtpbmcgdGhlIGZpcnN0IDItMyBwYXRjaGVzIGp1c3QgdGhhdD8NCj4+
IFNvbWV0aGluZyB3ZSBjYW4gYWxsIGFncmVlIG9uLCBtYWtlcyBnb29kIHByb2dyZXNzLCBp
bXByb3ZlcyB0aGUga2VybmVsLA0KPj4gYW5kIGdpdmVzIHVzIHNvbWV0aGluZyB0byBidWls
ZCBvbj8NCj4+DQo+IA0KPiBUaGF0IHdvcmtzIGZvciBtZS4gVGhvbWFzLCBkbyB5b3UgYWdy
ZWUgd2l0aCB0aGF0IGFwcHJvYWNoID8NCg0KU3VyZS4gSSB0aGluayB0aGF0J3MgbW9yZSBv
ciBsZXNzIHdoYXQgSSBwcm9wb3NlZCBpbiBteSByZXBseSB0byB0aGF0IG1haWwuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICANCj4gQmVzdCByZWdhcmRzLA0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------NVDuFp0u3pp2xWcJiJ7yN6Es--

--------------amYHNBfM0Vfmgj2bbPw0MP1t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGFKucFAwAAAAAACgkQlh/E3EQov+D0
uhAA0c8ZNQjbRr9n35QT+n1kfE+lZxXxUOp1XdNRH0W7s0yH8txdHGLC53BqYEf4ZZ6cM8gKXu3X
KRnWqhQ88nbFRkEuoC0oHXbzl4er1Y5Fnu/4HsxVBLHTNqAEIFnaN/K0xc2WFRFju9IvyQtiVkq4
gW327uTSQVJ8Fuhy9Ry5Uf4+qSGFhYtb0+W0WvQvejYpyZT7BaXiQdxIk5avSLFF6imFGdS5RRgA
rUUE0xCBday57ZrDMviBfayQybH0ErVyKDE21EgFmSp7ny2I+Ra5XNkKjPrn0BR+SCGmlV8bKfeC
WfUJCOhiDPC2Z2sPnDGoh5ItyCaEO4NtCpTRAh+yoS8BdpTLyTd3wp1NqdA9jc9xPRAAE5ghfbkQ
Z4OvLJYlezxwzTR/FC5gPL1YJQsEolhVW4iOGGspCWx1VzJAkY6PQV47s8GHuH/f/oedcuyDQzNn
GJbk9ZPNuJfw09KGl0BtpAVALVV0xYsnkxUr8RFW8qsJv5RJfZHwLwWrS/+3un8UEsgjL91bXJ8q
zyCTj79SFduvJyIHyihlZFa5NWPwsY+qSb0yic9968LvKlY7OI1JnLZ5/UokVtbXPizSFJGS1tsz
sFk1ZB+FP63bCOxw+wgoOij6E486p90t9BMHSI0V/RMjT6eqG1/nbyDPqGXZNg95xodHrqH/dS5+
tlA=
=R/av
-----END PGP SIGNATURE-----

--------------amYHNBfM0Vfmgj2bbPw0MP1t--

--===============7241332361024075457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============7241332361024075457==--
