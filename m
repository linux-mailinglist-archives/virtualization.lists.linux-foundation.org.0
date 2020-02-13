Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF615BC42
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 11:00:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 949E187E93;
	Thu, 13 Feb 2020 10:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jA278U+w57bV; Thu, 13 Feb 2020 10:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0516C8776C;
	Thu, 13 Feb 2020 10:00:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C948CC0177;
	Thu, 13 Feb 2020 10:00:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98639C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 937AD8776C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROi8H0FsICuX
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:00:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 54C8F856B6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581588041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ytg6S/SjmgY27QCPpYz1CiXOXhwp3fWgAbdebdN5iyM=;
 b=KcDEm7S7Aggh5kVy4PnaVsO2wjeYrNcA41QNPBRzbjg3bL/FcXOid6WyJ1tepyIFwVNThO
 lmBCYrLlH5E4xhLgszYEsa9s8aQzMOwUV7SX3JfmxzhRdaXjPYWFMk+YwglMHNUlB5X6k7
 oPW0neu9FGNCE6KqYwuaRh0jLX8o6GA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-nwim-riDOiqrH8hKrz6pOw-1; Thu, 13 Feb 2020 05:00:36 -0500
Received: by mail-qt1-f197.google.com with SMTP id u40so2932571qtk.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 02:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ytg6S/SjmgY27QCPpYz1CiXOXhwp3fWgAbdebdN5iyM=;
 b=YjVCtEz8texk3N6bS8Z7euxvxy0njs0bBBBi5tQJwVupy9pyMqvtPea/6d5iEE8QX+
 oglm3C8vQqPOemUorwQ+1expPiOomdHYgX3MNbYjKsTNJLZ0ZHQeLJpb9pVpk7A+kZlr
 grCtGfexvpq3Wq9PJvtYTbwiqldlMtYZLViDqbdrx5TpHc4xffcUBQ42YuSEmHsITP45
 oAgbEulDajIe22o1x1mzZ/8HcilAFNVvVADkFJ8q5F8xWzZEF4zic/vXF+alugRH0oyy
 KVwPSgGrPr+4yiv3via7VqRU3x87Znha0cMsyWTWVNzPHMebS6/tiEaK/E8RCO5IZ8E/
 EUlA==
X-Gm-Message-State: APjAAAUTNMA3m7RTUz7ubUIFVEI6Kja+/+W4FRXj4bptAXwtsz0LSKjh
 PlB2g3cM82ESb8OKn+/nDdVV1UmpLzSyfU+OxGlNofdbgJfBijdlH3etslaZZIZRJb/c9dGUuVn
 4IILeLUyK8Rh3mPGUCID3TprZoQFn3+PjYwqKCTGcCg==
X-Received: by 2002:ac8:5486:: with SMTP id h6mr11035482qtq.17.1581588035511; 
 Thu, 13 Feb 2020 02:00:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5YIEiMuYiBy1dpXQWozHdfbbuS4aN+XNzTRes1+I7PcyUDz39RveWTfedPrdmALPyWPBi8w==
X-Received: by 2002:ac8:5486:: with SMTP id h6mr11035446qtq.17.1581588035063; 
 Thu, 13 Feb 2020 02:00:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 g6sm1030372qki.100.2020.02.13.02.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 02:00:34 -0800 (PST)
Date: Thu, 13 Feb 2020 05:00:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200213045937-mutt-send-email-mst@kernel.org>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
MIME-Version: 1.0
In-Reply-To: <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
X-MC-Unique: nwim-riDOiqrH8hKrz6pOw-1
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

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDU6Mzg6MDlQTSArMDAwMCwgQW50b24gSXZhbm92IHdy
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
IHNrYi0+ZGV2LT5uYW1lIHNob3VsZCBkbyB0aGUgdHJpY2ssIG5vPwo+IAo+IFRoZSBwcmludGsg
aW4gdmlydGlvX25ldF9oZHJfZnJvbV9za2Igc2F5cyBOVUxMLgo+IAo+IFRoYXQgaXMgcHJvYmFi
bHkgbm9ybWFsIGZvciBhIGxvY2FsbHkgb3JpZ2luYXRlZCBmcmFtZS4KPiAKPiBJIGNhbm5vdCBy
ZXByb2R1Y2UgdGhpcyB3aXRoIG5ldHdvcmsgdHJhZmZpYyBieSB0aGUgd2F5IC0gaXQgaGFwcGVu
cyBvbmx5IGlmIHRoZSB0cmFmZmljIGlzIGxvY2FsbHkgb3JpZ2luYXRlZCBvbiB0aGUgaG9zdC4K
PiAKPiBBLAoKT0sgc28gaXMgaXQgY29kZSBpbiBfX3RjcF90cmFuc21pdF9za2IgdGhhdCBzZXRz
IGdzb19zaXplIHRvIG5vbi1udWxsCndoZW4gZ3NvX3R5cGUgaXMgMD8KCgo+ID4gCj4gPiAKPiA+
ID4gLS0gCj4gPiA+IEFudG9uIFIuIEl2YW5vdgo+ID4gPiBDYW1icmlkZ2VncmV5cyBMaW1pdGVk
LiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQuIENvbXBhbnkgTnVtYmVyIDEwMjczNjYxCj4gPiA+IGh0
dHBzOi8vd3d3LmNhbWJyaWRnZWdyZXlzLmNvbS8KPiA+IAo+ID4gCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtdW0gbWFpbGluZyBs
aXN0Cj4gPiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXVtCj4gPiAKPiAKPiAtLSAKPiBBbnRv
biBSLiBJdmFub3YKPiBDYW1icmlkZ2VncmV5cyBMaW1pdGVkLiBSZWdpc3RlcmVkIGluIEVuZ2xh
bmQuIENvbXBhbnkgTnVtYmVyIDEwMjczNjYxCj4gaHR0cHM6Ly93d3cuY2FtYnJpZGdlZ3JleXMu
Y29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
