Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DCD30DD75
	for <lists.virtualization@lfdr.de>; Wed,  3 Feb 2021 16:03:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 91EFF203F4;
	Wed,  3 Feb 2021 15:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdlrdoW6Hk9y; Wed,  3 Feb 2021 15:03:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3B1F220378;
	Wed,  3 Feb 2021 15:03:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A858EC0FA7;
	Wed,  3 Feb 2021 15:03:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F719C0FA7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 15:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6C84286372
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 15:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jg9TWcLnoljr
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 15:03:16 +0000 (UTC)
X-Greylist: delayed 00:05:33 by SQLgrey-1.7.6
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A392A80BF7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 15:03:16 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 63so169478oty.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 03 Feb 2021 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ZL9uDG9hCZio3nvkP5mu9jOjZiaKTEj1vAti3dTfu8=;
 b=B3uksihFnHlcwXZiZ3JsV1Q1em1Zz+h5Ra7rvpKAqvxbRWXaXdNPGnE6UHR0YxJzD4
 wHlyf50FNxQCg0GhIiAzF5Be01VF2VwBdCtA0oJVxvriNu+bIFwfkQIrcDWjgCtlewI0
 aprFTjwUSCmBSxL0znvrul8wum5se2mUcQfok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ZL9uDG9hCZio3nvkP5mu9jOjZiaKTEj1vAti3dTfu8=;
 b=cwiQuUbBJqLizZaD0Ro8UB+G9O55EWvhm8IsbFgstHGIHXX4A/6sKhm0oTzCLJky+G
 Z7R0YHgt4OGyiFkQu3xdA3z/dHSGp6zQi07tuCf6As/hfCP6Q0eXIxKuNvQLvB01sDUA
 rrNTej2OFmFOMXA5NDAy4pbJ4PET5eJr+dDbABEG45mRgQzLyCPNt86na4fNMn14n+FH
 iA0jgmez9fyh627hMpUnaWUgsS0QYPtel2ZGDIkdPw/RbQr5xsh8EMtunxt4FdJlkEMn
 xFf2gMfpvRep2pB90kPnAZPce0HK0qljz+LYeAhdQzkoXcRy84tZaH0xGq0g/FNMNNaP
 1MQg==
X-Gm-Message-State: AOAM533ybSgk4UIqx2Z48V5FUbPUB5o+OF8N7mr5tPSj5y8eaDPzq+AC
 PK3JHgrN+6JKEaVM1Nhkz4zOW0v+mr6IicJ5ITRTTHhUk8Gy5A==
X-Google-Smtp-Source: ABdhPJxHKqODnjdpniSiZhb4YCL04Z2nrm6hpqBSSL59lqOPlWrFin+KNDJK/UtvyDbNAcKlI/NI8Ni/R65stjTafdM=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr2247932otr.303.1612364262350; 
 Wed, 03 Feb 2021 06:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20210203131046.22371-1-tzimmermann@suse.de>
 <20210203131046.22371-3-tzimmermann@suse.de>
 <YBqsvhIROEVLnC2L@phenom.ffwll.local>
 <03fd24e8-2133-9b78-ae3b-d297ab9472b4@suse.de>
In-Reply-To: <03fd24e8-2133-9b78-ae3b-d297ab9472b4@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 Feb 2021 15:57:31 +0100
Message-ID: <CAKMK7uEY-SQ1f+JjMzbPfG5M19deN_0k9-_OytG6s1hdGi729w@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/shmem-helper: Add additional KMS helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBGZWIgMywgMjAyMSBhdCAzOjI2IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwMy4wMi4yMSB1bSAxNTowMSBzY2hy
aWViIERhbmllbCBWZXR0ZXI6Cj4gPiBPbiBXZWQsIEZlYiAwMywgMjAyMSBhdCAwMjoxMDo0MlBN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPiA+PiBTZXZlcmFsIGRyaXZlcnMgdXNl
IEdFTSBTSE1FTSBidWZmZXIgb2JqZWN0cyBhcyBzaGFkb3cgYnVmZmVycyBmb3IKPiA+PiB0aGUg
YWN0dWFsIGZyYW1lYnVmZmVyIG1lbW9yeS4gUmlnaHQgbm93LCBkcml2ZXJzIGRvIHRoZXNlIHZt
YXAKPiA+PiBvcGVyYXRpb25zIGluIHRoZWlyIGNvbW1pdCB0YWlsLCB3aGljaCBpcyBhY3R1YWxs
eSBub3QgYWxsb3dlZCBieSB0aGUKPiA+PiBsb2NraW5nIHJ1bGVzIGZvciB0aGUgZG1hLWJ1ZiBy
ZXNlcnZhdGlvbiBsb2NrLiBUaGUgaW52b2x2ZWQgU0hNRU0KPiA+PiBCTyBoYXMgdG8gYmUgdm1h
cHBlZCBpbiB0aGUgcGxhbmUncyBwcmVwYXJlX2ZiIGNhbGxiYWNrIGFuZCB2dW5tYXBwZWQKPiA+
PiBpbiBjbGVhbnVwX2ZiLgo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgRFJNIGxp
YnJhcnkgdGhhdCBpbXBsZW1lbnRzIEtNUyBoZWxwZXJzIGZvcgo+ID4+IEdFTSBTSE1FTSBidWZm
ZXIgb2JqZWN0cy4gVGhlIGZpcnN0IHNldCBvZiBoZWxwZXJzIGlzIHRoZSBwbGFuZSBzdGF0ZQo+
ID4+IGZvciBzaGFkb3cgcGxhbmVzLiBUaGUgcHJvdmlkZWQgaW1wbGVtZW50YXRpb25zIGZvciBw
cmVwYXJlX2ZiIGFuZAo+ID4+IGNsZWFudXBfZmIgdm1hcCBhbmQgdnVubWFwIGFsbCBCT3Mgb2Yg
c3RydWN0IGRybV9wbGFuZV9zdGF0ZS5mYi4gVGhlCj4gPj4gbWFwcGluZ3MgYXJlIGFmdGVyd2Fy
ZHMgYXZhaWxhYmxlIGluIHRoZSBwbGFuZSdzIGNvbW1pdC10YWlsIGZ1bmN0aW9ucy4KPiA+Pgo+
ID4+IEFsbCByc3AgZHJpdmVycyB1c2UgdGhlIHNpbXBsZSBLTVMgaGVscGVycywgc28gd2UgYWRk
IHRoZSBwbGFuZSBjYWxsYmFja3MKPiA+PiBhbmQgd3JhcHBlcnMgZm9yIHNpbXBsZSBLTVMuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICB8ICAgNyArCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgfCAgIDEgKwo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1fa21z
X2hlbHBlci5jIHwgMTU5ICsrKysrKysrKysrKysrKysrKysrKwo+ID4+ICAgaW5jbHVkZS9kcm0v
ZHJtX2dlbV9zaG1lbV9rbXNfaGVscGVyLmggICAgIHwgIDU2ICsrKysrKysrCj4gPj4gICA0IGZp
bGVzIGNoYW5nZWQsIDIyMyBpbnNlcnRpb25zKCspCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1fa21zX2hlbHBlci5jCj4gPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vZHJtX2dlbV9zaG1lbV9rbXNfaGVscGVyLmgKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2Ry
bS9LY29uZmlnCj4gPj4gaW5kZXggOGJmMTAzZGUxNTk0Li5iOGQ4YjAwYWI1ZDQgMTAwNjQ0Cj4g
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vS2NvbmZpZwo+ID4+IEBAIC0yMTQsNiArMjE0LDEzIEBAIGNvbmZpZyBEUk1fR0VNX1NITUVN
X0hFTFBFUgo+ID4+ICAgICAgaGVscAo+ID4+ICAgICAgICBDaG9vc2UgdGhpcyBpZiB5b3UgbmVl
ZCB0aGUgR0VNIHNobWVtIGhlbHBlciBmdW5jdGlvbnMKPiA+Pgo+ID4+ICtjb25maWcgRFJNX0dF
TV9TSE1FTV9LTVNfSEVMUEVSCj4gPj4gKyAgICBib29sCj4gPj4gKyAgICBkZXBlbmRzIG9uIERS
TV9HRU1fU0hNRU1fSEVMUEVSCj4gPj4gKyAgICBoZWxwCj4gPj4gKyAgICBoZWxwCj4gPj4gKyAg
ICAgIENob29zZSB0aGlzIGlmIHlvdSBuZWVkIHRoZSBHRU0gU0hNRU0gaGVscGVyIGZ1bmN0aW9u
cyBmb3IgS01TCj4gPgo+ID4gSSB0aGluayB3ZSBzaG91bGQganVzdCBzdHVmZiB0aGlzIGludG8g
c2ltcGxlIHBpcGUgaGVscGVycyBkaXJlY3RseS4gQWxzbwo+ID4gbmVlZHMgc29tZSBrZXJuZWxk
b2MgYW5kIGlkZWFsbHkgaW50cm8gc2VjdGlvbiBvZiBzb21lIHNvcnRzLCBidXQgSSBndWVzcwo+
ID4gdGhhdCB3YXMganVzdCBtaXNzaW5nIGZvciBSRkMuCj4KPiBUaGUgbWlzc2luZyBkb2NzIGlz
IHdoeSBpdCdzIGFuIFJGQy4gaSB3YXMgY29uY2VybmVkIGFib3V0IHRoZQo+IGFkZGl0aW9uYWwg
c2ltcGxlLXBpcGUgY2FsbGJhY2tzLCBidXQgSSdtIGdsYWQgeW91J3JlIE9LIHdpdGggdGhlbS4g
SQo+IHRob3VnaHQgYWJvdXQgc2ltcGxlX3BpcGUgc3RhdGUgKGFzIHlvdSBtZW50aW9uZWQgYmVs
b3cpIG9yCj4gZHJtX3ByaXZhdGVfc3RhdGUsIGJ1dCBmb3VuZCBpdCBhbGwgdG9vIGNvbXBsZXgg
Zm9yIHRoaXMgc2ltcGxlIHByb2JsZW0uCgpZZWFoIEkgdGhpbmsgZm9yIHRoaXMgaXQncyBvdmVy
a2lsbCwgYW5kIGl0IHNob3VsZG4ndCBiZSBoYXJkIHRvIGFkZCBhCnNpbXBsZV9waXBlX3N0YXRl
IGxhdGVyIG9uLiBJbW8gb25jZSB5b3UgbmVlZCBhIHByaXZhdGUgc3RhdGUgeW91cgpkcml2ZXIg
aGFzIHByb2FibHkgb3V0Z3Jvd24gc2ltcGxlIHBpcGUgaGVscGVycy4KCj4gPiBUaGlua2luZyBh
IGJpdCBiaWdnZXIgYW5kIGxvb2tpbmcgYXQgdGhlIGZpcnN0IHBhdGNoLCBJIHdvbmRlciB3aGV0
aGVyIHdlCj4gPiBzaG91bGRuJ3Qgb3V0cmlnaHQgaW50ZWdyYXRlIHRoaXMgc2ltcGxlIHBpcGUg
aGVscGVycy4gQWRkaW5nIGFsbCB0aGUKPiA+IGhvb2tzIGZvciBwbGFuZV9zdGF0ZSAoaW5zdGVh
ZCBvZiBhIHNpbXBsZV9waXBlX3N0YXRlIG9yIHNvbWV0aGluZyBsaWtlCj4gPiB0aGF0KSBmZWVs
cyBhIGJpdCBpY2t5IHRvIG1lLiBCdXQgb24gdGhlIGRyaXZlciBzaWRlIHRoZSBpbnRlZ3JhdGlv
biB3aXRoCj4gPiBqdXN0IHRoZSBzaW5nbGUgbWFjcm8gbGluZSBpcyB2ZXJ5IG5lYXQsIHNvIHRo
YXQncyByZWRlZW1pbmcgZmVhdHVyZS4KPgo+IEkgZG8gZGlzYWdyZWUgd2l0aCBpbnRlZ3JhdGlu
ZyB0aGUgc2hhZG93LXBsYW5lIGNvZGUgaW50byBzaW1wbGUtcGlwZS4KPiBSaWdodCBub3cgaXQn
cyBTSE1FTS1kZXBlbmRlZCBhbmQgQ01BLWJhc2VkIHNpbXBsZS1waXBlIGRyaXZlcnMgd291bGQK
PiBwcm9iYWJseSBub3Qgd2FudCB0byBkZXBlbmQgb24gdGhpcy4gVGhlIG90aGVyIHJlYXNvbiBp
cyB0aGF0IEkgY2FuCj4gY2VydGFpbmx5IGdlbmVyYWxpemUgdGhlIHNoYWRvdyBwbGFuZXMgYXdh
eSBmcm9tIFNITUVNIGhlbHBlcnM7IGFuZCB1c2UKPiB0aGVtIGZvciB0aGVzZSB2Ym94IGFuZCBh
c3QgcGF0Y2hzZXRzIGFzIHdlbGwuIFRoZXNlIGRyaXZlcnMgdXNlIFZSQU0KPiBoZWxwZXJzIGFu
ZCBmdWxsIEtNUyBoZWxwZXJzLiBJIGd1ZXNzIHNoYWRvdyBwbGFuZXMgY291bGQgdGhlbiBiZSBt
b3ZlZAo+IGludG8gZHJtX2dlbV9mcmFtZWJ1ZmZlci5jLiBUaGVyZSdzIG90aGVyIHBsYW5lLWhl
bHBlciBjb2RlIHRoZXJlIGFscmVhZHkuCj4KPiBVbmZvcnR1bmF0ZWx5LCBJIG9ubHkgcmVhbGl6
ZWQgdGhpcyBhZnRlciBzZW5kaW5nIG91dCB0aGUgcGF0Y2ggc2V0LiA6KQoKWWVhaCBJIGFsc28g
bm90aWNlZCB3ZSBoYXZlIHRoZSBjdXJyZW50IHNpbXBsZSBnZW0gZmIgaGVscGVyIGluIHRoZXJl
CmFscmVhZHksIHNvIG1heWJlIGp1c3Qgc3R1ZmYgaXQgaW4gdGhlcmUuIFdoZXRoZXIgdGhlIHNp
bXBsZSBnbHVlIGZvcgpzaG1lL2dlbS9jbWEvd2hhdGV2ZXIgaW50ZWdyYXRpb24gaXMgaW4gZHJt
X3NpbXBsZV9waXBlLmMgb3IKZHJtX2dlbV9mcmFtZWJ1ZmZlci5jIGtpbmRhIGRvZXNuJ3QgbWF0
dGVyIG11Y2guIEp1c3QgeWV0IGFub3RoZXIKbGlicmFyeSBmZWx0IGEgYml0IGxpa2Ugb3Zlcmtp
bGwuCgpDaGVlcnMsIERhbmllbAoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4gPgo+ID4g
Tm90ZSBkb2luZyBhIGRybV9zaW1wbGVfZGlzcGxheV9waXBlX3N0YXRlIHdvdWxkIGJlIGEgYml0
IHRyaWNreSB0byBkbywKPiA+IHNpbmNlIHdlJ2QgbmVlZCBjdXN0b21lIGR1cGxpY2F0ZV9zdGF0
ZSBmdW5jdGlvbnMgdG8gbWFrZSBzdXJlIHRoZXJlJ3MKPiA+IG9ubHkgZXZlciBleGFjdGx5IG9u
ZToKPiA+Cj4gPiBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfc3RhdGUgewo+ID4gICAg
ICAgc3RydWN0IGRybV9jcnRjX3N0YXRlIGNydGNfc3RhdGU7Cj4gPiAgICAgICBzdHJ1Y3QgZHJt
X3BsYW5lX3N0YXRlIHBsYW5lX3N0YXRlOwo+ID4KPiA+ICAgICAgIHN0cnVjdCBkbWFfYnVmX21h
cCBtYXBbNF07Cj4gPiB9Owo+ID4KPiA+IEJ1dCB0aGF0J3MgYSBiaXQgYSBiaWdnZXIgc3RlcCwg
bWF5YmUgd2hlbiB3ZSBhbHNvIG5lZWQgdG8gc3ViY2xhc3MgY3J0Ywo+ID4gc3R1ZmYgd2UgY2Fu
IGxvb2sgaW50byB0aGlzLiBPciBtYXliZSB0aGF0J3MgdGhlbiB0b28gbXVjaCBmZWF0dXJlIGNy
ZWVwLAo+ID4gZHVubm8uIEltcGxlbWVuYXRpb24gc2hvdWxkbid0IGJlIHRvbyB0cmlja3k6Cj4g
PiAtIGNydGMgc3RhdGUganVzdCBkdXBsaWNhdGVzIGl0c2VsZiAoaW5jbHVkaW5nIHBsYW5lX3N0
YXRlIGR1cGxpY2F0aW9uKS4KPiA+ICAgIEluIHJlbGVhc2UgaXQgYWxzbyBjbGVhbnMgdXAgdGhl
IHBsYW5lIHN0YXRlLgo+ID4gLSBwbGFuZSBzdGF0ZSBncmFicyB0aGUgY3J0YyBzdGF0ZSBpbnN0
ZWFkLCBhbmQgdGhlbiBkb2VzIGEgY2FzdC4gZGVzdHJveQo+ID4gICAgaG9vayBkb2VzIG5vdGhp
bmcgKHRvIGF2b2lkIHRvdWNoaW5nIGZyZWVkIG1lbW9yeSwgc2luY2Ugd2UgYWx3YXlzIGR1cGUK
PiA+ICAgIHRoZSBjcnRjIHN0YXRlIHdoZW4gdGhlIHBsYW5lIHN0YXRlIGV4aXN0cyB3ZSBrbm93
IHRoZSBjcnRjIGRlc3Ryb3kgaG9vawo+ID4gICAgd2lsbCBjbGVhbiB0aGluZ3MgdXApLgo+ID4K
PiA+IFRoYXQgbWVhbnMgZHJtX2F0b21pY19zdGF0ZSBoYXMgMiBwb2ludGVycyBwb2ludGluZyBp
bnRvIHRoZSBzYW1lCj4gPiBhbGxvY2F0aW9uLCBidXQgdGhhdCBzaG91bGQgYmUgYWxsIGZpbmUu
Cj4gPgo+ID4gQXNpZGUgZnJvbSB0aGlzIGJpa2VzaGVkIGhlcmUgcG9uZGVyaW5nIGEgYml0IGhv
dyB0aGlzIGJlc3QgZmlyc3QgaW50byBvdXIKPiA+IHNpbXBsZSBwaXBlIGhlbHBlcnMgSSB0aGlu
ayB0aGlzIGFsbCBsb29rcyB2ZXJ5IGNsZWFuLgo+ID4gLURhbmllbAo+ID4KPiA+PiArCj4gPj4g
ICBjb25maWcgRFJNX1NDSEVECj4gPj4gICAgICB0cmlzdGF0ZQo+ID4+ICAgICAgZGVwZW5kcyBv
biBEUk0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlIGIvZHJpdmVy
cy9ncHUvZHJtL01ha2VmaWxlCj4gPj4gaW5kZXggOTI2YWRlZjI4OWRiLi4zN2E3M2RlZTViYWYg
MTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlCj4gPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL01ha2VmaWxlCj4gPj4gQEAgLTUzLDYgKzUzLDcgQEAgZHJtX2ttc19oZWxw
ZXItJChDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTikgKz0gZHJtX2ZiX2hlbHBlci5vCj4gPj4g
ICBkcm1fa21zX2hlbHBlci0kKENPTkZJR19EUk1fS01TX0NNQV9IRUxQRVIpICs9IGRybV9mYl9j
bWFfaGVscGVyLm8KPiA+PiAgIGRybV9rbXNfaGVscGVyLSQoQ09ORklHX0RSTV9EUF9BVVhfQ0hB
UkRFVikgKz0gZHJtX2RwX2F1eF9kZXYubwo+ID4+ICAgZHJtX2ttc19oZWxwZXItJChDT05GSUdf
RFJNX0RQX0NFQykgKz0gZHJtX2RwX2NlYy5vCj4gPj4gK2RybV9rbXNfaGVscGVyLSQoQ09ORklH
X0RSTV9HRU1fU0hNRU1fS01TX0hFTFBFUikgKz0gZHJtX2dlbV9zaG1lbV9rbXNfaGVscGVyLm8K
PiA+Pgo+ID4+ICAgb2JqLSQoQ09ORklHX0RSTV9LTVNfSEVMUEVSKSArPSBkcm1fa21zX2hlbHBl
ci5vCj4gPj4gICBvYmotJChDT05GSUdfRFJNX0RFQlVHX1NFTEZURVNUKSArPSBzZWxmdGVzdHMv
Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2ttc19oZWxw
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2ttc19oZWxwZXIuYwo+ID4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMDAwMDAwLi44ODQzYzU4MzdmOTgK
PiA+PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2ht
ZW1fa21zX2hlbHBlci5jCj4gPj4gQEAgLTAsMCArMSwxNTkgQEAKPiA+PiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+PiArCj4gPj4gKyNpbmNsdWRlIDxkcm0vZHJtX2F0
b21pY19zdGF0ZV9oZWxwZXIuaD4KPiA+PiArI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVm
ZmVyX2hlbHBlci5oPgo+ID4+ICsjaW5jbHVkZSA8ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmg+
Cj4gPj4gKyNpbmNsdWRlIDxkcm0vZHJtX2dlbV9zaG1lbV9rbXNfaGVscGVyLmg+Cj4gPj4gKyNp
bmNsdWRlIDxkcm0vZHJtX3NpbXBsZV9rbXNfaGVscGVyLmg+Cj4gPj4gKwo+ID4+ICsvKgo+ID4+
ICsgKiBIZWxwZXJzIGZvciBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzCj4gPj4gKyAqCj4gPj4gKyAq
Lwo+ID4+ICsKPiA+PiArc3RhdGljIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKgo+ID4+ICtkcm1f
Z2VtX3NobWVtX2R1cGxpY2F0ZV9zaGFkb3dfcGxhbmVfc3RhdGUoc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQo+ID4+ICt7Cj4gPj4gKyAgICBzdHJ1Y3Qg
ZHJtX2dlbV9zaG1lbV9zaGFkb3dfcGxhbmVfc3RhdGUgKm5ld19zaGFkb3dfcGxhbmVfc3RhdGU7
Cj4gPj4gKwo+ID4+ICsgICAgaWYgKCFwbGFuZV9zdGF0ZSkKPiA+PiArICAgICAgICAgICAgcmV0
dXJuIE5VTEw7Cj4gPj4gKwo+ID4+ICsgICAgbmV3X3NoYWRvd19wbGFuZV9zdGF0ZSA9IGt6YWxs
b2Moc2l6ZW9mKCpuZXdfc2hhZG93X3BsYW5lX3N0YXRlKSwgR0ZQX0tFUk5FTCk7Cj4gPj4gKyAg
ICBpZiAoIW5ld19zaGFkb3dfcGxhbmVfc3RhdGUpCj4gPj4gKyAgICAgICAgICAgIHJldHVybiBO
VUxMOwo+ID4+ICsgICAgX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9kdXBsaWNhdGVfc3RhdGUo
cGxhbmUsICZuZXdfc2hhZG93X3BsYW5lX3N0YXRlLT5iYXNlKTsKPiA+PiArCj4gPj4gKyAgICBy
ZXR1cm4gJm5ld19zaGFkb3dfcGxhbmVfc3RhdGUtPmJhc2U7Cj4gPj4gK30KPiA+PiArCj4gPj4g
K3N0YXRpYyB2b2lkIGRybV9nZW1fc2htZW1fZGVzdHJveV9zaGFkb3dfcGxhbmVfc3RhdGUoc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSkK
PiA+PiArewo+ID4+ICsgICAgc3RydWN0IGRybV9nZW1fc2htZW1fc2hhZG93X3BsYW5lX3N0YXRl
ICpzaGFkb3dfcGxhbmVfc3RhdGUgPQo+ID4+ICsgICAgICAgICAgICB0b19kcm1fZ2VtX3NobWVt
X3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZV9zdGF0ZSk7Cj4gPj4gKwo+ID4+ICsgICAgX19kcm1f
YXRvbWljX2hlbHBlcl9wbGFuZV9kZXN0cm95X3N0YXRlKCZzaGFkb3dfcGxhbmVfc3RhdGUtPmJh
c2UpOwo+ID4+ICsgICAga2ZyZWUoc2hhZG93X3BsYW5lX3N0YXRlKTsKPiA+PiArfQo+ID4+ICsK
PiA+PiArc3RhdGljIHZvaWQgZHJtX2dlbV9zaG1lbV9yZXNldF9zaGFkb3dfcGxhbmUoc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUpCj4gPj4gK3sKPiA+PiArICAgIHN0cnVjdCBkcm1fZ2VtX3NobWVt
X3NoYWRvd19wbGFuZV9zdGF0ZSAqc2hhZG93X3BsYW5lX3N0YXRlOwo+ID4+ICsKPiA+PiArICAg
IGlmIChwbGFuZS0+c3RhdGUpIHsKPiA+PiArICAgICAgICAgICAgZHJtX2dlbV9zaG1lbV9kZXN0
cm95X3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZSwgcGxhbmUtPnN0YXRlKTsKPiA+PiArICAgICAg
ICAgICAgcGxhbmUtPnN0YXRlID0gTlVMTDsgLyogbXVzdCBiZSBzZXQgdG8gTlVMTCBoZXJlICov
Cj4gPj4gKyAgICB9Cj4gPj4gKwo+ID4+ICsgICAgc2hhZG93X3BsYW5lX3N0YXRlID0ga3phbGxv
YyhzaXplb2YoKnNoYWRvd19wbGFuZV9zdGF0ZSksIEdGUF9LRVJORUwpOwo+ID4+ICsgICAgaWYg
KCFzaGFkb3dfcGxhbmVfc3RhdGUpCj4gPj4gKyAgICAgICAgICAgIHJldHVybjsKPiA+PiArICAg
IF9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQocGxhbmUsICZzaGFkb3dfcGxhbmVfc3Rh
dGUtPmJhc2UpOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICsvKgo+ID4+ICsgKiBIZWxwZXJzIGZvciBz
dHJ1Y3QgZHJtX3BsYW5lX2hlbHBlcl9mdW5jcwo+ID4+ICsgKi8KPiA+PiArCj4gPj4gK3N0YXRp
YyBpbnQgZHJtX2dlbV9zaG1lbV9wcmVwYXJlX3NoYWRvd19mYihzdHJ1Y3QgZHJtX3BsYW5lICpw
bGFuZSwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCj4gPj4gK3sKPiA+PiArICAgIHN0cnVjdCBk
cm1fZ2VtX3NobWVtX3NoYWRvd19wbGFuZV9zdGF0ZSAqc2hhZG93X3BsYW5lX3N0YXRlID0KPiA+
PiArICAgICAgICAgICAgdG9fZHJtX2dlbV9zaG1lbV9zaGFkb3dfcGxhbmVfc3RhdGUocGxhbmVf
c3RhdGUpOwo+ID4+ICsgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0
ZS0+ZmI7Cj4gPj4gKyAgICBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKPiA+PiArICAgIHN0
cnVjdCBkbWFfYnVmX21hcCBtYXA7Cj4gPj4gKyAgICBpbnQgcmV0Owo+ID4+ICsgICAgc2l6ZV90
IGk7Cj4gPj4gKwo+ID4+ICsgICAgaWYgKCFmYikKPiA+PiArICAgICAgICAgICAgcmV0dXJuIDA7
Cj4gPj4gKwo+ID4+ICsgICAgcmV0ID0gZHJtX2dlbV9mYl9wcmVwYXJlX2ZiKHBsYW5lLCBwbGFu
ZV9zdGF0ZSk7Cj4gPj4gKyAgICBpZiAocmV0KQo+ID4+ICsgICAgICAgICAgICByZXR1cm4gcmV0
Owo+ID4+ICsKPiA+PiArICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNoYWRvd19wbGFu
ZV9zdGF0ZS0+bWFwKTsgKytpKSB7Cj4gPj4gKyAgICAgICAgICAgIG9iaiA9IGRybV9nZW1fZmJf
Z2V0X29iaihmYiwgaSk7Cj4gPj4gKyAgICAgICAgICAgIGlmICghb2JqKQo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4+ICsgICAgICAgICAgICByZXQgPSBkcm1fZ2VtX3No
bWVtX3ZtYXAob2JqLCAmbWFwKTsKPiA+PiArICAgICAgICAgICAgaWYgKHJldCkKPiA+PiArICAg
ICAgICAgICAgICAgICAgICBnb3RvIGVycl9kcm1fZ2VtX3NobWVtX3Z1bm1hcDsKPiA+PiArICAg
ICAgICAgICAgc2hhZG93X3BsYW5lX3N0YXRlLT5tYXBbaV0gPSBtYXA7Cj4gPj4gKyAgICB9Cj4g
Pj4gKwo+ID4+ICsgICAgcmV0dXJuIDA7Cj4gPj4gKwo+ID4+ICtlcnJfZHJtX2dlbV9zaG1lbV92
dW5tYXA6Cj4gPj4gKyAgICB3aGlsZSAoaSkgewo+ID4+ICsgICAgICAgICAgICAtLWk7Cj4gPj4g
KyAgICAgICAgICAgIG9iaiA9IGRybV9nZW1fZmJfZ2V0X29iaihmYiwgaSk7Cj4gPj4gKyAgICAg
ICAgICAgIGlmICghb2JqKQo+ID4+ICsgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4+
ICsgICAgICAgICAgICBkcm1fZ2VtX3NobWVtX3Z1bm1hcChvYmosICZzaGFkb3dfcGxhbmVfc3Rh
dGUtPm1hcFtpXSk7Cj4gPj4gKyAgICB9Cj4gPj4gKyAgICByZXR1cm4gcmV0Owo+ID4+ICt9Cj4g
Pj4gKwo+ID4+ICtzdGF0aWMgdm9pZCBkcm1fZ2VtX3NobWVtX2NsZWFudXBfc2hhZG93X2ZiKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCj4gPj4gK3sK
PiA+PiArICAgIHN0cnVjdCBkcm1fZ2VtX3NobWVtX3NoYWRvd19wbGFuZV9zdGF0ZSAqc2hhZG93
X3BsYW5lX3N0YXRlID0KPiA+PiArICAgICAgICAgICAgdG9fZHJtX2dlbV9zaG1lbV9zaGFkb3df
cGxhbmVfc3RhdGUocGxhbmVfc3RhdGUpOwo+ID4+ICsgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIgPSBwbGFuZV9zdGF0ZS0+ZmI7Cj4gPj4gKyAgICBzaXplX3QgaSA9IEFSUkFZX1NJWkUo
c2hhZG93X3BsYW5lX3N0YXRlLT5tYXApOwo+ID4+ICsgICAgc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmo7Cj4gPj4gKwo+ID4+ICsgICAgaWYgKCFmYikKPiA+PiArICAgICAgICAgICAgcmV0dXJu
Owo+ID4+ICsKPiA+PiArICAgIHdoaWxlIChpKSB7Cj4gPj4gKyAgICAgICAgICAgIC0taTsKPiA+
PiArICAgICAgICAgICAgb2JqID0gZHJtX2dlbV9mYl9nZXRfb2JqKGZiLCBpKTsKPiA+PiArICAg
ICAgICAgICAgaWYgKCFvYmopCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
Pj4gKyAgICAgICAgICAgIGRybV9nZW1fc2htZW1fdnVubWFwKG9iaiwgJnNoYWRvd19wbGFuZV9z
dGF0ZS0+bWFwW2ldKTsKPiA+PiArICAgIH0KPiA+PiArfQo+ID4+ICsKPiA+PiArLyoKPiA+PiAr
ICogU2ltcGxlIEtNUyBoZWxwZXJzCj4gPj4gKyAqLwo+ID4+ICsKPiA+PiAraW50IGRybV9nZW1f
c2htZW1fc2ltcGxlX2ttc19wcmVwYXJlX3NoYWRvd19mYihzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNw
bGF5X3BpcGUgKnBpcGUsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSkKPiA+PiArewo+ID4+
ICsgICAgcmV0dXJuIGRybV9nZW1fc2htZW1fcHJlcGFyZV9zaGFkb3dfZmIoJnBpcGUtPnBsYW5l
LCBwbGFuZV9zdGF0ZSk7Cj4gPj4gK30KPiA+PiArRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3NobWVt
X3NpbXBsZV9rbXNfcHJlcGFyZV9zaGFkb3dfZmIpOwo+ID4+ICsKPiA+PiArdm9pZCBkcm1fZ2Vt
X3NobWVtX3NpbXBsZV9rbXNfY2xlYW51cF9zaGFkb3dfZmIoc3RydWN0IGRybV9zaW1wbGVfZGlz
cGxheV9waXBlICpwaXBlLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQo+ID4+ICt7Cj4g
Pj4gKyAgICBkcm1fZ2VtX3NobWVtX2NsZWFudXBfc2hhZG93X2ZiKCZwaXBlLT5wbGFuZSwgcGxh
bmVfc3RhdGUpOwo+ID4+ICt9Cj4gPj4gK0VYUE9SVF9TWU1CT0woZHJtX2dlbV9zaG1lbV9zaW1w
bGVfa21zX2NsZWFudXBfc2hhZG93X2ZiKTsKPiA+PiArCj4gPj4gK3ZvaWQgZHJtX2dlbV9zaG1l
bV9zaW1wbGVfa21zX3Jlc2V0X3NoYWRvd19wbGFuZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5
X3BpcGUgKnBpcGUpCj4gPj4gK3sKPiA+PiArICAgIGRybV9nZW1fc2htZW1fcmVzZXRfc2hhZG93
X3BsYW5lKCZwaXBlLT5wbGFuZSk7Cj4gPj4gK30KPiA+PiArRVhQT1JUX1NZTUJPTChkcm1fZ2Vt
X3NobWVtX3NpbXBsZV9rbXNfcmVzZXRfc2hhZG93X3BsYW5lKTsKPiA+PiArCj4gPj4gK3N0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKgo+ID4+ICtkcm1fZ2VtX3NobWVtX3NpbXBsZV9rbXNfZHVwbGlj
YXRlX3NoYWRvd19wbGFuZV9zdGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBp
cGUsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCj4gPj4gK3sKPiA+PiArICAg
IHJldHVybiBkcm1fZ2VtX3NobWVtX2R1cGxpY2F0ZV9zaGFkb3dfcGxhbmVfc3RhdGUoJnBpcGUt
PnBsYW5lLCBwbGFuZV9zdGF0ZSk7Cj4gPj4gK30KPiA+PiArRVhQT1JUX1NZTUJPTChkcm1fZ2Vt
X3NobWVtX3NpbXBsZV9rbXNfZHVwbGljYXRlX3NoYWRvd19wbGFuZV9zdGF0ZSk7Cj4gPj4gKwo+
ID4+ICt2b2lkIGRybV9nZW1fc2htZW1fc2ltcGxlX2ttc19kZXN0cm95X3NoYWRvd19wbGFuZV9z
dGF0ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCj4gPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9w
bGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCj4gPj4gK3sKPiA+PiArICAgIGRybV9nZW1fc2htZW1f
ZGVzdHJveV9zaGFkb3dfcGxhbmVfc3RhdGUoJnBpcGUtPnBsYW5lLCBwbGFuZV9zdGF0ZSk7Cj4g
Pj4gK30KPiA+PiArRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3NobWVtX3NpbXBsZV9rbXNfZGVzdHJv
eV9zaGFkb3dfcGxhbmVfc3RhdGUpOwo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Z2VtX3NobWVtX2ttc19oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1fa21zX2hl
bHBlci5oCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAu
LmJkNDJjOWMwYTM5ZQo+ID4+IC0tLSAvZGV2L251bGwKPiA+PiArKysgYi9pbmNsdWRlL2RybS9k
cm1fZ2VtX3NobWVtX2ttc19oZWxwZXIuaAo+ID4+IEBAIC0wLDAgKzEsNTYgQEAKPiA+PiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+PiArCj4gPj4gKyNpZm5kZWYg
X19EUk1fR0VNX1NITUVNX0tNU19IRUxQRVJfSF9fCj4gPj4gKyNkZWZpbmUgX19EUk1fR0VNX1NI
TUVNX0tNU19IRUxQRVJfSF9fCj4gPj4gKwo+ID4+ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi1t
YXAuaD4KPiA+PiArCj4gPj4gKyNpbmNsdWRlIDxkcm0vZHJtX3BsYW5lLmg+Cj4gPj4gKwo+ID4+
ICtzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGU7Cj4gPj4gKwo+ID4+ICtzdHJ1Y3QgZHJt
X2dlbV9zaG1lbV9zaGFkb3dfcGxhbmVfc3RhdGUgewo+ID4+ICsgICAgc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSBiYXNlOwo+ID4+ICsKPiA+PiArICAgIC8qIFRyYW5zaXRpb25hbCBzdGF0ZSAtIGRv
IG5vdCBleHBvcnQgb3IgZHVwbGljYXRlICovCj4gPj4gKwo+ID4+ICsgICAgc3RydWN0IGRtYV9i
dWZfbWFwIG1hcFs0XTsKPiA+PiArfTsKPiA+PiArCj4gPj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0
IGRybV9nZW1fc2htZW1fc2hhZG93X3BsYW5lX3N0YXRlICoKPiA+PiArdG9fZHJtX2dlbV9zaG1l
bV9zaGFkb3dfcGxhbmVfc3RhdGUoc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUpCj4gPj4g
K3sKPiA+PiArICAgIHJldHVybiBjb250YWluZXJfb2Yoc3RhdGUsIHN0cnVjdCBkcm1fZ2VtX3No
bWVtX3NoYWRvd19wbGFuZV9zdGF0ZSwgYmFzZSk7Cj4gPj4gK30KPiA+PiArCj4gPj4gKy8qCj4g
Pj4gKyAqIFNpbXBsZSBLTVMgaGVscGVycwo+ID4+ICsgKi8KPiA+PiArCj4gPj4gK2ludCBkcm1f
Z2VtX3NobWVtX3NpbXBsZV9rbXNfcHJlcGFyZV9zaGFkb3dfZmIoc3RydWN0IGRybV9zaW1wbGVf
ZGlzcGxheV9waXBlICpwaXBlLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpOwo+ID4+ICt2
b2lkIGRybV9nZW1fc2htZW1fc2ltcGxlX2ttc19jbGVhbnVwX3NoYWRvd19mYihzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUp
Owo+ID4+ICt2b2lkIGRybV9nZW1fc2htZW1fc2ltcGxlX2ttc19yZXNldF9zaGFkb3dfcGxhbmUo
c3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlKTsKPiA+PiArc3RydWN0IGRybV9w
bGFuZV9zdGF0ZSAqCj4gPj4gK2RybV9nZW1fc2htZW1fc2ltcGxlX2ttc19kdXBsaWNhdGVfc2hh
ZG93X3BsYW5lX3N0YXRlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSk7Cj4gPj4gK3ZvaWQKPiA+PiArZHJtX2dl
bV9zaG1lbV9zaW1wbGVfa21zX2Rlc3Ryb3lfc2hhZG93X3BsYW5lX3N0YXRlKHN0cnVjdCBkcm1f
c2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3Rh
dGUpOwo+ID4+ICsKPiA+PiArLyoqCj4gPj4gKyAqIERSTV9HRU1fU0hNRU1fU0lNUExFX0RJU1BM
QVlfUElQRV9TSEFET1dfUExBTkVfRlVOQ1MgLQo+ID4+ICsgKiAgSW5pdGlhbGl6ZXMgc3RydWN0
IGRybV9zaW1wbGVfZGlzcGxheV9waXBlX2Z1bmNzIGZvciBTSE1FTSBzaGFkb3cgcGxhbmVzCj4g
Pj4gKyAqCj4gPj4gKyAqIERyaXZlcnMgbWF5IHVzZSBHRU0gU0hNRU0gQk9zIGFzIHNoYWRvdyBi
dWZmZXJzIG92ZXIgdGhlIGZyYW1lYnVmZmVyIG1lbW9yeS4gVGhpcwo+ID4+ICsgKiBtYWNybyBp
bml0aWFsaXplcyBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgdG8gdXNlIHRo
ZSByc3AgaGVscGVyIGZ1bmN0aW9ucy4KPiA+PiArICovCj4gPj4gKyNkZWZpbmUgRFJNX0dFTV9T
SE1FTV9TSU1QTEVfRElTUExBWV9QSVBFX1NIQURPV19QTEFORV9GVU5DUyBcCj4gPj4gKyAgICAu
cHJlcGFyZV9mYiA9IGRybV9nZW1fc2htZW1fc2ltcGxlX2ttc19wcmVwYXJlX3NoYWRvd19mYiwg
XAo+ID4+ICsgICAgLmNsZWFudXBfZmIgPSBkcm1fZ2VtX3NobWVtX3NpbXBsZV9rbXNfY2xlYW51
cF9zaGFkb3dfZmIsIFwKPiA+PiArICAgIC5yZXNldF9wbGFuZSA9IGRybV9nZW1fc2htZW1fc2lt
cGxlX2ttc19yZXNldF9zaGFkb3dfcGxhbmUsIFwKPiA+PiArICAgIC5kdXBsaWNhdGVfcGxhbmVf
c3RhdGUgPSBkcm1fZ2VtX3NobWVtX3NpbXBsZV9rbXNfZHVwbGljYXRlX3NoYWRvd19wbGFuZV9z
dGF0ZSwgXAo+ID4+ICsgICAgLmRlc3Ryb3lfcGxhbmVfc3RhdGUgICA9IGRybV9nZW1fc2htZW1f
c2ltcGxlX2ttc19kZXN0cm95X3NoYWRvd19wbGFuZV9zdGF0ZQo+ID4+ICsKPiA+PiArI2VuZGlm
IC8qIF9fRFJNX0dFTV9TSE1FTV9LTVNfSEVMUEVSX0hfXyAqLwo+ID4+IC0tCj4gPj4gMi4zMC4w
Cj4gPj4KPiA+Cj4KPiAtLQo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4KCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
