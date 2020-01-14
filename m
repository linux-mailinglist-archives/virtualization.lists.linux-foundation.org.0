Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5AF13A02A
	for <lists.virtualization@lfdr.de>; Tue, 14 Jan 2020 04:57:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4F46020460;
	Tue, 14 Jan 2020 03:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yuu6gG8K5BUl; Tue, 14 Jan 2020 03:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C3BE6203F6;
	Tue, 14 Jan 2020 03:57:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F293C077D;
	Tue, 14 Jan 2020 03:57:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4ECBC077D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 03:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9336A875F9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 03:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mBundkxpdsnj
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 03:57:31 +0000 (UTC)
X-Greylist: delayed 00:05:15 by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 875B9875DA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jan 2020 03:57:31 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d62so10514705oia.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 19:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EdIJqpquQROf/Tm4qI+WA7t2jppDnJTdJwBTOKne4C0=;
 b=aQ2lfXTbk2LUdPt9GdWMFKp8+gdA/RTa80mXoSdms3+1oxJOnUFg5wuHSfZPUVWjUZ
 +EZ2m9F/2X4cwJvpEcEinfyo3JYoGq3yytHSys0chnjJI+N+ouuQopmz2CyiDIZd5IpD
 ddXmor12FUMR6T+GEYXTQVS9p8QrDN8Wm4rXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EdIJqpquQROf/Tm4qI+WA7t2jppDnJTdJwBTOKne4C0=;
 b=Cqnbcbe9ZKJ58n6o03IOlNeAgZadZ7MAWkKJEnY7lV2xsaMXdUsRMezqZgyfFqunBs
 EvvMGAn3rqHJuLeBHIoa67i8Z+/pwbl4VgMjzje5CYcW0iOlJiFDEL/jl05+gsZetx6+
 T7Vv94Wkj4iJalQsz5KfaE8VQPsCbd8ks2EyMGjat/xYY4Z4ea0jsXyXMtCKIGE2W+bs
 vYhdgI+vkgAnh+tmqwrXbGqfCa8yicGJBztkrH1HUI3lwFQBhrlicj2kAla5BAyQKM3p
 agKnWArN6gw2TP0GU3g70E6eueL04yfiQRRu+FOW06YwuLS6tVmod7G6w5zO+O1u2YZW
 1zQA==
X-Gm-Message-State: APjAAAUKJsLfZN8aeAXHg0aw8e80dpXcmSVapn2jrjuVh0iIbwULafht
 Ams+wLtIvX9kH/wHjcTNPQpNlGX+7+N49cFECY3wfdhqmehjUw==
X-Google-Smtp-Source: APXvYqwHPspOB3+fRDbkoMOc4jwta+uyHofvQ6O7M428gb0Vl/YJW2pdZSm/kHP+Zj+5C98Ovqze4QnMk/8spc+WcUo=
X-Received: by 2002:aca:481:: with SMTP id 123mr15618038oie.110.1578973935899; 
 Mon, 13 Jan 2020 19:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20200110115707.14080-1-tzimmermann@suse.de>
 <20200112230045.GE5340@dvetter-linux.ger.corp.intel.com>
 <d74a1e5f-a815-979e-1bbb-412d195b3f75@suse.de>
In-Reply-To: <d74a1e5f-a815-979e-1bbb-412d195b3f75@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 14 Jan 2020 04:52:04 +0100
Message-ID: <CAKMK7uEthyYuQpgmhp_YZbdOtFhLY2snARG6mEA1ZtQiKB6eag@mail.gmail.com>
Subject: Re: [PATCH] drm/cirrus: Let DRM core send VBLANK events
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>
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

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTA6MDEgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOgo+Cj4gSGkKPgo+IEFtIDEzLjAxLjIwIHVtIDAwOjAwIHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPiA+IE9uIEZyaSwgSmFuIDEwLCAyMDIwIGF0IDEyOjU3OjA3
UE0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOgo+ID4+IEluIGRybV9hdG9taWNfaGVs
cGVyX2Zha2VfdmJsYW5rKCkgdGhlIERSTSBjb3JlIHNlbmRzIG91dCBWQkxBTksKPiA+PiBldmVu
dHMgaWYgc3RydWN0IGRybV9jcnRjX3N0YXRlLm5vX3ZibGFuayBpcyBlbmFibGVkLiBSZXBsYWNl
IGNpcnJ1cycKPiA+PiBWQkxBTksgZXZlbnRzIHdpdGggdGhlIERSTSBjb3JlJ3MgZnVuY3Rpb25h
bGl0eS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1
cy5jIHwgMTAgKystLS0tLS0tLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9j
aXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCj4gPj4gaW5k
ZXggMjQ4YzlmNzY1YzQ1Li40YTE3MjlhYTdlNTMgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2NpcnJ1cy9jaXJydXMuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMv
Y2lycnVzLmMKPiA+PiBAQCAtMzgsNyArMzgsNiBAQAo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9t
b2Rlc2V0X2hlbHBlcl92dGFibGVzLmg+Cj4gPj4gICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hl
bHBlci5oPgo+ID4+ICAjaW5jbHVkZSA8ZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oPgo+ID4+
IC0jaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KPiA+Pgo+ID4+ICAjZGVmaW5lIERSSVZFUl9O
QU1FICJjaXJydXMiCj4gPj4gICNkZWZpbmUgRFJJVkVSX0RFU0MgInFlbXUgY2lycnVzIHZnYSIK
PiA+PiBAQCAtNDE1LDYgKzQxNCw4IEBAIHN0YXRpYyB2b2lkIGNpcnJ1c19waXBlX2VuYWJsZShz
dHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCj4gPj4gIHsKPiA+PiAgICAgIHN0
cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMgPSBwaXBlLT5jcnRjLmRldi0+ZGV2X3ByaXZhdGU7
Cj4gPj4KPiA+PiArICAgIGNydGNfc3RhdGUtPm5vX3ZibGFuayA9IHRydWU7Cj4gPgo+ID4gSHVo
LCBuaWNlIHVudGVuZGVkIHVzZSBvZiB0aGlzIHN0dWZmIC4uLiBXZSd2ZSBhZGRlZCB0aGlzIGZv
ciB3cml0ZWJhY2ssCj4gPiBidXQgSSBndWVzcyBpdCBjYW4gYmUgdXNlZCBmb3IgYW55dGhpbmcg
dGhhdCdzIGEgdmlydHVhbCBjb25uZWN0b3IgLi4uCj4KPiBPaCwgJ2ltcHJvdmVkIGJ5IGFjY2lk
ZW50Jy4KPgo+IEknbSBub3QgcXVpdGUgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5IHZpcnR1YWwgY29u
bmVjdG9yLCBidXQgaXQgc2hvdWxkCj4gd29yayB3aXRoIGFueSBDUlRDIHdpdGhvdXQgVkJMQU5L
IHN1cHBvcnQuIEF0IGxlYXN0IEkndmUgbmV2ZXIgc2VlbiBhbnkKPiBwcm9ibGVtIHdpdGggYXN0
IGFuZCB1ZGwuIEknbGwgdXBkYXRlIHRoZSBkb2NzIGFjY29yZGluZ2x5LgoKVGhlcmUncyBhIHBy
ZXR0eSBodWdlIGRpZmZlcmVuY2UgYmV0d2VlbiAicmVhbCB2Ymxhbmsgc3VwcG9ydCIsIHdoaWNo
Cm1lYW5zIHRoZSB2YXJpb3VzIHZibGFuay9jcnRjX3NlcXVlbmNlIGlvY3RscyB3b3JrLCBhbmQg
dGhlIGZha2UKdmJsYW5rIGV2ZW4gc3R1ZmYgd2Ugc2VuZCBvdXQgZm9yIGFsbCBkcml2ZXJzIHJp
Z2h0IGF3YXkgdG8gZnVsZmlsbAp0aGUgYXRvbWljIHVhcGkgZXZlbnQgcmVxdWlyZW1lbnRzLiBX
ZSdsbCBuZWVkIHRvIGhpZ2hsaWdodCB0aGF0IHN0dWZmCmluIHRoZSBkb2N1bWVudGF0aW9uIEkg
dGhpbmsgLi4uIE9uIHNlY29uZCB0aG91Z2h0LCBtYXliZSB3ZSBjb3VsZApjaGFuZ2UgdGhlIGF0
b21pYyBoZWxwZXJzIHRvIGF1dG9tYXRpY2FsbHkgc2V0IG5vX3ZibGFuayB3aGVuIHRoZQpkcml2
ZXIvY3J0YyBkb2Vzbid0IHN1cHBvcnQgcmVhbCB2YmxhbmtzLiBCdXQgaXMgZXZlbiBtb3JlIGlu
dm9sdmVkCihidXQgSSB0aGluayBtaWdodCBhbHNvIGJlIHRoZSBldmVuIG5lYXRlciBzb2x1YXRp
b24sIGJ1dCBoYXJkIHRvIGJlCnN1cmUgd2l0aG91dCB0eXBpbmcgaXQgYWxsIHVwKS4gT2ggYW5k
IGJlY2F1c2UgaGlsYXJpb3VzIGhpc3RvcmljYWwKYWNjZW50cyAibm8gcmVhbCB2YmxhbmsiID0g
ZHJtX2Rldi0+bnVtX2NydGNzID09IDAsIHdoaWNoIHdlIG1pZ2h0CndhbnQgdG8gcHV0IGludG8g
YSBoZWxwZXIgaWYgd2UgbGVhayB0aGlzIG91dCBvZiB0aGUgZHJtX3ZibGFuay5jCnNvdXJjZSBm
aWxlcy4KCkNoZWVycywgRGFuaWVsCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiA+Cj4g
PiBJJ3ZlIGFsc28gc3BvdHRlZCB0aGF0IHlvdSd2ZSBkb25lIHRoaXMgc2FtZSB0cmljayBmb3Ig
YXN0ICYgdWRsIGFscmVhZHkuCj4gPiBCdXQgSSB0aGluayBiZWZvcmUgd2Ugcm9sbCB0aGlzIG91
dCBtYXNzaXZlbHkgd2Ugc2hvdWxkIG1ha2UgdGhpcwo+ID4gb2ZmaWNpYWwuIENhbiB5b3UgcGxz
IGRvIGEgcGF0Y2ggdG8gdXBkYXRlIHRoZSBrZXJuZWxkb2MgZm9yIEBub192YmxhbmsKPiA+IHRo
YXQgdmlydHVhbCBodyBjYW4gYWxzbyB1c2UgdGhpcyBzdHVmZj8KPiA+Cj4gPiBBbHNvLCBjb21w
dXRpbmcgc3RhdGUgdmFsdWVzIGluIGF0b21pY19jb21taXQgY29kZSBpcyBraW5kYSB1bmNvb2wg
YW5kCj4gPiBmcmF1Z2h0IHdpdGggcGVyaWwgLSBkZXNpZ24gYXNzdW1wdGlvbiBpcyB0aGF0IHdp
dGggc29tZSB2ZXJ5IGZldwo+ID4gZXhjZXB0aW9ucyAod2hpY2ggYXJlIGtpbmRhIGF3a3dhcmQs
IHdvdWxkIGJlIG5pY2UgdG8gbWFrZSBzdGF0ZSBwb2ludGVycwo+ID4gY29uc3QpIGFsbCB0aGUg
Y29yZSBhbmQgaGVscGVyIGNvZGVzIHRoYXQgc3RhdGUgc3RydWN0dXJlcyBzdGF5IHVuY2hhbmdl
ZAo+ID4gYWZ0ZXIgYXRvbWljX2NoZWNrIGNvbXBsZXRlZC4gVGhpcyBzaG91bGQgYmUgY29tcHV0
ZWQgaW4gYXRvbWljX2NoZWNrIChsaWtlIHZjNAo+ID4gZG9lcykuIENhbiB5b3UgcGxzIGFsc28g
aW5jbHVkZSBwYXRjaGVzIHRvIHVwZGF0ZSBhc3QgYW5kIHVkbCBpbiB0aGlzCj4gPiBzZXJpZXM/
Cj4gPgo+ID4gVGhhbmtzLCBEYW5pZWwKPiA+Cj4gPgo+ID4+ICsKPiA+PiAgICAgIGNpcnJ1c19t
b2RlX3NldChjaXJydXMsICZjcnRjX3N0YXRlLT5tb2RlLCBwbGFuZV9zdGF0ZS0+ZmIpOwo+ID4+
ICAgICAgY2lycnVzX2ZiX2JsaXRfZnVsbHNjcmVlbihwbGFuZV9zdGF0ZS0+ZmIpOwo+ID4+ICB9
Cj4gPj4gQEAgLTQzNCwxMyArNDM1LDYgQEAgc3RhdGljIHZvaWQgY2lycnVzX3BpcGVfdXBkYXRl
KHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKPiA+Pgo+ID4+ICAgICAgaWYg
KGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9tZXJnZWQob2xkX3N0YXRlLCBzdGF0ZSwgJnJlY3Qp
KQo+ID4+ICAgICAgICAgICAgICBjaXJydXNfZmJfYmxpdF9yZWN0KHBpcGUtPnBsYW5lLnN0YXRl
LT5mYiwgJnJlY3QpOwo+ID4+IC0KPiA+PiAtICAgIGlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQpIHsK
PiA+PiAtICAgICAgICAgICAgc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsK
PiA+PiAtICAgICAgICAgICAgZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+
c3RhdGUtPmV2ZW50KTsKPiA+PiAtICAgICAgICAgICAgY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVM
TDsKPiA+PiAtICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxKCZjcnRjLT5kZXYtPmV2ZW50X2xv
Y2spOwo+ID4+IC0gICAgfQo+ID4+ICB9Cj4gPj4KPiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9mdW5jcyBjaXJydXNfcGlwZV9mdW5jcyA9IHsKPiA+PiAt
LQo+ID4+IDIuMjQuMQo+ID4+Cj4gPgo+Cj4gLS0KPiBUaG9tYXMgWmltbWVybWFubgo+IEdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXIKPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgKPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKPiAoSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgo+
CgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
