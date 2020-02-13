Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C315BD76
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 12:12:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D95D784A05;
	Thu, 13 Feb 2020 11:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSzw9aSdJJwT; Thu, 13 Feb 2020 11:12:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 890F384A43;
	Thu, 13 Feb 2020 11:12:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61E59C0177;
	Thu, 13 Feb 2020 11:12:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30684C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 11:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2AF4E20416
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 11:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V67D41JeEdNC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 11:12:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by silver.osuosl.org (Postfix) with ESMTPS id BF9FB203EF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 11:12:49 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j2CQJ-00081T-WC; Thu, 13 Feb 2020 11:12:48 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j2CQH-0007rt-Ni; Thu, 13 Feb 2020 11:12:47 +0000
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
 <20200213045937-mutt-send-email-mst@kernel.org>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Message-ID: <54692f06-f687-8bd3-7a1b-3dac3e79110b@cambridgegreys.com>
Date: Thu, 13 Feb 2020 11:12:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213045937-mutt-send-email-mst@kernel.org>
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

CgpPbiAxMy8wMi8yMDIwIDEwOjAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24gV2Vk
LCBGZWIgMTIsIDIwMjAgYXQgMDU6Mzg6MDlQTSArMDAwMCwgQW50b24gSXZhbm92IHdyb3RlOgo+
Pgo+Pgo+PiBPbiAxMS8wMi8yMDIwIDEwOjM3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+
PiBPbiBUdWUsIEZlYiAxMSwgMjAyMCBhdCAwNzo0MjozN0FNICswMDAwLCBBbnRvbiBJdmFub3Yg
d3JvdGU6Cj4+Pj4gT24gMTEvMDIvMjAyMCAwMjo1MSwgSmFzb24gV2FuZyB3cm90ZToKPj4+Pj4K
Pj4+Pj4gT24gMjAyMC8yLzExIOS4iuWNiDEyOjU1LCBBbnRvbiBJdmFub3Ygd3JvdGU6Cj4+Pj4+
Pgo+Pj4+Pj4KPj4+Pj4+IE9uIDA5LzEyLzIwMTkgMTA6NDgsIGFudG9uLml2YW5vdkBjYW1icmlk
Z2VncmV5cy5jb20gd3JvdGU6Cj4+Pj4+Pj4gRnJvbTogQW50b24gSXZhbm92IDxhbnRvbi5pdmFu
b3ZAY2FtYnJpZGdlZ3JleXMuY29tPgo+Pj4+Pj4+Cj4+Pj4+Pj4gU29tZSBvZiB0aGUgZnJhbWVz
IG1hcmtlZCBhcyBHU08gd2hpY2ggYXJyaXZlIGF0Cj4+Pj4+Pj4gdmlydGlvX25ldF9oZHJfZnJv
bV9za2IoKSBoYXZlIG5vIEdTT19UWVBFLCBubwo+Pj4+Pj4+IGZyYWdtZW50cyAoZGF0YV9sZW4g
PSAwKSBhbmQgbGVuZ3RoIHNpZ25pZmljYW50bHkgc2hvcnRlcgo+Pj4+Pj4+IHRoYW4gdGhlIE1U
VSAoNzUyIGluIG15IGV4cGVyaW1lbnRzKS4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgaXMgb2JzZXJ2
ZWQgb24gcmF3IHNvY2tldHMgcmVhZGluZyBvZmYgdkV0aCBpbnRlcmZhY2VzCj4+Pj4+Pj4gaW4g
YWxsIDQueCBhbmQgNS54IGtlcm5lbHMgSSB0ZXN0ZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGVzZSBm
cmFtZXMgYXJlIHJlcG9ydGVkIGFzIGludmFsaWQgd2hpbGUgdGhleSBhcmUgaW4gZmFjdAo+Pj4+
Pj4+IGdzby1sZXNzIGZyYW1lcy4KPj4+Pj4+Pgo+Pj4+Pj4+IFRoaXMgcGF0Y2ggbWFya3MgdGhl
IHZuZXQgaGVhZGVyIGFzIG5vLUdTTyBmb3IgdGhlbSBpbnN0ZWFkCj4+Pj4+Pj4gb2YgcmVwb3J0
aW5nIGl0IGFzIGludmFsaWQuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbiBJ
dmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+
Pj4gICDCoCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaCB8IDggKysrKysrLS0KPj4+Pj4+PiAg
IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+
Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggYi9pbmNs
dWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+Pj4+Pj4+IGluZGV4IDBkMWZlOTI5N2FjNi4uZDkwZDVj
ZmYxYjlhIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvdmlydGlvX25ldC5oCj4+
Pj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4+PiBAQCAtMTEyLDgg
KzExMiwxMiBAQCBzdGF0aWMgaW5saW5lIGludAo+Pj4+Pj4+IHZpcnRpb19uZXRfaGRyX2Zyb21f
c2tiKGNvbnN0IHN0cnVjdCBza19idWZmICpza2IsCj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RDUFY0Owo+Pj4+
Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKHNpbmZvLT5nc29fdHlwZSAmIFNLQl9H
U09fVENQVjYpCj4+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190
eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RDUFY2Owo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBl
bHNlCj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2Ugewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChza2ItPmRhdGFfbGVuID09IDApCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX05PTkU7Cj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+
Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19U
Q1BfRUNOKQo+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlw
ZSB8PSBWSVJUSU9fTkVUX0hEUl9HU09fRUNOOwo+Pj4+Pj4+ICAgwqDCoMKgwqDCoCB9IGVsc2UK
Pj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IHBpbmcuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBEbyB5b3UgbWVh
biBnc29fc2l6ZSBpcyBzZXQgYnV0IGdzb190eXBlIGlzIG5vdD8gTG9va3MgbGlrZSBhIGJ1Zwo+
Pj4+PiBlbHNld2hlcmUuCj4+Pj4+Cj4+Pj4+IFRoYW5rcwo+Pj4+Pgo+Pj4+Pgo+Pj4+IFllcy4K
Pj4+Pgo+Pj4+IEkgY291bGQgbm90IHRyYWNlIGl0IHdoZXJlIGl0IGlzIGNvbWluZyBmcm9tLgo+
Pj4+Cj4+Pj4gSSBzZWUgaXQgd2hlbiBkb2luZyByZWN2bW1zZyBvbiByYXcgc29ja2V0cyBpbiB0
aGUgVU1MIHZlY3RvciBuZXR3b3JrCj4+Pj4gZHJpdmVycy4KPj4+Pgo+Pj4KPj4+IEkgdGhpbmsg
d2UgbmVlZCB0byBmaW5kIHRoZSBjdWxwcml0IGFuZCBmaXggaXQgdGhlcmUsIGxvdHMgb2Ygb3Ro
ZXIgdGhpbmdzCj4+PiBjYW4gYnJlYWsgb3RoZXJ3aXNlLgo+Pj4gSnVzdCBwcmludGluZyBvdXQg
c2tiLT5kZXYtPm5hbWUgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/Cj4+Cj4+IFRoZSBwcmludGsg
aW4gdmlydGlvX25ldF9oZHJfZnJvbV9za2Igc2F5cyBOVUxMLgo+Pgo+PiBUaGF0IGlzIHByb2Jh
Ymx5IG5vcm1hbCBmb3IgYSBsb2NhbGx5IG9yaWdpbmF0ZWQgZnJhbWUuCj4+Cj4+IEkgY2Fubm90
IHJlcHJvZHVjZSB0aGlzIHdpdGggbmV0d29yayB0cmFmZmljIGJ5IHRoZSB3YXkgLSBpdCBoYXBw
ZW5zIG9ubHkgaWYgdGhlIHRyYWZmaWMgaXMgbG9jYWxseSBvcmlnaW5hdGVkIG9uIHRoZSBob3N0
Lgo+Pgo+PiBBLAo+IAo+IE9LIHNvIGlzIGl0IGNvZGUgaW4gX190Y3BfdHJhbnNtaXRfc2tiIHRo
YXQgc2V0cyBnc29fc2l6ZSB0byBub24tbnVsbAo+IHdoZW4gZ3NvX3R5cGUgaXMgMD8KCkl0IGRv
ZXMgbG9vayBsaWtlIHRoYXQsIGJ1dCBJIGNhbm5vdCBzZWUgaXQgd2hlbiByZWFkaW5nIGl0IDoo
CgoKPiAKPiAKPj4+Cj4+Pgo+Pj4+IC0tIAo+Pj4+IEFudG9uIFIuIEl2YW5vdgo+Pj4+IENhbWJy
aWRnZWdyZXlzIExpbWl0ZWQuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZC4gQ29tcGFueSBOdW1iZXIg
MTAyNzM2NjEKPj4+PiBodHRwczovL3d3dy5jYW1icmlkZ2VncmV5cy5jb20vCj4+Pgo+Pj4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBsaW51
eC11bSBtYWlsaW5nIGxpc3QKPj4+IGxpbnV4LXVtQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtdW0KPj4+Cj4+
Cj4+IC0tIAo+PiBBbnRvbiBSLiBJdmFub3YKPj4gQ2FtYnJpZGdlZ3JleXMgTGltaXRlZC4gUmVn
aXN0ZXJlZCBpbiBFbmdsYW5kLiBDb21wYW55IE51bWJlciAxMDI3MzY2MQo+PiBodHRwczovL3d3
dy5jYW1icmlkZ2VncmV5cy5jb20vCj4gCj4gCgotLSAKQW50b24gUi4gSXZhbm92CkNhbWJyaWRn
ZWdyZXlzIExpbWl0ZWQuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZC4gQ29tcGFueSBOdW1iZXIgMTAy
NzM2NjEKaHR0cHM6Ly93d3cuY2FtYnJpZGdlZ3JleXMuY29tLwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
