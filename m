Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3CA158872
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 03:52:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D238682753;
	Tue, 11 Feb 2020 02:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCMgCEm9FjvA; Tue, 11 Feb 2020 02:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B3678241E;
	Tue, 11 Feb 2020 02:52:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A452C1D8E;
	Tue, 11 Feb 2020 02:52:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F14FC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 028A985CC7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCztUH3QtLwi
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:52:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CB92E83AE3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581389529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KywBuU09rYNz429kY0Ae4epXMjSlQsHT1yqP8FKWMc=;
 b=NbAkF15Q2Wp7r7xt6XQzNBpspF0FTQM6LTT40PsCzCNrx9Meu+oHsmedWTeGnRXiN0o1Z7
 l+LtCuJgdcYAhlw9ZDf6xjY9kkuupLFJwMwBtrFdMg3LzNzuVlgMYK2HP+SlMhGx7yxkHy
 N3sB2xHPJKM22OujMpLOXOZy0pnQxbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-NLmRvZ56OAWtuJp8fyX7Vw-1; Mon, 10 Feb 2020 21:52:05 -0500
X-MC-Unique: NLmRvZ56OAWtuJp8fyX7Vw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17EE510054E3;
 Tue, 11 Feb 2020 02:52:04 +0000 (UTC)
Received: from [10.72.12.184] (ovpn-12-184.pek2.redhat.com [10.72.12.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 733365C10E;
 Tue, 11 Feb 2020 02:51:56 +0000 (UTC)
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>, netdev@vger.kernel.org
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
Date: Tue, 11 Feb 2020 10:51:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: virtualization@lists.linux-foundation.org, linux-um@lists.infradead.org,
 mst@redhat.com
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

Ck9uIDIwMjAvMi8xMSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdyb3RlOgo+Cj4KPiBPbiAw
OS8xMi8yMDE5IDEwOjQ4LCBhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMuY29tIHdyb3RlOgo+
PiBGcm9tOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4+
Cj4+IFNvbWUgb2YgdGhlIGZyYW1lcyBtYXJrZWQgYXMgR1NPIHdoaWNoIGFycml2ZSBhdAo+PiB2
aXJ0aW9fbmV0X2hkcl9mcm9tX3NrYigpIGhhdmUgbm8gR1NPX1RZUEUsIG5vCj4+IGZyYWdtZW50
cyAoZGF0YV9sZW4gPSAwKSBhbmQgbGVuZ3RoIHNpZ25pZmljYW50bHkgc2hvcnRlcgo+PiB0aGFu
IHRoZSBNVFUgKDc1MiBpbiBteSBleHBlcmltZW50cykuCj4+Cj4+IFRoaXMgaXMgb2JzZXJ2ZWQg
b24gcmF3IHNvY2tldHMgcmVhZGluZyBvZmYgdkV0aCBpbnRlcmZhY2VzCj4+IGluIGFsbCA0Lngg
YW5kIDUueCBrZXJuZWxzIEkgdGVzdGVkLgo+Pgo+PiBUaGVzZSBmcmFtZXMgYXJlIHJlcG9ydGVk
IGFzIGludmFsaWQgd2hpbGUgdGhleSBhcmUgaW4gZmFjdAo+PiBnc28tbGVzcyBmcmFtZXMuCj4+
Cj4+IFRoaXMgcGF0Y2ggbWFya3MgdGhlIHZuZXQgaGVhZGVyIGFzIG5vLUdTTyBmb3IgdGhlbSBp
bnN0ZWFkCj4+IG9mIHJlcG9ydGluZyBpdCBhcyBpbnZhbGlkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4+IC0tLQo+
PiDCoCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaCB8IDggKysrKysrLS0KPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvdmlydGlvX25ldC5oIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0
LmgKPj4gaW5kZXggMGQxZmU5Mjk3YWM2Li5kOTBkNWNmZjFiOWEgMTAwNjQ0Cj4+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvdmlydGlvX25ldC5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvdmlydGlvX25l
dC5oCj4+IEBAIC0xMTIsOCArMTEyLDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRpb19uZXRf
aGRyX2Zyb21fc2tiKGNvbnN0IAo+PiBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RDUFY0
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dT
T19UQ1BWNikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSA9IFZJ
UlRJT19ORVRfSERSX0dTT19UQ1BWNjsKPj4gLcKgwqDCoMKgwqDCoMKgIGVsc2UKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNl
IHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNrYi0+ZGF0YV9sZW4gPT0gMCkKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05F
VF9IRFJfR1NPX05PTkU7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDCoMKgwqDC
oMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzaW5mby0+Z3NvX3R5cGUgJiBTS0JfR1NP
X1RDUF9FQ04pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgfD0g
VklSVElPX05FVF9IRFJfR1NPX0VDTjsKPj4gwqDCoMKgwqDCoCB9IGVsc2UKPj4KPgo+IHBpbmcu
Cj4KCkRvIHlvdSBtZWFuIGdzb19zaXplIGlzIHNldCBidXQgZ3NvX3R5cGUgaXMgbm90PyBMb29r
cyBsaWtlIGEgYnVnIGVsc2V3aGVyZS4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
