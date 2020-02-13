Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323815B7C8
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 04:31:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9534D86B2B;
	Thu, 13 Feb 2020 03:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YP2pPtk3eBj1; Thu, 13 Feb 2020 03:31:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B46F086B2D;
	Thu, 13 Feb 2020 03:31:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85518C0177;
	Thu, 13 Feb 2020 03:31:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB0F6C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C23C5864EF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFV0qqelbDXh
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:31:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8E43B85EC1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 03:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581564710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x48Xkc/52KhxaaQHOFtPu2ZMXbY1JrtqvmLAgLZ6e18=;
 b=FH9x6luT7zbwkF3AkMzp/fDwr5KGVJq72mSEz2i5ik35Bf6XbzD1z3rfJlZzNsymoLp03I
 HxCTVknf4Qo7H43+/l8Rpw+eS+4nG9/jDeEuVyueY8i7xbA6hV1RN+4ocFymkciILRLHQd
 q/7XATrDWOwwjbxo/IOQCLzW2bOGix4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-qgUXa6ttM3qy-xfPilOMbw-1; Wed, 12 Feb 2020 22:31:45 -0500
X-MC-Unique: qgUXa6ttM3qy-xfPilOMbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6555D1005502;
 Thu, 13 Feb 2020 03:31:44 +0000 (UTC)
Received: from [10.72.13.212] (ovpn-13-212.pek2.redhat.com [10.72.13.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3CA35C1B2;
 Thu, 13 Feb 2020 03:31:39 +0000 (UTC)
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <71193f51-9606-58ba-39d7-904bc9fbd29a@redhat.com>
Date: Thu, 13 Feb 2020 11:31:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMi8xMyDkuIrljYgxOjM4LCBBbnRvbiBJdmFub3Ygd3JvdGU6Cj4KPgo+IE9uIDEx
LzAyLzIwMjAgMTA6MzcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4gT24gVHVlLCBGZWIg
MTEsIDIwMjAgYXQgMDc6NDI6MzdBTSArMDAwMCwgQW50b24gSXZhbm92IHdyb3RlOgo+Pj4gT24g
MTEvMDIvMjAyMCAwMjo1MSwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pgo+Pj4+IE9uIDIwMjAvMi8x
MSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdyb3RlOgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBPbiAw
OS8xMi8yMDE5IDEwOjQ4LCBhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMuY29tIHdyb3RlOgo+
Pj4+Pj4gRnJvbTogQW50b24gSXZhbm92IDxhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMuY29t
Pgo+Pj4+Pj4KPj4+Pj4+IFNvbWUgb2YgdGhlIGZyYW1lcyBtYXJrZWQgYXMgR1NPIHdoaWNoIGFy
cml2ZSBhdAo+Pj4+Pj4gdmlydGlvX25ldF9oZHJfZnJvbV9za2IoKSBoYXZlIG5vIEdTT19UWVBF
LCBubwo+Pj4+Pj4gZnJhZ21lbnRzIChkYXRhX2xlbiA9IDApIGFuZCBsZW5ndGggc2lnbmlmaWNh
bnRseSBzaG9ydGVyCj4+Pj4+PiB0aGFuIHRoZSBNVFUgKDc1MiBpbiBteSBleHBlcmltZW50cyku
Cj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpcyBvYnNlcnZlZCBvbiByYXcgc29ja2V0cyByZWFkaW5nIG9m
ZiB2RXRoIGludGVyZmFjZXMKPj4+Pj4+IGluIGFsbCA0LnggYW5kIDUueCBrZXJuZWxzIEkgdGVz
dGVkLgo+Pj4+Pj4KPj4+Pj4+IFRoZXNlIGZyYW1lcyBhcmUgcmVwb3J0ZWQgYXMgaW52YWxpZCB3
aGlsZSB0aGV5IGFyZSBpbiBmYWN0Cj4+Pj4+PiBnc28tbGVzcyBmcmFtZXMuCj4+Pj4+Pgo+Pj4+
Pj4gVGhpcyBwYXRjaCBtYXJrcyB0aGUgdm5ldCBoZWFkZXIgYXMgbm8tR1NPIGZvciB0aGVtIGlu
c3RlYWQKPj4+Pj4+IG9mIHJlcG9ydGluZyBpdCBhcyBpbnZhbGlkLgo+Pj4+Pj4KPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNv
bT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaCB8IDgg
KysrKysrLS0KPj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0
aW9fbmV0LmggYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+Pj4+Pj4gaW5kZXggMGQxZmU5
Mjk3YWM2Li5kOTBkNWNmZjFiOWEgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Zp
cnRpb19uZXQuaAo+Pj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4+
IEBAIC0xMTIsOCArMTEyLDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50Cj4+Pj4+PiB2aXJ0aW9fbmV0
X2hkcl9mcm9tX3NrYihjb25zdCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAo+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RD
UFY0Owo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoc2luZm8tPmdzb190eXBl
ICYgU0tCX0dTT19UQ1BWNikKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRy
LT5nc29fdHlwZSA9IFZJUlRJT19ORVRfSERSX0dTT19UQ1BWNjsKPj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBlbHNlCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsK
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlIHsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChza2ItPmRhdGFfbGVuID09IDApCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fTk9ORTsKPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNpbmZvLT5nc29fdHlwZSAmIFNLQl9HU09fVENQ
X0VDTikKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSB8
PSBWSVJUSU9fTkVUX0hEUl9HU09fRUNOOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIH0gZWxzZQo+Pj4+
Pj4KPj4+Pj4KPj4+Pj4gcGluZy4KPj4+Pj4KPj4+Pgo+Pj4+IERvIHlvdSBtZWFuIGdzb19zaXpl
IGlzIHNldCBidXQgZ3NvX3R5cGUgaXMgbm90PyBMb29rcyBsaWtlIGEgYnVnCj4+Pj4gZWxzZXdo
ZXJlLgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4KPj4+Pgo+Pj4gWWVzLgo+Pj4KPj4+IEkgY291bGQg
bm90IHRyYWNlIGl0IHdoZXJlIGl0IGlzIGNvbWluZyBmcm9tLgo+Pj4KPj4+IEkgc2VlIGl0IHdo
ZW4gZG9pbmcgcmVjdm1tc2cgb24gcmF3IHNvY2tldHMgaW4gdGhlIFVNTCB2ZWN0b3IgbmV0d29y
awo+Pj4gZHJpdmVycy4KPj4+Cj4+Cj4+IEkgdGhpbmsgd2UgbmVlZCB0byBmaW5kIHRoZSBjdWxw
cml0IGFuZCBmaXggaXQgdGhlcmUsIGxvdHMgb2Ygb3RoZXIgCj4+IHRoaW5ncwo+PiBjYW4gYnJl
YWsgb3RoZXJ3aXNlLgo+PiBKdXN0IHByaW50aW5nIG91dCBza2ItPmRldi0+bmFtZSBzaG91bGQg
ZG8gdGhlIHRyaWNrLCBubz8KPgo+IFRoZSBwcmludGsgaW4gdmlydGlvX25ldF9oZHJfZnJvbV9z
a2Igc2F5cyBOVUxMLgo+Cj4gVGhhdCBpcyBwcm9iYWJseSBub3JtYWwgZm9yIGEgbG9jYWxseSBv
cmlnaW5hdGVkIGZyYW1lLgo+Cj4gSSBjYW5ub3QgcmVwcm9kdWNlIHRoaXMgd2l0aCBuZXR3b3Jr
IHRyYWZmaWMgYnkgdGhlIHdheSAtIGl0IGhhcHBlbnMgCj4gb25seSBpZiB0aGUgdHJhZmZpYyBp
cyBsb2NhbGx5IG9yaWdpbmF0ZWQgb24gdGhlIGhvc3QuCj4KPiBBLAoKCk9yIG1heWJlIHlvdSBj
YW4gdHJ5IGFkZCBkdW1wX3N0YWNrKCkgdGhlcmUuCgpUaGFua3MKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
