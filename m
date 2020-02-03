Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D56541506A1
	for <lists.virtualization@lfdr.de>; Mon,  3 Feb 2020 14:11:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 20A9A86DD3;
	Mon,  3 Feb 2020 13:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VApOUSncmCHx; Mon,  3 Feb 2020 13:11:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 87A3F86963;
	Mon,  3 Feb 2020 13:11:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56B86C0174;
	Mon,  3 Feb 2020 13:11:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9DF13C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 13:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 996B285617
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 13:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9XJ8--rusyQZ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 13:11:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9344B8560E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580735499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bDzdNKtMnDJd7woVNalLK6TuNo4TJSUhpMmpxrJALY=;
 b=FfbZFWAaybBZOGH33kmgimWK5aXD3FWhMM3gJeZDXx66KzPjgDntKbZJvF9Hom7k+rsYto
 sUbHwcClDY7EfqzIerkpq0tzPPfe3CsAn4cyoqxCJ+76JZfueUBT6+u4XKApw8MZenni8Y
 tl6SiLfufjfn/3FJ7B8D98tUojig4AA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-V62quIZjPP6UwbNd15XJig-1; Mon, 03 Feb 2020 08:11:31 -0500
Received: by mail-qv1-f69.google.com with SMTP id r9so9401343qvs.19
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Feb 2020 05:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0bDzdNKtMnDJd7woVNalLK6TuNo4TJSUhpMmpxrJALY=;
 b=atjhnL1rQ2XkdZKj/HCRNAQsNsa3wBx+3MUAsmQOzsGLAfDn3btfN8kQFKTseFYi2D
 JqH3yA0d4bv8REoYsVWGTY3fqjJRKA3QGLDyLW7kW3kOyKiPaqANchrFQNKgxrqmGs7x
 B9uJWvwGPDuGo8OFSOa+Xgc6LUigKgrP86tF1oyV4wEH7O2QxviSQ429uX9ylt8wyCiE
 KB3d7v/MNQAC9xeBTTUckZ/zu65pnko11oxAhC0XLLRvKjmpSTge64EUCgNDsHH6A9Mj
 7TJXQgL9ld5gCPQvmlqksl5Li/bZL3y2LbvdTRT+idkmmKwaLtLVqWjB+obgqyZeVKKb
 cTpg==
X-Gm-Message-State: APjAAAXpyQihMq3U/LK25ic7Cf95gjpuSstDxtVlailDLuLQEqa+A3RN
 w6i6TxK+A2OYup+cWZDXBCigns10yhW+e6wzn+6XZ7PCXtI+8OLXo9UileFrFk+7Oz3PHYuexFN
 BKQzj/lJqPzuC8IKt679JguPjfNPLRJgsIDVOGMLZCA==
X-Received: by 2002:a05:6214:1494:: with SMTP id
 bn20mr13183209qvb.43.1580735491415; 
 Mon, 03 Feb 2020 05:11:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHSBpXmLZKuyScZ8w7dxOq5vQmmMIYOltjH4OVYLPpP6LVTrqrQA6eDy89xiojH1/J71aAdg==
X-Received: by 2002:a05:6214:1494:: with SMTP id
 bn20mr13183181qvb.43.1580735491140; 
 Mon, 03 Feb 2020 05:11:31 -0800 (PST)
Received: from redhat.com (bzq-109-64-11-187.red.bezeqint.net. [109.64.11.187])
 by smtp.gmail.com with ESMTPSA id t23sm9698104qto.88.2020.02.03.05.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 05:11:30 -0800 (PST)
Date: Mon, 3 Feb 2020 08:11:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tyler Sanderson <tysand@google.com>
Subject: Re: Balloon pressuring page cache
Message-ID: <20200203080520-mutt-send-email-mst@kernel.org>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
X-MC-Unique: V62quIZjPP6UwbNd15XJig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>, alexander.h.duyck@linux.intel.com,
 Michal Hocko <mhocko@kernel.org>
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

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6NTk6NDZBTSAtMDgwMCwgVHlsZXIgU2FuZGVyc29u
IHdyb3RlOgo+IAo+IAo+IE9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDc6MzEgQU0gV2FuZywgV2Vp
IFcgPHdlaS53LndhbmdAaW50ZWwuY29tPiB3cm90ZToKPiAKPiAgICAgT24gVGh1cnNkYXksIEph
bnVhcnkgMzAsIDIwMjAgMTE6MDMgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+ICAgICA+
IE9uIDI5LjAxLjIwIDIwOjExLCBUeWxlciBTYW5kZXJzb24gd3JvdGU6Cj4gICAgID4gPgo+ICAg
ICA+ID4KPiAgICAgPiA+IE9uIFdlZCwgSmFuIDI5LCAyMDIwIGF0IDI6MzEgQU0gRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20KPiAgICAgPiA+IDxtYWlsdG86ZGF2aWRAcmVkaGF0
LmNvbT4+IHdyb3RlOgo+ICAgICA+ID4KPiAgICAgPiA+wqAgwqAgwqBPbiAyOS4wMS4yMCAwMToy
MiwgVHlsZXIgU2FuZGVyc29uIHZpYSBWaXJ0dWFsaXphdGlvbiB3cm90ZToKPiAgICAgPiA+wqAg
wqAgwqA+IEEgcHJpbWFyeSBhZHZhbnRhZ2Ugb2YgdmlydGlvIGJhbGxvb24gb3ZlciBvdGhlcsKg
bWVtb3J5IHJlY2xhaW0KPiAgICAgPiA+wqAgwqAgwqA+IG1lY2hhbmlzbXMgaXMgdGhhdCBpdCBj
YW7CoHByZXNzdXJlIHRoZSBndWVzdCdzIHBhZ2UgY2FjaGUgaW50bwo+ICAgICA+ID7CoCDCoCDC
oHNocmlua2luZy4KPiAgICAgPiA+wqAgwqAgwqA+Cj4gICAgID4gPsKgIMKgIMKgPiBIb3dldmVy
LCBzaW5jZSB0aGUgYmFsbG9vbiBkcml2ZXIgY2hhbmdlZCB0byB1c2luZyB0aGUgc2hyaW5rZXIK
PiAgICAgQVBJCj4gICAgID4gPsKgIMKgIMKgPgo+ICAgICA+ID4KPiAgICAgPiA8aHR0cHM6Ly9n
aXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC83MTk5NDYyMGJiMjVhOGIxMDkzODhmZWZh
OQo+ICAgICA+IGU5OWEyOGUzNTUyNTVhI2RpZmYtZmQyMDJhY2Y2OTRkOWViYTE5YzhjNjRkYTNl
NDgwYzk+wqB0aGlzCj4gICAgID4gPsKgIMKgIMKgPiB1c2UgY2FzZSBoYXMgYmVjb21lIGEgYml0
IG1vcmUgdHJpY2t5LiBJJ20gd29uZGVyaW5nIHdoYXQgdGhlCj4gICAgID4gaW50ZW5kZWQKPiAg
ICAgPiA+wqAgwqAgwqA+IGRldmljZSBpbXBsZW1lbnRhdGlvbiBpcy4KPiAgICAgPiA+wqAgwqAg
wqA+Cj4gICAgID4gPsKgIMKgIMKgPiBXaGVuIGluZmxhdGluZyB0aGUgYmFsbG9vbiBhZ2FpbnN0
IHBhZ2UgY2FjaGUgKGkuZS4gbm8gZnJlZQo+ICAgICBtZW1vcnkKPiAgICAgPiA+wqAgwqAgwqA+
IHJlbWFpbnMpIHZtc2Nhbi5jIHdpbGwgYm90aCBzaHJpbmsgcGFnZSBjYWNoZSwgYnV0IGFsc28g
aW52b2tlCj4gICAgIHRoZQo+ICAgICA+ID7CoCDCoCDCoD4gc2hyaW5rZXJzIC0tIGluY2x1ZGlu
ZyB0aGUgYmFsbG9vbidzIHNocmlua2VyLiBTbyB0aGUgYmFsbG9vbgo+ICAgICBkcml2ZXIKPiAg
ICAgPiA+wqAgwqAgwqA+IGFsbG9jYXRlcyBtZW1vcnkgd2hpY2ggcmVxdWlyZXMgcmVjbGFpbSwg
dm1zY2FuIGdldHMgdGhpcyBtZW1vcnkKPiAgICAgPiBieQo+ICAgICA+ID7CoCDCoCDCoD4gc2hy
aW5raW5nIHRoZSBiYWxsb29uLCBhbmQgdGhlbiB0aGUgZHJpdmVyIGFkZHMgdGhlIG1lbW9yeSBi
YWNrCj4gICAgIHRvCj4gICAgID4gdGhlCj4gICAgID4gPsKgIMKgIMKgPiBiYWxsb29uLiBCYXNp
Y2FsbHkgYSBidXN5IG5vLW9wLgo+IAo+ICAgICBQZXIgbXkgdW5kZXJzdGFuZGluZywgdGhlIGJh
bGxvb24gYWxsb2NhdGlvbiB3b27igJl0IGludm9rZSBzaHJpbmtlciBhcwo+ICAgICBfX0dGUF9E
SVJFQ1RfUkVDTEFJTSBpc24ndCBzZXQsIG5vPwo+IAo+IEkgY291bGQgYmUgd3JvbmcgYWJvdXQg
dGhlIG1lY2hhbmlzbSwgYnV0IHRoZSBkZXZpY2Ugc2VlcyBsb3RzIG9mIGFjdGl2aXR5IG9uCj4g
dGhlIGRlZmxhdGUgcXVldWUuIFRoZSBiYWxsb29uIGlzIGJlaW5nIHNocnVuay4gQW5kIHRoaXMg
b25seSBzdGFydHMgb25jZSBhbGwKPiBmcmVlIG1lbW9yeSBpcyBkZXBsZXRlZCBhbmQgd2UncmUg
aW5mbGF0aW5nIGludG8gcGFnZSBjYWNoZS4KClNvIGdpdmVuIHRoaXMgbG9va3MgbGlrZSBhIHJl
Z3Jlc3Npb24sIG1heWJlIHdlIHNob3VsZCByZXZlcnQgdGhlCnBhdGNoIGluIHF1ZXN0aW9uIDcx
OTk0NjIwYmIyNSAoInZpcnRpb19iYWxsb29uOiByZXBsYWNlIG9vbSBub3RpZmllciB3aXRoIHNo
cmlua2VyIikKQmVzaWRlcywgd2l0aCBWSVJUSU9fQkFMTE9PTl9GX0ZSRUVfUEFHRV9ISU5UCnNo
cmlua2VyIGFsc28gaWdub3JlcyBWSVJUSU9fQkFMTE9PTl9GX01VU1RfVEVMTF9IT1NUIHdoaWNo
IGlzbid0IG5pY2UKYXQgYWxsLgoKU28gaXQgbG9va3MgbGlrZSBhbGwgdGhpcyByZXdvcmsgaW50
cm9kdWNlZCBtb3JlIGlzc3VlcyB0aGFuIGl0CmFkZHJlc3NlZCAuLi4KCkkgYWxzbyBDQyBBbGV4
IER1eWNrIGZvciBhbiBvcGluaW9uIG9uIHRoaXMuCkFsZXgsIHdoYXQgZG8geW91IHVzZSB0byBw
dXQgcHJlc3N1cmUgb24gcGFnZSBjYWNoZT8KCgo+IAo+IAo+ICAgICA+ID7CoCDCoCDCoD4KPiAg
ICAgPiA+wqAgwqAgwqA+IElmIGZpbGUgSU8gaXMgb25nb2luZyBkdXJpbmcgdGhpcyBiYWxsb29u
IGluZmxhdGlvbiB0aGVuIHRoZSBwYWdlCj4gICAgID4gPsKgIMKgIMKgY2FjaGUKPiAgICAgPiA+
wqAgwqAgwqA+IGNvdWxkIGJlIGdyb3dpbmcgd2hpY2ggZnVydGhlciBwdXRzICJiYWNrIHByZXNz
dXJlIiBvbiB0aGUKPiAgICAgYmFsbG9vbgo+ICAgICA+ID7CoCDCoCDCoD4gdHJ5aW5nIHRvIGlu
ZmxhdGUuIEluIHRlc3RpbmcgSSd2ZSBzZWVuIHBlcmlvZHMgb2YgPiA0NSBzZWNvbmRzCj4gICAg
IHdoZXJlCj4gICAgID4gPsKgIMKgIMKgPiBiYWxsb29uIGluZmxhdGlvbiBtYWtlcyBubyBuZXQg
Zm9yd2FyZCBwcm9ncmVzcy4KPiAKPiAgICAgSSB0aGluayB0aGlzIGlzIGludGVudGlvbmFsIChi
dXQgY291bGQgYmUgaW1wcm92ZWQpLiBBcyBpbmZsYXRpb24gZG9lcyBub3QKPiAgICAgc3RvcCB3
aGVuIHRoZSBhbGxvY2F0aW9uIGZhaWxzIChpdCBzaW1wbHkgc2xlZXBzIGZvciBhIHdoaWxlIGFu
ZCByZXN1bWVzLi4KPiAgICAgcmVwZWF0IHRpbGwgdGhlcmUgYXJlIG1lbW9yeSB0byBpbmZsYXRl
KQo+ICAgICBUaGF0J3Mgd2h5IHlvdSBzZWUgbm8gaW5mbGF0aW9uIHByb2dyZXNzIGZvciBsb25n
IHRpbWUgdW5kZXIgbWVtb3J5Cj4gICAgIHByZXNzdXJlLgo+IAo+IEFzIG5vdGVkIGFib3ZlIHRo
ZSBkZWZsYXRlIHF1ZXVlIGlzIGFjdGl2ZSwgc28gaXQncyBub3QganVzdCBtZW1vcnkgYWxsb2Nh
dGlvbgo+IGZhaWx1cmVzLgo+IMKgCj4gCj4gCj4gCj4gICAgIEJlc3QsCj4gICAgIFdlaQo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
