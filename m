Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC3158A8F
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 08:42:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 88B4E846AD;
	Tue, 11 Feb 2020 07:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-2rbtNDT61U; Tue, 11 Feb 2020 07:42:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4F164843BB;
	Tue, 11 Feb 2020 07:42:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39E9EC07FE;
	Tue, 11 Feb 2020 07:42:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E00B3C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 07:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CDE6285487
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 07:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43csjsxcho7I
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 07:42:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AE40A8547D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 07:42:43 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j1QBs-0007Vn-1k; Tue, 11 Feb 2020 07:42:40 +0000
Received: from sleer.kot-begemot.co.uk ([192.168.3.72])
 by jain.kot-begemot.co.uk with esmtps
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j1QBp-0007Nw-Mr; Tue, 11 Feb 2020 07:42:39 +0000
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: Jason Wang <jasowang@redhat.com>, netdev@vger.kernel.org
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
Date: Tue, 11 Feb 2020 07:42:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
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

T24gMTEvMDIvMjAyMCAwMjo1MSwgSmFzb24gV2FuZyB3cm90ZToKPiAKPiBPbiAyMDIwLzIvMTEg
5LiK5Y2IMTI6NTUsIEFudG9uIEl2YW5vdiB3cm90ZToKPj4KPj4KPj4gT24gMDkvMTIvMjAxOSAx
MDo0OCwgYW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbSB3cm90ZToKPj4+IEZyb206IEFu
dG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPj4+Cj4+PiBTb21l
IG9mIHRoZSBmcmFtZXMgbWFya2VkIGFzIEdTTyB3aGljaCBhcnJpdmUgYXQKPj4+IHZpcnRpb19u
ZXRfaGRyX2Zyb21fc2tiKCkgaGF2ZSBubyBHU09fVFlQRSwgbm8KPj4+IGZyYWdtZW50cyAoZGF0
YV9sZW4gPSAwKSBhbmQgbGVuZ3RoIHNpZ25pZmljYW50bHkgc2hvcnRlcgo+Pj4gdGhhbiB0aGUg
TVRVICg3NTIgaW4gbXkgZXhwZXJpbWVudHMpLgo+Pj4KPj4+IFRoaXMgaXMgb2JzZXJ2ZWQgb24g
cmF3IHNvY2tldHMgcmVhZGluZyBvZmYgdkV0aCBpbnRlcmZhY2VzCj4+PiBpbiBhbGwgNC54IGFu
ZCA1Lngga2VybmVscyBJIHRlc3RlZC4KPj4+Cj4+PiBUaGVzZSBmcmFtZXMgYXJlIHJlcG9ydGVk
IGFzIGludmFsaWQgd2hpbGUgdGhleSBhcmUgaW4gZmFjdAo+Pj4gZ3NvLWxlc3MgZnJhbWVzLgo+
Pj4KPj4+IFRoaXMgcGF0Y2ggbWFya3MgdGhlIHZuZXQgaGVhZGVyIGFzIG5vLUdTTyBmb3IgdGhl
bSBpbnN0ZWFkCj4+PiBvZiByZXBvcnRpbmcgaXQgYXMgaW52YWxpZC4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4+
PiAtLS0KPj4+IMKgIGluY2x1ZGUvbGludXgvdmlydGlvX25ldC5oIHwgOCArKysrKystLQo+Pj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggYi9pbmNsdWRlL2xpbnV4
L3ZpcnRpb19uZXQuaAo+Pj4gaW5kZXggMGQxZmU5Mjk3YWM2Li5kOTBkNWNmZjFiOWEgMTAwNjQ0
Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+Pj4gKysrIGIvaW5jbHVkZS9s
aW51eC92aXJ0aW9fbmV0LmgKPj4+IEBAIC0xMTIsOCArMTEyLDEyIEBAIHN0YXRpYyBpbmxpbmUg
aW50IHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiKGNvbnN0IAo+Pj4gc3RydWN0IHNrX2J1ZmYgKnNr
YiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9f
TkVUX0hEUl9HU09fVENQVjQ7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoc2luZm8t
Pmdzb190eXBlICYgU0tCX0dTT19UQ1BWNikKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fVENQVjY7Cj4+PiAtwqDCoMKgwqDC
oMKgwqAgZWxzZQo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgZWxzZSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
c2tiLT5kYXRhX2xlbiA9PSAwKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBo
ZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX05PTkU7Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbHNlCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlOVkFMOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BfRUNOKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSB8PSBWSVJUSU9fTkVUX0hEUl9HU09fRUNOOwo+Pj4g
wqDCoMKgwqDCoCB9IGVsc2UKPj4+Cj4+Cj4+IHBpbmcuCj4+Cj4gCj4gRG8geW91IG1lYW4gZ3Nv
X3NpemUgaXMgc2V0IGJ1dCBnc29fdHlwZSBpcyBub3Q/IExvb2tzIGxpa2UgYSBidWcgCj4gZWxz
ZXdoZXJlLgo+IAo+IFRoYW5rcwo+IAo+IApZZXMuCgpJIGNvdWxkIG5vdCB0cmFjZSBpdCB3aGVy
ZSBpdCBpcyBjb21pbmcgZnJvbS4KCkkgc2VlIGl0IHdoZW4gZG9pbmcgcmVjdm1tc2cgb24gcmF3
IHNvY2tldHMgaW4gdGhlIFVNTCB2ZWN0b3IgbmV0d29yayAKZHJpdmVycy4KCgotLSAKQW50b24g
Ui4gSXZhbm92CkNhbWJyaWRnZWdyZXlzIExpbWl0ZWQuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZC4g
Q29tcGFueSBOdW1iZXIgMTAyNzM2NjEKaHR0cHM6Ly93d3cuY2FtYnJpZGdlZ3JleXMuY29tLwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
