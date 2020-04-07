Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8041A0816
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 09:19:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA0EE87E15;
	Tue,  7 Apr 2020 07:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gc6ZKqnsynlj; Tue,  7 Apr 2020 07:19:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CD9B85B95;
	Tue,  7 Apr 2020 07:19:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C534C0177;
	Tue,  7 Apr 2020 07:19:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72410C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 07:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 60D0D844B5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 07:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ra0wpRgjMD64
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 07:19:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1CF4380664
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 07:19:12 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id t28so2083762ott.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Apr 2020 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xNt3fDE6uJaNJCPc+/p8WDTR1SyRQ5WstF8jn/ypiGg=;
 b=DmvXpxRMjwvCS4gQNEX4ITP0c8Ox3pRdomle/scBfSC52mVwde2qeCuylii8tNsjTI
 BNx0hDHffFu5pGwTIyIgu13huMIpbmjHM+XsBTsSqasGaBqSoy1yRmJqXm+lSO1ikIaR
 EE1W4IsLjHWRXOR/K5uxIUPqgIqPOJbYCNerE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xNt3fDE6uJaNJCPc+/p8WDTR1SyRQ5WstF8jn/ypiGg=;
 b=cmKLM8kOHGmlsoR045xODrLzcb8ijCUILGJd43VPnFhdaSkD5pvZCAqdwTyy2KjzdC
 Gl9GtoXweKbvwLNP8aOpagrPCs97mEHihUVCpXRYa41UvdxZZ8wPNLSVkGQjK3M+Txhg
 cg/W9iE3KLgn87hDFICd/Lyj/ZzR+TAnWgL1y4/+v8sAQCuAExfQ7MiWgr/R+UaQGixI
 sBWUETo33rGVE4vdPZ2U/gplnzwj0JnMlYvg5I9FsQIKE2IYr9e+Gee4G3VsJ0Xu5nS1
 in9+M8jVe0jRL4j1LT7lFAiPkWJlBX3khaxMuUVUjKG42IeBhLx4Ujedzmfo6wKC+aTk
 W1kg==
X-Gm-Message-State: AGi0PubhVsqU4OcWNK5d2bDD7URMOujSssl2rHHCB1h/Bg/3WqG+kKBk
 XbbS4B1/URk7GL7hp63/vremk+LzJlVWpekoiPEw/A==
X-Google-Smtp-Source: APiQypJtSZZoscLNc2qZAw5+6Gq+qMAG5y4QND3L+RtVHbUwDzAmVPY2eeqlD6VMpx2R3w5b8nhL/OI59tyfSeXJrgg=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr479406ota.281.1586243951190; 
 Tue, 07 Apr 2020 00:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-31-daniel.vetter@ffwll.ch>
 <f85e0d74-2d1a-03ce-3eef-8c21b90845d4@suse.de>
In-Reply-To: <f85e0d74-2d1a-03ce-3eef-8c21b90845d4@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 7 Apr 2020 09:19:00 +0200
Message-ID: <CAKMK7uEfEMq8BNGYHHJa0Q10D9FAmEuogS0k9=pkL2WhyAT9iA@mail.gmail.com>
Subject: Re: [PATCH 30/44] drm/qxl: Use devm_drm_dev_alloc
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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

T24gTW9uLCBBcHIgNiwgMjAyMCBhdCA3OjI5IFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+Cj4KPiBBbSAwMy4wNC4yMCB1bSAxNTo1OCBzY2hyaWVi
IERhbmllbCBWZXR0ZXI6Cj4gPiBBbHNvIG5lZWQgdG8gcmVtb3ZlIHRoZSBkcm1fZGV2X3B1dCBm
cm9tIHRoZSByZW1vdmUgaG9vay4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiA+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBy
ZWRoYXQuY29tPgo+ID4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4g
Q2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCj4gPiBDYzogc3Bp
Y2UtZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF9kcnYuYyB8IDE1ICsrKysrKysrLS0tLS0tLQo+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2Rydi5oIHwgIDMgKy0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21z
LmMgfCAxMiArLS0tLS0tLS0tLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDIwIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5jCj4gPiBpbmRleCAw
OTEwMmUyZWZhYmMuLjZiNGFlNGM1ZmI3NiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYwo+
ID4gQEAgLTgxLDEzICs4MSwxNiBAQCBxeGxfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ID4gICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsgLyogVE9ETzogRU5PREVWID8gKi8KPiA+ICAgICAgIH0KPiA+Cj4gPiAtICAg
ICBxZGV2ID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHF4bF9kZXZpY2UpLCBHRlBfS0VSTkVMKTsK
PiA+IC0gICAgIGlmICghcWRldikKPiA+ICsgICAgIHFkZXYgPSBkZXZtX2RybV9kZXZfYWxsb2Mo
JnBkZXYtPmRldiwgJnF4bF9kcml2ZXIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBxeGxfZGV2aWNlLCBkZGV2KTsKPiA+ICsgICAgIGlmIChJU19FUlIocWRldikp
IHsKPiA+ICsgICAgICAgICAgICAgcHJfZXJyKCJVbmFibGUgdG8gaW5pdCBkcm0gZGV2Iik7Cj4g
PiAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgfQo+Cj4gTXkgZmVlbGlu
ZyBpcyB0aGF0IGl0IGlzIHRvbyBlYXJseSB0byBhbGxvY2F0ZS4gV291bGRuJ3QgaXQgYmUgYmV0
dGVyIHRvCj4gZmlyc3QgZG8gdGhlIHBkZXYgYW5kIGNvbmZsaWN0aW5nLWZiIHN0dWZmIGFuZCBh
bGxvY2F0ZSByaWdodCBiZWZvcmUKPiBxeGxfZGV2aWNlX2luaXQoKSA/CgpJdCBkb2Vzbid0IG1h
dHRlci4gSSBjYW4gcmVvcmRlciwgb3IgSSBjYW4gYWxzbyBub3QgcmVvcmRlciwgaXQnbGwKaGF2
ZSAwIGVmZmVjdHMgb24gY2xlYW51cCAoYWxsIGRvbmUgYXV0b21hdGljYWxseSkgb3IgY29ycmVj
dG5lc3MKKGl0J3MganVzdCBhIG1lbW9yeSBhbGxvY2F0aW9uLCBpdCBkb2Vzbid0IGRvIGFueXRo
aW5nKS4KLURhbmllbAoKCj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+Cj4gPiAgICAgICBy
ZXQgPSBwY2lfZW5hYmxlX2RldmljZShwZGV2KTsKPiA+ICAgICAgIGlmIChyZXQpCj4gPiAtICAg
ICAgICAgICAgIGdvdG8gZnJlZV9kZXY7Cj4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
Pgo+ID4gICAgICAgcmV0ID0gZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2Zy
YW1lYnVmZmVycyhwZGV2LCAicXhsIik7Cj4gPiAgICAgICBpZiAocmV0KQo+ID4gQEAgLTEwMSw3
ICsxMDQsNyBAQCBxeGxfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1
Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ID4gICAgICAgICAgICAgICB9Cj4gPiAgICAgICB9Cj4g
Pgo+ID4gLSAgICAgcmV0ID0gcXhsX2RldmljZV9pbml0KHFkZXYsICZxeGxfZHJpdmVyLCBwZGV2
KTsKPiA+ICsgICAgIHJldCA9IHF4bF9kZXZpY2VfaW5pdChxZGV2LCBwZGV2KTsKPiA+ICAgICAg
IGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIGdvdG8gcHV0X3ZnYTsKPiA+Cj4gPiBAQCAtMTI4
LDggKzEzMSw3IEBAIHF4bF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCj4gPiAgICAgICAgICAgICAgIHZnYV9wdXQocGRldiwg
VkdBX1JTUkNfTEVHQUNZX0lPKTsKPiA+ICBkaXNhYmxlX3BjaToKPiA+ICAgICAgIHBjaV9kaXNh
YmxlX2RldmljZShwZGV2KTsKPiA+IC1mcmVlX2RldjoKPiA+IC0gICAgIGtmcmVlKHFkZXYpOwo+
ID4gKwo+ID4gICAgICAgcmV0dXJuIHJldDsKPiA+ICB9Cj4gPgo+ID4gQEAgLTE1NSw3ICsxNTcs
NiBAQCBxeGxfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+ICAgICAgIGRybV9h
dG9taWNfaGVscGVyX3NodXRkb3duKGRldik7Cj4gPiAgICAgICBpZiAoaXNfdmdhKHBkZXYpKQo+
ID4gICAgICAgICAgICAgICB2Z2FfcHV0KHBkZXYsIFZHQV9SU1JDX0xFR0FDWV9JTyk7Cj4gPiAt
ICAgICBkcm1fZGV2X3B1dChkZXYpOwo+ID4gIH0KPiA+Cj4gPiAgREVGSU5FX0RSTV9HRU1fRk9Q
UyhxeGxfZm9wcyk7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2
LmggYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAo+ID4gaW5kZXggNDM1MTI2ZmFjYzli
Li44NmFjMTkxZDkyMDUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
cnYuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmgKPiA+IEBAIC0yNzYs
OCArMjc2LDcgQEAgc3RydWN0IHF4bF9kZXZpY2Ugewo+ID4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qg
ZHJtX2lvY3RsX2Rlc2MgcXhsX2lvY3Rsc1tdOwo+ID4gIGV4dGVybiBpbnQgcXhsX21heF9pb2N0
bDsKPiA+Cj4gPiAtaW50IHF4bF9kZXZpY2VfaW5pdChzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwg
c3RydWN0IGRybV9kcml2ZXIgKmRydiwKPiA+IC0gICAgICAgICAgICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KTsKPiA+ICtpbnQgcXhsX2RldmljZV9pbml0KHN0cnVjdCBxeGxfZGV2aWNlICpx
ZGV2LCBzdHJ1Y3QgcGNpX2RldiAqcGRldik7Cj4gPiAgdm9pZCBxeGxfZGV2aWNlX2Zpbmkoc3Ry
dWN0IHF4bF9kZXZpY2UgKnFkZXYpOwo+ID4KPiA+ICBpbnQgcXhsX21vZGVzZXRfaW5pdChzdHJ1
Y3QgcXhsX2RldmljZSAqcWRldik7Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4
bC9xeGxfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9rbXMuYwo+ID4gaW5kZXggOWVl
ZDFhMzc1ZjI0Li45MWEzNGRkODM1ZDcgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9rbXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmMKPiA+
IEBAIC0xMDgsMjEgKzEwOCwxMyBAQCBzdGF0aWMgdm9pZCBxeGxfZ2Nfd29yayhzdHJ1Y3Qgd29y
a19zdHJ1Y3QgKndvcmspCj4gPiAgfQo+ID4KPiA+ICBpbnQgcXhsX2RldmljZV9pbml0KHN0cnVj
dCBxeGxfZGV2aWNlICpxZGV2LAo+ID4gLSAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9kcml2
ZXIgKmRydiwKPiA+ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ID4g
IHsKPiA+ICAgICAgIGludCByLCBzYjsKPiA+Cj4gPiAtICAgICByID0gZHJtX2Rldl9pbml0KCZx
ZGV2LT5kZGV2LCBkcnYsICZwZGV2LT5kZXYpOwo+ID4gLSAgICAgaWYgKHIpIHsKPiA+IC0gICAg
ICAgICAgICAgcHJfZXJyKCJVbmFibGUgdG8gaW5pdCBkcm0gZGV2Iik7Cj4gPiAtICAgICAgICAg
ICAgIGdvdG8gZXJyb3I7Cj4gPiAtICAgICB9Cj4gPiAtCj4gPiAgICAgICBxZGV2LT5kZGV2LnBk
ZXYgPSBwZGV2Owo+ID4gICAgICAgcGNpX3NldF9kcnZkYXRhKHBkZXYsICZxZGV2LT5kZGV2KTsK
PiA+ICAgICAgIHFkZXYtPmRkZXYuZGV2X3ByaXZhdGUgPSBxZGV2Owo+ID4gLSAgICAgZHJtbV9h
ZGRfZmluYWxfa2ZyZWUoJnFkZXYtPmRkZXYsIHFkZXYpOwo+ID4KPiA+ICAgICAgIG11dGV4X2lu
aXQoJnFkZXYtPmdlbS5tdXRleCk7Cj4gPiAgICAgICBtdXRleF9pbml0KCZxZGV2LT51cGRhdGVf
YXJlYV9tdXRleCk7Cj4gPiBAQCAtMTM4LDggKzEzMCw3IEBAIGludCBxeGxfZGV2aWNlX2luaXQo
c3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCj4gPiAgICAgICBxZGV2LT52cmFtX21hcHBpbmcgPSBp
b19tYXBwaW5nX2NyZWF0ZV93YyhxZGV2LT52cmFtX2Jhc2UsIHBjaV9yZXNvdXJjZV9sZW4ocGRl
diwgMCkpOwo+ID4gICAgICAgaWYgKCFxZGV2LT52cmFtX21hcHBpbmcpIHsKPiA+ICAgICAgICAg
ICAgICAgcHJfZXJyKCJVbmFibGUgdG8gY3JlYXRlIHZyYW1fbWFwcGluZyIpOwo+ID4gLSAgICAg
ICAgICAgICByID0gLUVOT01FTTsKPiA+IC0gICAgICAgICAgICAgZ290byBlcnJvcjsKPiA+ICsg
ICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgaWYg
KHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgNCkgPiAwKSB7Cj4gPiBAQCAtMjkzLDcgKzI4NCw2IEBA
IGludCBxeGxfZGV2aWNlX2luaXQoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCj4gPiAgICAgICBp
b19tYXBwaW5nX2ZyZWUocWRldi0+c3VyZmFjZV9tYXBwaW5nKTsKPiA+ICB2cmFtX21hcHBpbmdf
ZnJlZToKPiA+ICAgICAgIGlvX21hcHBpbmdfZnJlZShxZGV2LT52cmFtX21hcHBpbmcpOwo+ID4g
LWVycm9yOgo+ID4gICAgICAgcmV0dXJuIHI7Cj4gPiAgfQo+ID4KPiA+Cj4KPiAtLQo+IFRob21h
cyBaaW1tZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjog
RmVsaXggSW1lbmTDtnJmZmVyCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpW
aXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vdmlydHVhbGl6YXRpb24=
