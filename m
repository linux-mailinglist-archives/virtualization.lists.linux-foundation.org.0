Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D3378139229
	for <lists.virtualization@lfdr.de>; Mon, 13 Jan 2020 14:28:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 61E46845D5;
	Mon, 13 Jan 2020 13:28:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXAazPY1xLpJ; Mon, 13 Jan 2020 13:28:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF89D85124;
	Mon, 13 Jan 2020 13:28:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA4F0C1D8D;
	Mon, 13 Jan 2020 13:28:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F4FDC077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8472E203E8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftUJFdNNnVAo
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 13:28:40 +0000 (UTC)
X-Greylist: delayed 00:25:04 by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 91B0A203D2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 13:28:40 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n15so9049522qtp.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Km5amB7u+f2nJJaDa/p5PTnfI/jbVGIB1ALdNIZW0xI=;
 b=Xy+xBFB7LHF28j088RfzKlJh4WkEdFUmbBLN907YVDC2kYf3tVqlMwHQyv5InTMDv6
 l0ztlM5MCIhcZzh7wf4s48pSf6T+NAi6RgU8d7gCpe2pqhyTwtBjCX5ek+Co8kHrhbbc
 EtXHLuQr2H813FqGLUaJdFKqls54BHqd23nEb6zXDsZta6GT6MrpSLYJ8PIPcP9oAtcZ
 5RveoHzs3P58Admqbjwc93cAZbzsrsLlxT2uISDkU8Jsz7sCCapaJDirePGjmnBra61C
 5GXovGTwVVTowwUTsYx2iUGYGMvqaUcykr4M2XfZgKowK6bYWpeKP93WNpMXrbtDiGIy
 5oOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Km5amB7u+f2nJJaDa/p5PTnfI/jbVGIB1ALdNIZW0xI=;
 b=VptJlpPHnBsfbo0VG4yqMDS7aQ77R/mOWAa0+eS+/8jmasmXw7ct6B1ShmjBR+S/dp
 wtUn65m9waSqEdEzGsAeBLNhXDiFBwYVvBWyRdNpjzsdlPrtaw94k34WM6DGUezb5fpP
 RvTVnTCD2kt2rLP61g5ExrBVWqfhpQOxOEKLwaJBl7TYlMpGtG+wKOLOF026c1zGyjdl
 PhvgbD60bFri1Go/WjzHvIiwuDB6n90A4mpSeRf99mRuhMa0qesikjNKUf1GcS3mVGXF
 MtNGCUOl0/iwYm92PxvM86IXyhnyI/vUPqNsAQQtVhMBNbT7Ac5jZMtJsBnMEe3eXzdw
 kEeA==
X-Gm-Message-State: APjAAAU/pBs4Y2Vo810NouPZfGSTPzXLt2UTgc/Sna7GskON9WSGdquH
 Yy8e7QmIPjph7RYRbzAFYpTIIrJ4s3xdLVW1V0BNZsTa
X-Google-Smtp-Source: APXvYqzWyOXnjsum8RIdEHYuGqw6fldwu80yL6GUjd12dqkgOxz5rn2euW860M61KP60nEmySnc98iWxnmG9VyTJT4o=
X-Received: by 2002:a02:620c:: with SMTP id d12mr14136503jac.116.1578918759468; 
 Mon, 13 Jan 2020 04:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20200113081736.2340-1-yuri.benditovich@daynix.com>
 <bdc6cb05-30d1-b4fd-512e-740b2550c14e@redhat.com>
In-Reply-To: <bdc6cb05-30d1-b4fd-512e-740b2550c14e@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 13 Jan 2020 14:32:25 +0200
Message-ID: <CAOEp5OfgSwsa63kgAUJW9E2C7FiWt7AFdPupQCaMb4CLgi4YXg@mail.gmail.com>
Subject: Re: [PATCH v2] virtio-net: Introduce extended RSC feature
To: Jason Wang <jasowang@redhat.com>
Cc: Yan Vugenfirer <yan@daynix.com>, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>
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

T24gTW9uLCBKYW4gMTMsIDIwMjAgYXQgMTowOCBQTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPgo+Cj4gT24gMjAyMC8xLzEzIOS4i+WNiDQ6MTcsIFl1cmkgQmVuZGl0
b3ZpY2ggd3JvdGU6Cj4gPiBWSVJUSU9fTkVUX0ZfUlNDX0VYVCBmZWF0dXJlIGJpdCBpbmRpY2F0
ZXMgdGhhdCB0aGUgZGV2aWNlCj4gPiBpcyBhYmxlIHRvIHByb3ZpZGUgZXh0ZW5kZWQgUlNDIGlu
Zm9ybWF0aW9uLiBXaGVuIHRoZSBmZWF0dXJlCj4gPiBpcyBuZWdvdGlhdGVkZSBhbmQgJ2dzb190
eXBlJyBmaWVsZCBpbiByZWNlaXZlZCBwYWNrZXQgaXMgbm90Cj4gPiBHU09fTk9ORSwgdGhlIGRl
dmljZSByZXBvcnRzIG51bWJlciBvZiBjb2FsZXNjZWQgcGFja2V0cyBpbgo+ID4gJ2NzdW1fc3Rh
cnQnIGZpZWxkIGFuZCBudW1iZXIgb2YgZHVwbGljYXRlZCBhY2tzIGluICdjc3VtX29mZnNldCcK
PiA+IGZpZWxkIGFuZCBzZXRzIFZJUlRJT19ORVRfSERSX0ZfUlNDX0lORk8gaW4gJ2ZsYWdzJyBm
aWVsZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdXJpIEJlbmRpdG92aWNoIDx5dXJpLmJlbmRp
dG92aWNoQGRheW5peC5jb20+Cj4KPgo+IEhpIFl1cmk6Cj4KPiBJcyB0aGUgZmVhdHVyZSB1c2Vk
IGJ5IExpbnV4PyBJZiB5ZXMsIGl0J3MgYmV0dGVyIHRvIGluY2x1ZGUgdGhlIHJlYWwgdXNlci4K
PgoKSXQgaXMgbm90IHVzZWQgYnkgTGludXguIE1haW5seSBuZWVkZWQgZm9yIGNlcnRpZmljYXRp
b24gdW5kZXIgV2luZG93cy4KCj4KPiA+IC0tLQo+ID4gICBpbmNsdWRlL3VhcGkvbGludXgvdmly
dGlvX25ldC5oIHwgMTAgKysrKysrKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9s
aW51eC92aXJ0aW9fbmV0LmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX25ldC5oCj4gPiBp
bmRleCBhMzcxNWEzMjI0YzEuLjJiZGQyNmY4YTRlZCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC92aXJ0aW9fbmV0LmgKPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0
aW9fbmV0LmgKPiA+IEBAIC01Niw3ICs1Niw3IEBACj4gPiAgICNkZWZpbmUgVklSVElPX05FVF9G
X01RICAgICAyMiAgICAgIC8qIERldmljZSBzdXBwb3J0cyBSZWNlaXZlIEZsb3cKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICogU3RlZXJpbmcgKi8KPiA+ICAgI2Rl
ZmluZSBWSVJUSU9fTkVUX0ZfQ1RSTF9NQUNfQUREUiAyMyAgICAgICAvKiBTZXQgTUFDIGFkZHJl
c3MgKi8KPiA+IC0KPiA+ICsjZGVmaW5lIFZJUlRJT19ORVRfRl9SU0NfRVhUICAgNjEgICAgLyog
UHJvdmlkZXMgZXh0ZW5kZWQgUlNDIGluZm8gKi8KPgo+Cj4gSXMgdGhpcyBiZXR0ZXIgdG8ga2Vl
cCB0aGUgbmV3bGluZSBhcm91bmQ/CgpObyBwcm9ibGVtLCBsZXQncyB3YWl0IHVudGlsIHRoZSBy
ZXN0IGlzIGFjY2VwdGVkLgoKPgo+Cj4gPiAgICNkZWZpbmUgVklSVElPX05FVF9GX1NUQU5EQlkg
ICAgICAgICAgNjIgICAgLyogQWN0IGFzIHN0YW5kYnkgZm9yIGFub3RoZXIgZGV2aWNlCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIHdpdGggdGhlIHNhbWUgTUFD
Lgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+IEBAIC0x
MDQsNiArMTA0LDcgQEAgc3RydWN0IHZpcnRpb19uZXRfY29uZmlnIHsKPiA+ICAgc3RydWN0IHZp
cnRpb19uZXRfaGRyX3YxIHsKPiA+ICAgI2RlZmluZSBWSVJUSU9fTkVUX0hEUl9GX05FRURTX0NT
VU0gMSAgICAgICAvKiBVc2UgY3N1bV9zdGFydCwgY3N1bV9vZmZzZXQgKi8KPiA+ICAgI2RlZmlu
ZSBWSVJUSU9fTkVUX0hEUl9GX0RBVEFfVkFMSUQgMiAgICAgICAvKiBDc3VtIGlzIHZhbGlkICov
Cj4gPiArI2RlZmluZSBWSVJUSU9fTkVUX0hEUl9GX1JTQ19JTkZPICAgIDQgICAgICAgLyogcnNj
X2V4dCBkYXRhIGluIGNzdW1fIGZpZWxkcyAqLwo+ID4gICAgICAgX191OCBmbGFnczsKPiA+ICAg
I2RlZmluZSBWSVJUSU9fTkVUX0hEUl9HU09fTk9ORSAgICAgICAgICAgICAwICAgICAgIC8qIE5v
dCBhIEdTTyBmcmFtZSAqLwo+ID4gICAjZGVmaW5lIFZJUlRJT19ORVRfSERSX0dTT19UQ1BWNCAg
ICAxICAgICAgIC8qIEdTTyBmcmFtZSwgSVB2NCBUQ1AgKFRTTykgKi8KPiA+IEBAIC0xMTgsNiAr
MTE5LDEzIEBAIHN0cnVjdCB2aXJ0aW9fbmV0X2hkcl92MSB7Cj4gPiAgICAgICBfX3ZpcnRpbzE2
IG51bV9idWZmZXJzOyAvKiBOdW1iZXIgb2YgbWVyZ2VkIHJ4IGJ1ZmZlcnMgKi8KPiA+ICAgfTsK
PiA+Cj4gPiArLyoKPiA+ICsgKiBpZiBWSVJUSU9fTkVUX0ZfUlNDX0VYVCBmZWF0dXJlIGhhcyBi
ZWVuIG5lZ290aWF0ZWQgYW5kCj4gPiArICogVklSVElPX05FVF9IRFJfRl9SU0NfSU5GTyBpcyBz
ZXQgaW4gUlggcGFja2V0Cj4gPiArICovCj4gPiArI2RlZmluZSB2aXJ0aW9fbmV0X3JzY19leHRf
bnVtX3BhY2tldHMgICAgICAgY3N1bV9zdGFydAo+ID4gKyNkZWZpbmUgdmlydGlvX25ldF9yc2Nf
ZXh0X251bV9kdXBhY2tzICAgICAgIGNzdW1fb2Zmc2V0Cj4KPgo+IFRoaXMgbG9va3Mgc3ViLW9w
dGltYWwsIGl0IGxvb2tzIHRvIG1lIHVuaW9uIGlzIGJldHRlcj8KClRoaXMgd2FzIGRpc2N1c3Nl
ZCBpbiB2MSwgTVNUIGRlY2lkZWQgdGhlIGRlZmluZSBpcyBiZXR0ZXIuCgo+Cj4gVGhhbmtzCj4K
Pgo+ID4gKwo+ID4gICAjaWZuZGVmIFZJUlRJT19ORVRfTk9fTEVHQUNZCj4gPiAgIC8qIFRoaXMg
aGVhZGVyIGNvbWVzIGZpcnN0IGluIHRoZSBzY2F0dGVyLWdhdGhlciBsaXN0Lgo+ID4gICAgKiBG
b3IgbGVnYWN5IHZpcnRpbywgaWYgVklSVElPX0ZfQU5ZX0xBWU9VVCBpcyBub3QgbmVnb3RpYXRl
ZCwgaXQgbXVzdAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
