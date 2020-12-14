Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC252D921D
	for <lists.virtualization@lfdr.de>; Mon, 14 Dec 2020 04:57:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2AC0720426;
	Mon, 14 Dec 2020 03:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQcF9QhTRwRh; Mon, 14 Dec 2020 03:57:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 344C12002E;
	Mon, 14 Dec 2020 03:57:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ADA1C013B;
	Mon, 14 Dec 2020 03:57:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D68B6C013B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C924885A1E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b0-WVRE5SUPQ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:57:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 82A4E854DF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Dec 2020 03:57:30 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id 6so6000110ejz.5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 13 Dec 2020 19:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EJC5ZzsIIq3UAE8aJlS7Xk78x4gMxvFaGCPtz1UbuaQ=;
 b=HwfOEgHg1GNGxCxVE03N9r7iWwYXWMBXk+ZnlrNY5TtBOLwfOJ2Og5DSzJH4jP/7HD
 VbndUjq+bteONBlXkp5z8VAMe7ztwlJalfO2wBgFDERpTsByBrp/TGQBvNsqi4qRYuZF
 z3v5F4J5MrNOY9XgnKWnpiXghRm4BMHgGLOWYXlfrAlNhFDiXc/1dwyo7G5W0J02oOVr
 VbNCmRD+YAl7trsp8BJ5qeT9bpwgiw4crcSmRSQjcPDBFoYTnc6tHKC9ge3JsDF2+VKc
 YZst+BYJoUm3hplXZN0cpflRQWaB+lL6cumUfcZ/nzeS+qkx7HzKklE/OZaNpkZ4FpA2
 km+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EJC5ZzsIIq3UAE8aJlS7Xk78x4gMxvFaGCPtz1UbuaQ=;
 b=Zho6h13NowXYPhP68USrEYfDTwA0EN/vx+YK5FGHSwUUTslf57rTyuGT2PYG+3nwjL
 4d52tNsSlENta46YI8szkGJEbnb+mElmVvp4pwYgeHnwuQBymtoRsUkoPq7dzVmUHodS
 UHiKinM8QLtOa+tkQNgPBLJoiHKSgWubb92x6zBcZrY6rFv0vBueMza2gDZOETaJ7/4g
 /n/RQT4phqwir2jwZfvPUjHreGejjcI2qiS2SMUDtY5Wd8plZfBi+1Z/cRTXyXClzkd+
 rHZz9wl5EvP9OfjjnkzsiAlhmkoB0xHPqVuMJfr9Pm7U0Wuj2x+coDI591//XV0fuH6r
 0uWA==
X-Gm-Message-State: AOAM530CLXbIUgf921ht44uNWz9+HdOas4TpMjpdhDgarIzgfJdr1Jmk
 /rkAqO3cxxoMjUSHf/0q41oB8VxVjavNR873yWI=
X-Google-Smtp-Source: ABdhPJxMQnRsYVVIOUdbGO0aaSenQceYBxS/yvGzUvqIYRohiCnZmm5BQUteacU5TBSqzP3Z7c/cj6fTCvTpTzcJ+x4=
X-Received: by 2002:a17:906:52d9:: with SMTP id
 w25mr20332462ejn.504.1607918248919; 
 Sun, 13 Dec 2020 19:57:28 -0800 (PST)
MIME-Version: 1.0
References: <1606982459-41752-1-git-send-email-wangyunjian@huawei.com>
 <1607517703-18472-1-git-send-email-wangyunjian@huawei.com>
 <CA+FuTSfQoDr0jd76xBXSvchhyihQaL2UQXeCR6frJ7hyXxbmVA@mail.gmail.com>
 <34EFBCA9F01B0748BEB6B629CE643AE60DB6E3B3@dggemm513-mbx.china.huawei.com>
 <CA+FuTSdVJa4JQzzybZ17WDcfokA2RZ043kh5++Zgy5aNNebj0A@mail.gmail.com>
 <CAF=yD-LF+j1vpzKDtBVUi22ZkTCEnMAXgfLfoQTBO+95D6RGRA@mail.gmail.com>
 <75c625df-3ac8-79ba-d1c5-3b6d1f9b108b@redhat.com>
 <CAF=yD-+Hcg8cNo2qMfpGOWRORJskZR3cPPEE61neg7xFWkVh8w@mail.gmail.com>
In-Reply-To: <CAF=yD-+Hcg8cNo2qMfpGOWRORJskZR3cPPEE61neg7xFWkVh8w@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sun, 13 Dec 2020 22:56:52 -0500
Message-ID: <CAF=yD-JHO3SaxaHAZJ8nZ1jy8Zp4hMt1EhP3abutA5zczgTv5g@mail.gmail.com>
Subject: Re: [PATCH net v2] tun: fix ubuf refcount incorrectly on error path
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>,
 wangyunjian <wangyunjian@huawei.com>,
 "Lilijun \(Jerry\)" <jerry.lilijun@huawei.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, xudingke <xudingke@huawei.com>,
 "huangbin \(J\)" <brian.huangbin@huawei.com>,
 chenchanghu <chenchanghu@huawei.com>
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

T24gU3VuLCBEZWMgMTMsIDIwMjAgYXQgMTA6NTQgUE0gV2lsbGVtIGRlIEJydWlqbgo8d2lsbGVt
ZGVicnVpam4ua2VybmVsQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBTdW4sIERlYyAxMywgMjAy
MCBhdCAxMDozMCBQTSBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPiB3cm90ZToKPiA+
Cj4gPgo+ID4gT24gMjAyMC8xMi8xNCDkuIrljYg5OjMyLCBXaWxsZW0gZGUgQnJ1aWpuIHdyb3Rl
Ogo+ID4gPiBPbiBTYXQsIERlYyAxMiwgMjAyMCBhdCA3OjE4IFBNIFdpbGxlbSBkZSBCcnVpam4K
PiA+ID4gPHdpbGxlbWRlYnJ1aWpuLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPj4+Pj4g
YWZ0ZXJ3YXJkcywgdGhlIGVycm9yIGhhbmRsaW5nIGluIHZob3N0IGhhbmRsZV90eCgpIHdpbGwg
dHJ5IHRvCj4gPiA+Pj4+PiBkZWNyZWFzZSB0aGUgc2FtZSByZWZjb3VudCBhZ2Fpbi4gVGhpcyBp
cyB3cm9uZyBhbmQgZml4IHRoaXMgYnkgZGVsYXkKPiA+ID4+Pj4+IGNvcHlpbmcgdWJ1Zl9pbmZv
IHVudGlsIHdlJ3JlIHN1cmUgdGhlcmUncyBubyBlcnJvcnMuCj4gPiA+Pj4+IEkgdGhpbmsgdGhl
IHJpZ2h0IGFwcHJvYWNoIGlzIHRvIGFkZHJlc3MgdGhpcyBpbiB0aGUgZXJyb3IgcGF0aHMsIHJh
dGhlciB0aGFuCj4gPiA+Pj4+IGNvbXBsaWNhdGUgdGhlIG5vcm1hbCBkYXRhcGF0aC4KPiA+ID4+
Pj4KPiA+ID4+Pj4gSXMgaXQgc3VmZmljaWVudCB0byBzdXBwcmVzcyB0aGUgY2FsbCB0byB2aG9z
dF9uZXRfdWJ1Zl9wdXQgaW4gdGhlIGhhbmRsZV90eAo+ID4gPj4+PiBzZW5kbXNnIGVycm9yIHBh
dGgsIGdpdmVuIHRoYXQgdmhvc3RfemVyb2NvcHlfY2FsbGJhY2sgd2lsbCBiZSBjYWxsZWQgb24K
PiA+ID4+Pj4ga2ZyZWVfc2tiPwo+ID4gPj4+IFdlIGNhbiBub3QgY2FsbCBrZnJlZV9za2IoKSB1
bnRpbCB0aGUgc2tiIHdhcyBjcmVhdGVkLgo+ID4gPj4+Cj4gPiA+Pj4+IE9yIGFsdGVybmF0aXZl
bHkgY2xlYXIgdGhlIGRlc3RydWN0b3IgaW4gZHJvcDoKPiA+ID4+PiBUaGUgdWFyZy0+Y2FsbGJh
Y2soKSBpcyBjYWxsZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgd2UgZGVjaWRlIGRvIGRhdGFjb3B5Cj4g
PiA+Pj4gZXZlbiBpZiBjYWxsZXIgd2FudCB0byBkbyB6ZXJvY29weS4gSWYgYW5vdGhlciBlcnJv
ciBvY2N1cnMgbGF0ZXIsIHRoZSB2aG9zdAo+ID4gPj4+IGhhbmRsZV90eCgpIHdpbGwgdHJ5IHRv
IGRlY3JlYXNlIGl0IGFnYWluLgo+ID4gPj4gT2ggcmlnaHQsIEkgbWlzc2VkIHRoZSBlbHNlIGJy
YW5jaCBpbiB0aGlzIHBhdGg6Cj4gPiA+Pgo+ID4gPj4gICAgICAgICAgLyogY29weSBza2JfdWJ1
Zl9pbmZvIGZvciBjYWxsYmFjayB3aGVuIHNrYiBoYXMgbm8gZXJyb3IgKi8KPiA+ID4+ICAgICAg
ICAgIGlmICh6ZXJvY29weSkgewo+ID4gPj4gICAgICAgICAgICAgICAgICBza2Jfc2hpbmZvKHNr
YiktPmRlc3RydWN0b3JfYXJnID0gbXNnX2NvbnRyb2w7Cj4gPiA+PiAgICAgICAgICAgICAgICAg
IHNrYl9zaGluZm8oc2tiKS0+dHhfZmxhZ3MgfD0gU0tCVFhfREVWX1pFUk9DT1BZOwo+ID4gPj4g
ICAgICAgICAgICAgICAgICBza2Jfc2hpbmZvKHNrYiktPnR4X2ZsYWdzIHw9IFNLQlRYX1NIQVJF
RF9GUkFHOwo+ID4gPj4gICAgICAgICAgfSBlbHNlIGlmIChtc2dfY29udHJvbCkgewo+ID4gPj4g
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgdWJ1Zl9pbmZvICp1YXJnID0gbXNnX2NvbnRyb2w7Cj4g
PiA+PiAgICAgICAgICAgICAgICAgIHVhcmctPmNhbGxiYWNrKHVhcmcsIGZhbHNlKTsKPiA+ID4+
ICAgICAgICAgIH0KPiA+ID4+Cj4gPiA+PiBTbyBpZiBoYW5kbGVfdHhfemVyb2NvcHkgY2FsbHMg
dHVuX3NlbmRtc2cgd2l0aCB1YnVmX2luZm8gKGFuZCB0aHVzIGEKPiA+ID4+IHJlZmVyZW5jZSB0
byByZWxlYXNlKSwgdGhlcmUgYXJlIHRoZXNlIGZpdmUgb3B0aW9uczoKPiA+ID4+Cj4gPiA+PiAx
LiB0dW5fc2VuZG1zZyBzdWNjZWVkcywgdWJ1Zl9pbmZvIGlzIGFzc29jaWF0ZWQgd2l0aCBza2Iu
Cj4gPiA+PiAgICAgICByZWZlcmVuY2UgcmVsZWFzZWQgZnJvbSBrZnJlZV9za2IgY2FsbGluZyB2
aG9zdF96ZXJvY29weV9jYWxsYmFjayBsYXRlcgo+ID4gPj4KPiA+ID4+IDIuIHR1bl9zZW5kbXNn
IHN1Y2NlZWRzLCB1YnVmX2luZm8gaXMgcmVsZWFzZWQgaW1tZWRpYXRlbHksIGFzIHNrYiBpcwo+
ID4gPj4gbm90IHplcm9jb3B5Lgo+ID4gPj4KPiA+ID4+IDMuIHR1bl9zZW5kbXNnIGZhaWxzIGJl
Zm9yZSBjcmVhdGluZyBza2IsIGhhbmRsZV90eF96ZXJvY29weSBjb3JyZWN0bHkKPiA+ID4+IGNs
ZWFucyB1cCBvbiByZWNlaXZpbmcgZXJyb3IgZnJvbSB0dW5fc2VuZG1zZy4KPiA+ID4+Cj4gPiA+
PiA0LiB0dW5fc2VuZG1zZyBmYWlscyBhZnRlciBjcmVhdGluZyBza2IsIGJ1dCB3aXRoIGNvcHlp
bmc6IGRlY3JlbWVudGVkCj4gPiA+PiBhdCBicmFuY2ggc2hvd24gYWJvdmUgKyBhZ2FpbiBpbiBo
YW5kbGVfdHhfemVyb2NvcHkKPiA+ID4+Cj4gPiA+PiA1LiB0dW5fc2VuZG1zZyBmYWlscyBhZnRl
ciBjcmVhdGluZyBza2IsIHdpdGggemVyb2NvcHk6IGRlY3JlbWVudGVkIGF0Cj4gPiA+PiBrZnJl
ZV9za2IgaW4gZHJvcDogKyBhZ2FpbiBpbiBoYW5kbGVfdHhfemVyb2NvcHkKPiA+ID4+Cj4gPiA+
PiBTaW5jZSBoYW5kbGVfdHhfemVyb2NvcHkgaGFzIG5vIGlkZWEgd2hldGhlciBvbiBlcnJvciAz
LCA0IG9yIDUKPiA+ID4+IG9jY3VycmVkLAo+ID4gPiBBY3R1YWxseSwgaXQgZG9lcy4gSWYgc2Vu
ZG1zZyByZXR1cm5zIGFuIGVycm9yLCBpdCBjYW4gdGVzdCB3aGV0aGVyCj4gPiA+IHZxLT5oZWFk
c1tudnEtPnVwZW5kX2lkeF0ubGVuICE9IFZIT1NUX0RNQV9JTl9QUk9HUkVTUy4KPiA+Cj4gPgo+
ID4gSnVzdCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kIHRoaXMuIEFueSByZWFzb24gZm9yIGl0
IGNhbid0IGJlCj4gPiBWSE9TVF9ETUFfSU5fUFJPR1JFU1MgaGVyZT8KPgo+IEl0IGNhbiBiZSwg
YW5kIGl0IHdpbGwgYmUgaWYgdHVuX3NlbmRtc2cgcmV0dXJucyBFSU5WQUwgYmVmb3JlCj4gYXNz
aWduaW5nIHRoZSBza2IgZGVzdHJ1Y3Rvci4KCkkgbWVhbnQgcmV0dXJucyBhbiBlcnJvciwgbm90
IG5lY2Vzc2FyaWx5IG9ubHkgRUlOVkFMLgoKPiBPbmx5IGlmIHR1bl9zZW5kbXNnIHJlbGVhc2Vk
IHRoZSB6ZXJvY29weSBzdGF0ZSB0aHJvdWdoCj4ga2ZyZWVfc2tiLT52aG9zdF96ZXJvY29weV9j
YWxsYmFjayB3aWxsIGl0IGhhdmUgYmVlbiB1cGRhdGVkIHRvCj4gVkhPU1RfRE1BX0RPTkVfTEVO
LiBBbmQgb25seSB0aGVuIG11c3QgdGhlIGNhbGxlciBub3QgdHJ5IHRvIHJlbGVhc2UKPiB0aGUg
c3RhdGUgYWdhaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
