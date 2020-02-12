Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1E815AEDD
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 18:38:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0B7A85ABF;
	Wed, 12 Feb 2020 17:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2gh4SXbVbyT; Wed, 12 Feb 2020 17:38:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A477085B3D;
	Wed, 12 Feb 2020 17:38:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 853C5C0177;
	Wed, 12 Feb 2020 17:38:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42386C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 17:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 36D4E204D7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 17:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qpOHsO3bPwk
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 17:38:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by silver.osuosl.org (Postfix) with ESMTPS id B9B252048D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 17:38:15 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j1vxk-00050o-Aa; Wed, 12 Feb 2020 17:38:12 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j1vxh-0002ep-QX; Wed, 12 Feb 2020 17:38:11 +0000
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Message-ID: <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
Date: Wed, 12 Feb 2020 17:38:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211053502-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
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

CgpPbiAxMS8wMi8yMDIwIDEwOjM3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24gVHVl
LCBGZWIgMTEsIDIwMjAgYXQgMDc6NDI6MzdBTSArMDAwMCwgQW50b24gSXZhbm92IHdyb3RlOgo+
PiBPbiAxMS8wMi8yMDIwIDAyOjUxLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4KPj4+IE9uIDIwMjAv
Mi8xMSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiAw
OS8xMi8yMDE5IDEwOjQ4LCBhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMuY29tIHdyb3RlOgo+
Pj4+PiBGcm9tOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+
Cj4+Pj4+Cj4+Pj4+IFNvbWUgb2YgdGhlIGZyYW1lcyBtYXJrZWQgYXMgR1NPIHdoaWNoIGFycml2
ZSBhdAo+Pj4+PiB2aXJ0aW9fbmV0X2hkcl9mcm9tX3NrYigpIGhhdmUgbm8gR1NPX1RZUEUsIG5v
Cj4+Pj4+IGZyYWdtZW50cyAoZGF0YV9sZW4gPSAwKSBhbmQgbGVuZ3RoIHNpZ25pZmljYW50bHkg
c2hvcnRlcgo+Pj4+PiB0aGFuIHRoZSBNVFUgKDc1MiBpbiBteSBleHBlcmltZW50cykuCj4+Pj4+
Cj4+Pj4+IFRoaXMgaXMgb2JzZXJ2ZWQgb24gcmF3IHNvY2tldHMgcmVhZGluZyBvZmYgdkV0aCBp
bnRlcmZhY2VzCj4+Pj4+IGluIGFsbCA0LnggYW5kIDUueCBrZXJuZWxzIEkgdGVzdGVkLgo+Pj4+
Pgo+Pj4+PiBUaGVzZSBmcmFtZXMgYXJlIHJlcG9ydGVkIGFzIGludmFsaWQgd2hpbGUgdGhleSBh
cmUgaW4gZmFjdAo+Pj4+PiBnc28tbGVzcyBmcmFtZXMuCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2gg
bWFya3MgdGhlIHZuZXQgaGVhZGVyIGFzIG5vLUdTTyBmb3IgdGhlbSBpbnN0ZWFkCj4+Pj4+IG9m
IHJlcG9ydGluZyBpdCBhcyBpbnZhbGlkLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnRv
biBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4+Pj4+IC0tLQo+Pj4+
PiAgwqAgaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggfCA4ICsrKysrKy0tCj4+Pj4+ICDCoCAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggYi9pbmNsdWRlL2xpbnV4
L3ZpcnRpb19uZXQuaAo+Pj4+PiBpbmRleCAwZDFmZTkyOTdhYzYuLmQ5MGQ1Y2ZmMWI5YSAxMDA2
NDQKPj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4gKysrIGIvaW5j
bHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4gQEAgLTExMiw4ICsxMTIsMTIgQEAgc3RhdGlj
IGlubGluZSBpbnQKPj4+Pj4gdmlydGlvX25ldF9oZHJfZnJvbV9za2IoY29uc3Qgc3RydWN0IHNr
X2J1ZmYgKnNrYiwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5
cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fVENQVjQ7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAg
ZWxzZSBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BWNikKPj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fVENQ
VjY7Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZSB7Cj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChza2ItPmRhdGFfbGVuID09IDApCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSA9IFZJUlRJT19ORVRfSERS
X0dTT19OT05FOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCB9Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNpbmZvLT5nc29fdHlwZSAm
IFNLQl9HU09fVENQX0VDTikKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+
Z3NvX3R5cGUgfD0gVklSVElPX05FVF9IRFJfR1NPX0VDTjsKPj4+Pj4gIMKgwqDCoMKgwqAgfSBl
bHNlCj4+Pj4+Cj4+Pj4KPj4+PiBwaW5nLgo+Pj4+Cj4+Pgo+Pj4gRG8geW91IG1lYW4gZ3NvX3Np
emUgaXMgc2V0IGJ1dCBnc29fdHlwZSBpcyBub3Q/IExvb2tzIGxpa2UgYSBidWcKPj4+IGVsc2V3
aGVyZS4KPj4+Cj4+PiBUaGFua3MKPj4+Cj4+Pgo+PiBZZXMuCj4+Cj4+IEkgY291bGQgbm90IHRy
YWNlIGl0IHdoZXJlIGl0IGlzIGNvbWluZyBmcm9tLgo+Pgo+PiBJIHNlZSBpdCB3aGVuIGRvaW5n
IHJlY3ZtbXNnIG9uIHJhdyBzb2NrZXRzIGluIHRoZSBVTUwgdmVjdG9yIG5ldHdvcmsKPj4gZHJp
dmVycy4KPj4KPiAKPiBJIHRoaW5rIHdlIG5lZWQgdG8gZmluZCB0aGUgY3VscHJpdCBhbmQgZml4
IGl0IHRoZXJlLCBsb3RzIG9mIG90aGVyIHRoaW5ncwo+IGNhbiBicmVhayBvdGhlcndpc2UuCj4g
SnVzdCBwcmludGluZyBvdXQgc2tiLT5kZXYtPm5hbWUgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/
CgpUaGUgcHJpbnRrIGluIHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiIHNheXMgTlVMTC4KClRoYXQg
aXMgcHJvYmFibHkgbm9ybWFsIGZvciBhIGxvY2FsbHkgb3JpZ2luYXRlZCBmcmFtZS4KCkkgY2Fu
bm90IHJlcHJvZHVjZSB0aGlzIHdpdGggbmV0d29yayB0cmFmZmljIGJ5IHRoZSB3YXkgLSBpdCBo
YXBwZW5zIG9ubHkgaWYgdGhlIHRyYWZmaWMgaXMgbG9jYWxseSBvcmlnaW5hdGVkIG9uIHRoZSBo
b3N0LgoKQSwKCj4gCj4gCj4+IC0tIAo+PiBBbnRvbiBSLiBJdmFub3YKPj4gQ2FtYnJpZGdlZ3Jl
eXMgTGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kLiBDb21wYW55IE51bWJlciAxMDI3MzY2
MQo+PiBodHRwczovL3d3dy5jYW1icmlkZ2VncmV5cy5jb20vCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC11bSBtYWlsaW5nIGxp
c3QKPiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC11bQo+IAoKLS0gCkFudG9uIFIuIEl2YW5vdgpD
YW1icmlkZ2VncmV5cyBMaW1pdGVkLiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQuIENvbXBhbnkgTnVt
YmVyIDEwMjczNjYxCmh0dHBzOi8vd3d3LmNhbWJyaWRnZWdyZXlzLmNvbS8KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
