Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E400115A628
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 11:20:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F0FB87ADF;
	Wed, 12 Feb 2020 10:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZWg5kzE2p+H; Wed, 12 Feb 2020 10:20:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBB0B878B3;
	Wed, 12 Feb 2020 10:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9B29C0177;
	Wed, 12 Feb 2020 10:19:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22426C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 10:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0CD4F878B3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 10:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zd0Lqz+hUULM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 10:19:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 405B1874BA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581502796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkNV/KaDwN6AKmUOQ5xnMqy8J0aNzbNDziugjPZsXyc=;
 b=KY84ElQB3g5+CtWCJMgA0xKce7366fni3KaBJeEymxomCevTh8bmfwHGUForH5eGhvAL9U
 UZ0DSqJBoO9eLFPoYuc+zLSBN+4XipnLiDi/uZ5JM6TbFl9j3T76m+WonJ2cVMhFVWj3oL
 L96GI+7zoV9ddku9VCZ3m4oJswhiZiM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-U50swvU5Mdix1ENMEcHprw-1; Wed, 12 Feb 2020 05:19:50 -0500
Received: by mail-qk1-f198.google.com with SMTP id o22so1037820qko.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 02:19:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pkNV/KaDwN6AKmUOQ5xnMqy8J0aNzbNDziugjPZsXyc=;
 b=Ci1mm1DKtzqCqbMHrDk5pabAxw7uR+hryV736hNnSRS1VrxhWSiWjJRsvrk8cjhv6C
 ppEt2WppZABlYpjTZmiD4UQ2uwlEfxFRScCH8KJJBGFf9GCI/Q2NZ6eigVwIzbUOawkq
 +wil5sm633+1KzPOGhvbQ2JTvPu+Xt4YG/CCIzqmQpbVvOTYWTPnfnFgtsAvjxlfYbff
 +6zv7CpIoD1rSW5VSUdJeQm0IcbwSDJa8ep3+F7lsC3sQq+8N8FUFZ2UThkvwvOQj1aO
 byuji9RevvM7kGDb82oqdl2erHEkzGVR2CKXas/bDKHReONMxItXBUyIVO1Beva9V9vN
 f+rA==
X-Gm-Message-State: APjAAAXoYl722jik4yCu0ZBEXO6nfyr8rzwYhc5gKwH+P7HUH8m7chYy
 NZbBsyzjnSUalAMbV0kqENYx2pkigb1923AG5hoQhboB3sZAJBJKpOnUaxG9X9txvRE//F3vaAj
 zPymZoNDopsWkQ5FXvsXHh0eVvXjOhjlDoB4IdKC8lg==
X-Received: by 2002:ac8:498f:: with SMTP id f15mr6359536qtq.123.1581502789850; 
 Wed, 12 Feb 2020 02:19:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqz8bIfk3B81LZ2B3XHLSDkzZ+2r6RRQancRdP1l7oFpUpC4EeBkeHbMVGxD5yYdqkLQc9G2DA==
X-Received: by 2002:ac8:498f:: with SMTP id f15mr6359509qtq.123.1581502789462; 
 Wed, 12 Feb 2020 02:19:49 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id s6sm1435263qth.16.2020.02.12.02.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 02:19:48 -0800 (PST)
Date: Wed, 12 Feb 2020 05:19:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200212051913-mutt-send-email-mst@kernel.org>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <8e730fe1-3129-de8d-bcb6-d5e10695238a@cambridgegreys.com>
MIME-Version: 1.0
In-Reply-To: <8e730fe1-3129-de8d-bcb6-d5e10695238a@cambridgegreys.com>
X-MC-Unique: U50swvU5Mdix1ENMEcHprw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
 virtualization@lists.linux-foundation.org
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

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMTA6MDM6MzFBTSArMDAwMCwgQW50b24gSXZhbm92IHdy
b3RlOgo+IAo+IAo+IE9uIDExLzAyLzIwMjAgMTA6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDA3OjQyOjM3QU0gKzAwMDAsIEFudG9uIEl2
YW5vdiB3cm90ZToKPiA+ID4gT24gMTEvMDIvMjAyMCAwMjo1MSwgSmFzb24gV2FuZyB3cm90ZToK
PiA+ID4gPiAKPiA+ID4gPiBPbiAyMDIwLzIvMTEg5LiK5Y2IMTI6NTUsIEFudG9uIEl2YW5vdiB3
cm90ZToKPiA+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPbiAwOS8xMi8yMDE5IDEwOjQ4
LCBhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMuY29tIHdyb3RlOgo+ID4gPiA+ID4gPiBGcm9t
OiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBTb21lIG9mIHRoZSBmcmFtZXMgbWFya2VkIGFzIEdTTyB3aGljaCBh
cnJpdmUgYXQKPiA+ID4gPiA+ID4gdmlydGlvX25ldF9oZHJfZnJvbV9za2IoKSBoYXZlIG5vIEdT
T19UWVBFLCBubwo+ID4gPiA+ID4gPiBmcmFnbWVudHMgKGRhdGFfbGVuID0gMCkgYW5kIGxlbmd0
aCBzaWduaWZpY2FudGx5IHNob3J0ZXIKPiA+ID4gPiA+ID4gdGhhbiB0aGUgTVRVICg3NTIgaW4g
bXkgZXhwZXJpbWVudHMpLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhpcyBpcyBvYnNlcnZl
ZCBvbiByYXcgc29ja2V0cyByZWFkaW5nIG9mZiB2RXRoIGludGVyZmFjZXMKPiA+ID4gPiA+ID4g
aW4gYWxsIDQueCBhbmQgNS54IGtlcm5lbHMgSSB0ZXN0ZWQuCj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiBUaGVzZSBmcmFtZXMgYXJlIHJlcG9ydGVkIGFzIGludmFsaWQgd2hpbGUgdGhleSBhcmUg
aW4gZmFjdAo+ID4gPiA+ID4gPiBnc28tbGVzcyBmcmFtZXMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiBUaGlzIHBhdGNoIG1hcmtzIHRoZSB2bmV0IGhlYWRlciBhcyBuby1HU08gZm9yIHRoZW0g
aW5zdGVhZAo+ID4gPiA+ID4gPiBvZiByZXBvcnRpbmcgaXQgYXMgaW52YWxpZC4KPiA+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92
QGNhbWJyaWRnZWdyZXlzLmNvbT4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ICDCoCBpbmNs
dWRlL2xpbnV4L3ZpcnRpb19uZXQuaCB8IDggKysrKysrLS0KPiA+ID4gPiA+ID4gIMKgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggYi9pbmNs
dWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+ID4gPiA+ID4gPiBpbmRleCAwZDFmZTkyOTdhYzYuLmQ5
MGQ1Y2ZmMWI5YSAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9f
bmV0LmgKPiA+ID4gPiA+ID4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPiA+ID4g
PiA+ID4gQEAgLTExMiw4ICsxMTIsMTIgQEAgc3RhdGljIGlubGluZSBpbnQKPiA+ID4gPiA+ID4g
dmlydGlvX25ldF9oZHJfZnJvbV9za2IoY29uc3Qgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPiA+ID4g
PiA+ID4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9f
TkVUX0hEUl9HU09fVENQVjQ7Cj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBp
ZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BWNikKPiA+ID4gPiA+ID4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fVENQ
VjY7Cj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCBlbHNlCj4gPiA+ID4gPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqAgZWxzZSB7Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChza2ItPmRh
dGFfbGVuID09IDApCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aGRyLT5nc29fdHlwZSA9IFZJUlRJT19ORVRfSERSX0dTT19OT05FOwo+ID4gPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCB9
Cj4gPiA+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNpbmZvLT5nc29fdHlwZSAmIFNL
Ql9HU09fVENQX0VDTikKPiA+ID4gPiA+ID4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhk
ci0+Z3NvX3R5cGUgfD0gVklSVElPX05FVF9IRFJfR1NPX0VDTjsKPiA+ID4gPiA+ID4gIMKgwqDC
oMKgwqAgfSBlbHNlCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBwaW5nLgo+ID4g
PiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gRG8geW91IG1lYW4gZ3NvX3NpemUgaXMgc2V0IGJ1dCBn
c29fdHlwZSBpcyBub3Q/IExvb2tzIGxpa2UgYSBidWcKPiA+ID4gPiBlbHNld2hlcmUuCj4gPiA+
ID4gCj4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+IFllcy4KPiA+ID4gCj4g
PiA+IEkgY291bGQgbm90IHRyYWNlIGl0IHdoZXJlIGl0IGlzIGNvbWluZyBmcm9tLgo+ID4gPiAK
PiA+ID4gSSBzZWUgaXQgd2hlbiBkb2luZyByZWN2bW1zZyBvbiByYXcgc29ja2V0cyBpbiB0aGUg
VU1MIHZlY3RvciBuZXR3b3JrCj4gPiA+IGRyaXZlcnMuCj4gPiA+IAo+ID4gCj4gPiBJIHRoaW5r
IHdlIG5lZWQgdG8gZmluZCB0aGUgY3VscHJpdCBhbmQgZml4IGl0IHRoZXJlLCBsb3RzIG9mIG90
aGVyIHRoaW5ncwo+ID4gY2FuIGJyZWFrIG90aGVyd2lzZS4KPiA+IEp1c3QgcHJpbnRpbmcgb3V0
IHNrYi0+ZGV2LT5uYW1lIHNob3VsZCBkbyB0aGUgdHJpY2ssIG5vPwo+IAo+IEkgd2lsbCByZWJ1
aWxkIG15IHJpZyBhbmQgcmV0ZXN0IChpdCdzIGJlZW4gYSB3aGlsZSBzaW5jZSBJIHdvcmtlZCBv
biB0aGlzIGJ1ZykuCj4gCj4gSW4gdGhlb3J5LCBpdCBzaG91bGQgYmUgdmV0aCAtIHRoZSB0ZXN0
IGlzIG92ZXIgYSB2RXRoIHBhaXIgYW5kIGFsbCBmcmFtZXMgYXJlIGxvY2FsbHkgb3JpZ2luYXRl
ZCBieSBpcGVyZi4KPiAKPiBJbiBwcmFjdGljZSAtIEkgd2lsbCByZXRlc3QgYW5kIHBvc3QgdGhl
IHJlc3VsdHMgc29tZXRpbWVzIGxhdGVyIHRvZGF5Lgo+IAo+IEJyZ2RzLAoKCm9rIGlmIGl0J3Mg
dmV0aCB0aGVuIHlvdSBuZWVkIHRvIGFkZCBhIHNpbWlsYXIgcHJpbnRrIHBhdGNoIHRvIHZldGgK
YW5kIHJlLXJ1biB0byBzZWUgd2hlcmUgZG9lcyBpdCBjb21lIGZyb20gb3JpZ2luYWxseS4KCj4g
Pgo+ID4gCj4gPiAKPiA+ID4gLS0gCj4gPiA+IEFudG9uIFIuIEl2YW5vdgo+ID4gPiBDYW1icmlk
Z2VncmV5cyBMaW1pdGVkLiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQuIENvbXBhbnkgTnVtYmVyIDEw
MjczNjYxCj4gPiA+IGh0dHBzOi8vd3d3LmNhbWJyaWRnZWdyZXlzLmNvbS8KPiA+IAo+ID4gCj4g
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGlu
dXgtdW0gbWFpbGluZyBsaXN0Cj4gPiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXVtCj4gPiAK
PiAKPiAtLSAKPiBBbnRvbiBSLiBJdmFub3YKPiBDYW1icmlkZ2VncmV5cyBMaW1pdGVkLiBSZWdp
c3RlcmVkIGluIEVuZ2xhbmQuIENvbXBhbnkgTnVtYmVyIDEwMjczNjYxCj4gaHR0cHM6Ly93d3cu
Y2FtYnJpZGdlZ3JleXMuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
