Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4247166735
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 20:33:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5ECB587D57;
	Thu, 20 Feb 2020 19:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCgxOV8aRh5B; Thu, 20 Feb 2020 19:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8878987D60;
	Thu, 20 Feb 2020 19:33:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CC9DC013E;
	Thu, 20 Feb 2020 19:33:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39703C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3250F214E4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2SUmBlrDcwz
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:33:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by silver.osuosl.org (Postfix) with ESMTPS id AEB65203AA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 19:33:40 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j4rZm-0007Og-Rv; Thu, 20 Feb 2020 19:33:35 +0000
Received: from [151.251.251.9] (helo=[192.168.14.3])
 by jain.kot-begemot.co.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j4rZj-0003iM-W6; Thu, 20 Feb 2020 19:33:34 +0000
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
 <20200213045937-mutt-send-email-mst@kernel.org>
 <94fb9656-99ee-a001-e428-9d76c3620e61@gmail.com>
 <20200213105010-mutt-send-email-mst@kernel.org>
 <35510da7-08f1-4aa5-c6d6-6bffbccaee0c@cambridgegreys.com>
 <20200220025506-mutt-send-email-mst@kernel.org>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys Limited
Message-ID: <d26515b2-c0f4-195d-f754-caf7aa78ab81@cambridgegreys.com>
Date: Thu, 20 Feb 2020 19:33:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200220025506-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
 Eric Dumazet <eric.dumazet@gmail.com>,
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

Ck9uIDIwLzAyLzIwMjAgMDc6NTgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBUaHUs
IEZlYiAxMywgMjAyMCBhdCAwNDoyMzoyNFBNICswMDAwLCBBbnRvbiBJdmFub3Ygd3JvdGU6Cj4+
IE9uIDEzLzAyLzIwMjAgMTU6NTMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+IE9uIFRo
dSwgRmViIDEzLCAyMDIwIGF0IDA3OjQ0OjA2QU0gLTA4MDAsIEVyaWMgRHVtYXpldCB3cm90ZToK
Pj4+PiBPbiAyLzEzLzIwIDI6MDAgQU0sIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+Pj4g
T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDU6Mzg6MDlQTSArMDAwMCwgQW50b24gSXZhbm92IHdy
b3RlOgo+Pj4+Pj4gT24gMTEvMDIvMjAyMCAxMDozNywgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+Pj4+Pj4+IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDA3OjQyOjM3QU0gKzAwMDAsIEFudG9u
IEl2YW5vdiB3cm90ZToKPj4+Pj4+Pj4gT24gMTEvMDIvMjAyMCAwMjo1MSwgSmFzb24gV2FuZyB3
cm90ZToKPj4+Pj4+Pj4+IE9uIDIwMjAvMi8xMSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdy
b3RlOgo+Pj4+Pj4+Pj4+IE9uIDA5LzEyLzIwMTkgMTA6NDgsIGFudG9uLml2YW5vdkBjYW1icmlk
Z2VncmV5cy5jb20gd3JvdGU6Cj4+Pj4+Pj4+Pj4+IEZyb206IEFudG9uIEl2YW5vdiA8YW50b24u
aXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gU29tZSBv
ZiB0aGUgZnJhbWVzIG1hcmtlZCBhcyBHU08gd2hpY2ggYXJyaXZlIGF0Cj4+Pj4+Pj4+Pj4+IHZp
cnRpb19uZXRfaGRyX2Zyb21fc2tiKCkgaGF2ZSBubyBHU09fVFlQRSwgbm8KPj4+Pj4+Pj4+Pj4g
ZnJhZ21lbnRzIChkYXRhX2xlbiA9IDApIGFuZCBsZW5ndGggc2lnbmlmaWNhbnRseSBzaG9ydGVy
Cj4+Pj4+Pj4+Pj4+IHRoYW4gdGhlIE1UVSAoNzUyIGluIG15IGV4cGVyaW1lbnRzKS4KPj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Pj4gVGhpcyBpcyBvYnNlcnZlZCBvbiByYXcgc29ja2V0cyByZWFkaW5n
IG9mZiB2RXRoIGludGVyZmFjZXMKPj4+Pj4+Pj4+Pj4gaW4gYWxsIDQueCBhbmQgNS54IGtlcm5l
bHMgSSB0ZXN0ZWQuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFRoZXNlIGZyYW1lcyBhcmUgcmVw
b3J0ZWQgYXMgaW52YWxpZCB3aGlsZSB0aGV5IGFyZSBpbiBmYWN0Cj4+Pj4+Pj4+Pj4+IGdzby1s
ZXNzIGZyYW1lcy4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gVGhpcyBwYXRjaCBtYXJrcyB0aGUg
dm5ldCBoZWFkZXIgYXMgbm8tR1NPIGZvciB0aGVtIGluc3RlYWQKPj4+Pj4+Pj4+Pj4gb2YgcmVw
b3J0aW5nIGl0IGFzIGludmFsaWQuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPj4+Pj4+
Pj4+Pj4gLS0tCj4+Pj4+Pj4+Pj4+ICAgIMKgIGluY2x1ZGUvbGludXgvdmlydGlvX25ldC5oIHwg
OCArKysrKystLQo+Pj4+Pj4+Pj4+PiAgICDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmggYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+
Pj4+Pj4+Pj4+PiBpbmRleCAwZDFmZTkyOTdhYzYuLmQ5MGQ1Y2ZmMWI5YSAxMDA2NDQKPj4+Pj4+
Pj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4+Pj4+Pj4gKysrIGIv
aW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPj4+Pj4+Pj4+Pj4gQEAgLTExMiw4ICsxMTIsMTIg
QEAgc3RhdGljIGlubGluZSBpbnQKPj4+Pj4+Pj4+Pj4gdmlydGlvX25ldF9oZHJfZnJvbV9za2Io
Y29uc3Qgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPj4+Pj4+Pj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSA9IFZJUlRJT19ORVRfSERSX0dTT19UQ1BWNDsKPj4+
Pj4+Pj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKHNpbmZvLT5nc29fdHlwZSAm
IFNLQl9HU09fVENQVjYpCj4+Pj4+Pj4+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fVENQVjY7Cj4+Pj4+Pj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRUlOVkFMOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZSB7Cj4+Pj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChza2ItPmRhdGFfbGVuID09IDApCj4+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSA9IFZJ
UlRJT19ORVRfSERSX0dTT19OT05FOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlbHNlCj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+Pj4+ICAgIMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BfRUNOKQo+
Pj4+Pj4+Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlIHw9
IFZJUlRJT19ORVRfSERSX0dTT19FQ047Cj4+Pj4+Pj4+Pj4+ICAgIMKgwqDCoMKgwqAgfSBlbHNl
Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gcGluZy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gRG8geW91
IG1lYW4gZ3NvX3NpemUgaXMgc2V0IGJ1dCBnc29fdHlwZSBpcyBub3Q/IExvb2tzIGxpa2UgYSBi
dWcKPj4+Pj4+Pj4+IGVsc2V3aGVyZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBUaGFua3MKPj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+PiBZZXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgY291bGQgbm90
IHRyYWNlIGl0IHdoZXJlIGl0IGlzIGNvbWluZyBmcm9tLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIHNl
ZSBpdCB3aGVuIGRvaW5nIHJlY3ZtbXNnIG9uIHJhdyBzb2NrZXRzIGluIHRoZSBVTUwgdmVjdG9y
IG5ldHdvcmsKPj4+Pj4+Pj4gZHJpdmVycy4KPj4+Pj4+Pj4KPj4+Pj4+PiBJIHRoaW5rIHdlIG5l
ZWQgdG8gZmluZCB0aGUgY3VscHJpdCBhbmQgZml4IGl0IHRoZXJlLCBsb3RzIG9mIG90aGVyIHRo
aW5ncwo+Pj4+Pj4+IGNhbiBicmVhayBvdGhlcndpc2UuCj4+Pj4+Pj4gSnVzdCBwcmludGluZyBv
dXQgc2tiLT5kZXYtPm5hbWUgc2hvdWxkIGRvIHRoZSB0cmljaywgbm8/Cj4+Pj4+PiBUaGUgcHJp
bnRrIGluIHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiIHNheXMgTlVMTC4KPj4+Pj4+Cj4+Pj4+PiBU
aGF0IGlzIHByb2JhYmx5IG5vcm1hbCBmb3IgYSBsb2NhbGx5IG9yaWdpbmF0ZWQgZnJhbWUuCj4+
Pj4+Pgo+Pj4+Pj4gSSBjYW5ub3QgcmVwcm9kdWNlIHRoaXMgd2l0aCBuZXR3b3JrIHRyYWZmaWMg
YnkgdGhlIHdheSAtIGl0IGhhcHBlbnMgb25seSBpZiB0aGUgdHJhZmZpYyBpcyBsb2NhbGx5IG9y
aWdpbmF0ZWQgb24gdGhlIGhvc3QuCj4+Pj4+Pgo+Pj4+Pj4gQSwKPj4+Pj4gT0sgc28gaXMgaXQg
Y29kZSBpbiBfX3RjcF90cmFuc21pdF9za2IgdGhhdCBzZXRzIGdzb19zaXplIHRvIG5vbi1udWxs
Cj4+Pj4+IHdoZW4gZ3NvX3R5cGUgaXMgMD8KPj4+Pj4KPj4+PiBDb3JyZWN0IHdheSB0byBkZXRl
cm1pbmUgaWYgYSBwYWNrZXQgaXMgYSBnc28gb25lIGlzIGJ5IGxvb2tpbmcgYXQgZ3NvX3NpemUu
Cj4+Pj4gVGhlbiBvbmx5IGl0IGlzIGxlZ2FsIGxvb2tpbmcgYXQgZ3NvX3R5cGUKPj4+Pgo+Pj4+
Cj4+Pj4gc3RhdGljIGlubGluZSBib29sIHNrYl9pc19nc28oY29uc3Qgc3RydWN0IHNrX2J1ZmYg
KnNrYikKPj4+PiB7Cj4+Pj4gICAgICAgcmV0dXJuIHNrYl9zaGluZm8oc2tiKS0+Z3NvX3NpemU7
Cj4+Pj4gfQo+Pj4+Cj4+Pj4gLyogTm90ZTogU2hvdWxkIGJlIGNhbGxlZCBvbmx5IGlmIHNrYl9p
c19nc28oc2tiKSBpcyB0cnVlICovCj4+Pj4gc3RhdGljIGlubGluZSBib29sIHNrYl9pc19nc29f
djYoY29uc3Qgc3RydWN0IHNrX2J1ZmYgKnNrYikKPj4+PiAuLi4KPj4+Pgo+Pj4+Cj4+Pj4gVGhl
cmUgaXMgYWJzb2x1dGVseSBubyByZWxhdGlvbiBiZXR3ZWVuIEdTTyBhbmQgc2tiLT5kYXRhX2xl
biwgc2tiIGNhbiBiZSBsaW5lYXJpemVkCj4+Pj4gZm9yIHZhcmlvdXMgb3J0aG9nb25hbCByZWFz
b25zLgo+Pj4gVGhlIHJlcG9ydGVkIHByb2JsZW0gaXMgdGhhdCB2aXJ0aW8gZ2V0cyBhIHBhY2tl
dCB3aGVyZSBnc29fc2l6ZQo+Pj4gaXMgITAgYnV0IGdzb190eXBlIGlzIDAuCj4+Pgo+Pj4gSXQg
Y3VycmVudGx5IGRyb3BzIHRoZXNlIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgaXQncyBzb21lIHR5
cGUKPj4+IG9mIGEgZ3NvIHBhY2tldCBpdCBkb2VzIG5vdCBrbm93IGhvdyB0byBoYW5kbGUuCj4+
Pgo+Pj4KPj4+IFNvIHlvdSBhcmUgc2F5aW5nIGlmIHNrYl9pc19nc28gd2UgY2FuIHN0aWxsIGhh
dmUgZ3NvX3R5cGUgc2V0IHRvIDAsCj4+PiBhbmQgdGhhdCdzIGFuIGV4cGVjdGVkIGNvbmZpZ3Vy
YXRpb24/Cj4+Pgo+Pj4gU28gdGhlIHBhdGNoIHNob3VsZCBqdXN0IGJlOgo+Pj4KPj4+Cj4+PiAt
ICAgICAgICBpZiAoc2tiX2lzX2dzbyhza2IpKSB7Cj4+PiArICAgICAgICBpZiAoc2tiX2lzX2dz
byhza2IpICYmIHNpbmZvLT5nc29fdHlwZSkgewo+Pj4KPj4gWWVzLCBwcm92aWRlZCB0aGF0IHNr
Yl9pc19nc28oc2tiKSBhbmQgc2luZm8tPmdzb190eXBlID09IDAgaXMgYSB2YWxpZCBzdGF0ZS4K
Pj4KPj4gSSBhZ3JlZSB3aXRoIEphc29uLCB0aGVyZSBtYXkgYmUgc29tZXRoaW5nIHdyb25nIGdv
aW5nIG9uIGhlcmUgYW5kIHdlIG5lZWQgdG8gZmluZCB0aGUgc291cmNlIHdoaWNoIGNyZWF0ZXMg
dGhlc2UgcGFja2V0cy4KPj4KPj4gQS4KPgo+IFdhbnQgdG8gc3VibWl0IGEgcGF0Y2ggdG8gYWRk
cmVzcyB0aGlzIGZvciBub3c/CgpJIGNhbiBkbyB0aGF0IG9uIE1vbmRheSAtIHRyYXZlbGluZyB0
aWxsIHRoZW4uCgpBLgoKCj4KPj4+ID8KPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LXVtIG1haWxpbmcgbGlzdAo+Pj4g
bGludXgtdW1AbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC11bQo+PiAtLSAKPj4gQW50b24gUi4gSXZhbm92Cj4+
IENhbWJyaWRnZWdyZXlzIExpbWl0ZWQuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZC4gQ29tcGFueSBO
dW1iZXIgMTAyNzM2NjEKPj4gaHR0cHM6Ly93d3cuY2FtYnJpZGdlZ3JleXMuY29tLwo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC11bSBt
YWlsaW5nIGxpc3QKPiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC11bQoKLS0gCkFudG9uIFIuIEl2
YW5vdgoKQ2FtYnJpZGdlIEdyZXlzIExpbWl0ZWQsIEVuZ2xhbmQgYW5kIFdhbGVzIGNvbXBhbnkg
Tm8gMTAyNzM2NjEKaHR0cDovL3d3dy5jYW1icmlkZ2VncmV5cy5jb20vCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
