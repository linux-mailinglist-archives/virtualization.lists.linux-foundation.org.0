Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A716BD85
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 10:41:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 08C0C20773;
	Tue, 25 Feb 2020 09:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFGIL7mGTWdz; Tue, 25 Feb 2020 09:41:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 344C320797;
	Tue, 25 Feb 2020 09:41:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 100E5C0177;
	Tue, 25 Feb 2020 09:41:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7F86C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B734F20773
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qd4FP8EvAIU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:40:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 48F432052F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 09:40:56 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6Whu-0001Hu-4c; Tue, 25 Feb 2020 09:40:54 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6Whp-0002XQ-I8; Tue, 25 Feb 2020 09:40:49 +0000
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
 <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
 <4e7757cf-148e-4585-b358-3b38f391275d@cambridgegreys.com>
 <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
 <93cb2b3f-6cae-8cf1-5fab-93fa34c14628@cambridgegreys.com>
 <CA+FuTScEXRwYtFzn-jtFhV0dNKNQqKPBwCWaNORJW=ERU=izMA@mail.gmail.com>
 <6b83116c-2cca-fb03-1c13-bb436dccf1b3@cambridgegreys.com>
Message-ID: <cd1b4084-af6b-7fd9-f182-8b32a3c8d837@cambridgegreys.com>
Date: Tue, 25 Feb 2020 09:40:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6b83116c-2cca-fb03-1c13-bb436dccf1b3@cambridgegreys.com>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Network Development <netdev@vger.kernel.org>, linux-um@lists.infradead.org,
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

CgpPbiAyNS8wMi8yMDIwIDA3OjQ4LCBBbnRvbiBJdmFub3Ygd3JvdGU6Cj4gCj4gCj4gT24gMjQv
MDIvMjAyMCAyMjoyMiwgV2lsbGVtIGRlIEJydWlqbiB3cm90ZToKPj4gT24gTW9uLCBGZWIgMjQs
IDIwMjAgYXQgNDowMCBQTSBBbnRvbiBJdmFub3YKPj4gPGFudG9uLml2YW5vdkBjYW1icmlkZ2Vn
cmV5cy5jb20+IHdyb3RlOgo+Pj4KPj4+IE9uIDI0LzAyLzIwMjAgMjA6MjAsIFdpbGxlbSBkZSBC
cnVpam4gd3JvdGU6Cj4+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMjo1NSBQTSBBbnRvbiBJ
dmFub3YKPj4+PiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4gd3JvdGU6Cj4+Pj4+
IE9uIDI0LzAyLzIwMjAgMTk6MjcsIFdpbGxlbSBkZSBCcnVpam4gd3JvdGU6Cj4+Pj4+PiBPbiBN
b24sIEZlYiAyNCwgMjAyMCBhdCA4OjI2IEFNIDxhbnRvbi5pdmFub3ZAY2FtYnJpZGdlZ3JleXMu
Y29tPiB3cm90ZToKPj4+Pj4+PiBGcm9tOiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1i
cmlkZ2VncmV5cy5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBTb21lIG9mIHRoZSBsb2NhbGx5IGdlbmVy
YXRlZCBmcmFtZXMgbWFya2VkIGFzIEdTTyB3aGljaAo+Pj4+Pj4+IGFycml2ZSBhdCB2aXJ0aW9f
bmV0X2hkcl9mcm9tX3NrYigpIGhhdmUgbm8gR1NPX1RZUEUsIG5vCj4+Pj4+Pj4gZnJhZ21lbnRz
IChkYXRhX2xlbiA9IDApIGFuZCBsZW5ndGggc2lnbmlmaWNhbnRseSBzaG9ydGVyCj4+Pj4+Pj4g
dGhhbiB0aGUgTVRVICg3NTIgaW4gbXkgZXhwZXJpbWVudHMpLgo+Pj4+Pj4gRG8gd2UgdW5kZXJz
dGFuZCBob3cgdGhlc2UgcGFja2V0cyBhcmUgZ2VuZXJhdGVkPwo+Pj4+PiBObywgd2UgaGF2ZSBu
b3QgYmVlbiBhYmxlIHRvIHRyYWNlIHRoZW0uCj4+Pj4+Cj4+Pj4+IFRoZSBvbmx5IHRoaW5nIHdl
IGtub3cgaXMgdGhhdCB0aGlzIGlzIHNwZWNpZmljIHRvIGxvY2FsbHkgZ2VuZXJhdGVkCj4+Pj4+
IHBhY2tldHMuIFNvbWV0aGluZyBhcnJpdmluZyBmcm9tIHRoZSBuZXR3b3JrIGRvZXMgbm90IHNo
b3cgdGhpcy4KPj4+Pj4KPj4+Pj4+IEVsc2UgaXQgc2VlbXMgdGhpcwo+Pj4+Pj4gbWlnaHQgYmUg
cGFwZXJpbmcgb3ZlciBhIGRlZXBlciBwcm9ibGVtLgo+Pj4+Pj4KPj4+Pj4+IFRoZSBzdGFjayBz
aG91bGQgbm90IGNyZWF0ZSBHU08gcGFja2V0cyBsZXNzIHRoYW4gb3IgZXF1YWwgdG8KPj4+Pj4+
IHNrYl9zaGluZm8oc2tiKS0+Z3NvX3NpemUuIFNlZSBmb3IgaW5zdGFuY2UgdGhlIGNoZWNrIGlu
Cj4+Pj4+PiB0Y3BfZ3NvX3NlZ21lbnQgYWZ0ZXIgcHVsbGluZyB0aGUgdGNwIGhlYWRlcjoKPj4+
Pj4+Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtc3MgPSBza2Jfc2hpbmZvKHNrYiktPmdz
b19zaXplOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KHNrYi0+bGVu
IDw9IG1zcykpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290
byBvdXQ7Cj4+Pj4+Pgo+Pj4+Pj4gV2hhdCBpcyB0aGUgZ3NvX3R5cGUsIGFuZCBkb2VzIGl0IGlu
Y2x1ZGUgU0tCX0dTT19ET0RHWT8KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IDAgLSBub3Qgc2V0Lgo+Pj4+
IFRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cCBkZXRhaWxzLiBJcyB0aGlzIHNvbWV0aGluZyB0aGF0
IHlvdSBjYW4gdHJpZ2dlciBlYXNpbHk/Cj4+Pgo+Pj4gWWVzLCBpZiB5b3UgaGF2ZSBhIFVNTCBp
bnN0YW5jZSBoYW5keS4KPj4+Cj4+PiBSdW5uaW5nIGlwZXJmIGJldHdlZW4gdGhlIGhvc3QgYW5k
IGEgVU1MIGd1ZXN0IHVzaW5nIHJhdyBzb2NrZXQKPj4+IHRyYW5zcG9ydCB0cmlnZ2VycyBpdCBp
bW1lZGlhdGVseS4KPj4+Cj4+PiBUaGlzIGlzIG15IFVNTCBjb21tYW5kIGxpbmU6Cj4+Pgo+Pj4g
dm1saW51eCBtZW09MjA0OE0gdW1pZD1PUFggXAo+Pj4gwqDCoMKgwqDCoCB1YmQwPU9QWC0zLjAt
V29yay5pbWcgXAo+Pj4gdmVjMDp0cmFuc3BvcnQ9cmF3LGlmbmFtZT1wLXZldGgwLGRlcHRoPTEy
OCxncm89MSxtYWM9OTI6OWI6MzY6NWU6Mzg6NjkgXAo+Pj4gwqDCoMKgwqDCoCByb290PS9kZXYv
dWJkYSBybyBjb249bnVsbCBjb24wPW51bGwsZmQ6MiBjb24xPWZkOjAsZmQ6MQo+Pj4KPj4+IHAt
cmlnaHQgaXMgYSBwYXJ0IG9mIGEgdkV0aCBwYWlyOgo+Pj4KPj4+IGlwIGxpbmsgYWRkIGwtdmV0
aDAgdHlwZSB2ZXRoIHBlZXIgbmFtZSBwLXZldGgwICYmIGlmY29uZmlnIHAtdmV0aDAgdXAKPj4+
Cj4+PiBpcGVyZiBzZXJ2ZXIgaXMgb24gaG9zdCwgaXBlcmYgLWMgaW4gdGhlIGd1ZXN0Lgo+Pj4K
Pj4+Pgo+Pj4+IEFuIHNrYl9kdW1wKCkgKyBkdW1wX3N0YWNrKCkgd2hlbiB0aGUgcGFja2V0IHNv
Y2tldCBnZXRzIHN1Y2ggYQo+Pj4+IHBhY2tldCBtYXkgcG9pbnQgdXMgdG8gdGhlIHJvb3QgY2F1
c2UgYW5kIGZpeCB0aGF0Lgo+Pj4KPj4+IFdlIHRyaWVkIGR1bXAgc3RhY2ssIGl0IHdhcyBub3Qg
aW5mb3JtYXRpdmUgLSBpdCB3YXMganVzdCB0aGUgcmVjdm1tc2cKPj4+IGNhbGwgc3RhY2sgY29t
aW5nIGZyb20gdGhlIFVNTCB1bnRpbCBpdCBoaXRzIHRoZSByZWxldmFudCByZWN2IGJpdCBpbgo+
Pj4gYWZfcGFja2V0IC0gaXQgZG9lcyBub3QgdGVsbCB1cyB3aGVyZSB0aGUgcGFja2V0IGlzIGNv
bWluZyBmcm9tLgo+Pj4KPj4+IFF1b3RpbmcgZnJvbSB0aGUgbWVzc2FnZSBlYXJsaWVyIGluIHRo
ZSB0aHJlYWQ6Cj4+Pgo+Pj4gWyAyMzM0LjE4MDg1NF0gQ2FsbCBUcmFjZToKPj4+IFsgMjMzNC4x
ODE5NDddwqAgZHVtcF9zdGFjaysweDVjLzB4ODAKPj4+IFsgMjMzNC4xODMwMjFdwqAgcGFja2V0
X3JlY3Ztc2cuY29sZCsweDIzLzB4NDkKPj4+IFsgMjMzNC4xODQwNjNdwqAgX19fc3lzX3JlY3Zt
c2crMHhlMS8weDFmMAo+Pj4gWyAyMzM0LjE4NTAzNF3CoCA/IHBhY2tldF9wb2xsKzB4Y2EvMHgx
MzAKPj4+IFsgMjMzNC4xODYwMTRdwqAgPyBzb2NrX3BvbGwrMHg3Ny8weGIwCj4+PiBbIDIzMzQu
MTg2OTc3XcKgID8gZXBfaXRlbV9wb2xsLmlzcmEuMCsweDNmLzB4YjAKPj4+IFsgMjMzNC4xODc5
MzZdwqAgPyBlcF9zZW5kX2V2ZW50c19wcm9jKzB4ZjEvMHgyNDAKPj4+IFsgMjMzNC4xODg5MDFd
wqAgPyBkZXF1ZXVlX3NpZ25hbCsweGRiLzB4MTgwCj4+PiBbIDIzMzQuMTg5ODQ4XcKgIGRvX3Jl
Y3ZtbXNnKzB4YzgvMHgyZDAKPj4+IFsgMjMzNC4xOTA3MjhdwqAgPyBlcF9wb2xsKzB4OGMvMHg0
NzAKPj4+IFsgMjMzNC4xOTE1ODFdwqAgX19zeXNfcmVjdm1tc2crMHgxMDgvMHgxNTAKPj4+IFsg
MjMzNC4xOTI0NDFdwqAgX194NjRfc3lzX3JlY3ZtbXNnKzB4MjUvMHgzMAo+Pj4gWyAyMzM0LjE5
MzM0Nl3CoCBkb19zeXNjYWxsXzY0KzB4NTMvMHgxNDAKPj4+IFsgMjMzNC4xOTQyNjJdwqAgZW50
cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQo+Pgo+PiBUaGF0IG1ha2VzIHNl
bnNlLiBza2JfZHVtcCBtaWdodCBzaG93IG1vcmUgaW50ZXJlc3RpbmcgZGV0YWlscyBhYm91dAo+
PiB0aGUgcGFja2V0Lgo+IAo+IEkgd2lsbCBhZGQgdGhhdCBhbmQgcmV0ZXN0IGxhdGVyIHRvZGF5
LgoKCnNrYiBsZW49ODE4IGhlYWRyb29tPTIgaGVhZGxlbj04MTggdGFpbHJvb209OTA4Cm1hYz0o
MiwxNCkgbmV0PSgxNiwwKSB0cmFucz0xNgpzaGluZm8odHhmbGFncz0wIG5yX2ZyYWdzPTAgZ3Nv
KHNpemU9NzUyIHR5cGU9MCBzZWdzPTEpKQpjc3VtKDB4MTAwMDI0IGlwX3N1bW1lZD0zIGNvbXBs
ZXRlX3N3PTAgdmFsaWQ9MCBsZXZlbD0wKQpoYXNoKDB4MCBzdz0wIGw0PTApIHByb3RvPTB4MDgw
MCBwa3R0eXBlPTQgaWlmPTAKc2sgZmFtaWx5PTE3IHR5cGU9MyBwcm90bz0wCgpEZWNpcGhlcmlu
ZyB0aGUgYWN0dWFsIHBhY2tldCBkYXRhIGdpdmVzIGEKClRDUCBwYWNrZXQsIEFDSyBhbmQgUFNI
IHNldC4KClRoZSBQU0ggZmxhZyBsb29rcyBsaWtlIHRoZSBvbmx5ICJpbnRlcmVzdGluZyIgdGhp
bmcgYWJvdXQgaXQgaW4gZmlyc3QgcmVhZC4KCj4gCj4+IEZyb20gdGhlIHByZXZpb3VzIHRocmVh
ZCwgdGhlc2UgYXJlIGFzc3VtZWQgdG8gYmUgVENQCj4+IHBhY2tldHM/Cj4gCj4gWWVzCj4gCj4+
Cj4+IEkgaGFkIG1pc3NlZCB0aGUgb3JpZ2luYWwgdGhyZWFkLiBJZiB0aGUgcGFja2V0IGhhcwo+
Pgo+PiDCoMKgwqDCoCBzaW5mbyhza2IpLT5nc29fc2l6ZSA9IDc1Mi4KPj4gwqDCoMKgwqAgc2ti
LT5sZW4gPSA4MTgKPj4KPj4gdGhlbiB0aGlzIGlzIGEgR1NPIHBhY2tldC4gRXZlbiB0aG91Z2gg
VU1MIHdpbGwgY29ycmVjdGx5IHByb2Nlc3MgaXQKPj4gYXMgYSBub3JtYWwgODE4IEIgcGFja2V0
IGlmIHBzb2NrX3JjdiBwcmV0ZW5kcyB0aGF0IGl0IGlzLCB0cmVhdGluZyBpdAo+PiBsaWtlIHRo
YXQgaXMgbm90IHN0cmljdGx5IGNvcnJlY3QuIEEgcmVsYXRlZCBxdWVzdGlvbiBpcyBob3cgdGhl
IHNldHVwCj4+IGFycml2ZWQgYXQgdGhhdCBsb3cgTVRVIHNpemUsIGFzc3VtaW5nIHRoYXQgaXMg
bm90IGV4cGxpY2l0bHkKPj4gY29uZmlndXJlZCB0aGF0IGxvdy4KPiAKPiBUaGUgbXR1IG9uIHRo
ZSBpbnRlcmZhY2UgaXMgbm9ybWFsLiBJIHN1c3BlY3QgaXQgaXMgb25lIG9mIHRoZSBmaXJzdCBw
YWNrZXRzCj4gaW4gdGhlIHN0cmVhbSBvciBzb21ldGhpbmcgaXBlcmYgdXNlcyBmb3IgY29tbXVu
aWNhdGlvbiBiZXR3ZWVuIHRoZSBzZXJ2ZXIgYW5kCj4gdGhlIGNsaWVudCB3aGljaCBhbHdheXMg
ZW5kcyB1cCB0aGF0IHNpemUuCj4gCj4+Cj4+IEFzIG9mIGNvbW1pdCA1MTQ2NmE3NTQ1YjcgKCJ0
Y3A6IGZpbGwgc2hpbmZvLT5nc29fdHlwZSBhdCBsYXN0Cj4+IG1vbWVudCIpIHRjcCB1bmNvbmRp
dGlvbmFsbHkgc2V0cyBnc29fdHlwZSwgZXZlbiBmb3Igbm9uIGdzbyBwYWNrZXRzLgo+PiBTbyBl
aXRoZXIgdGhpcyBpcyBub3QgYSB0Y3AgcGFja2V0IG9yIHRoZSBmaWVsZCBnZXRzIHplcm9lZCBz
b21ld2hlcmUKPj4gYWxvbmcgdGhlIHdheS4gSSBjb3VsZCBub3QgcXVpY2tseSBmaW5kIGEgcG9z
c2libGUgcGF0aCB0bwo+PiBza2JfZ3NvX3Jlc2V0IG9yIGEgcmF3IHdyaXRlLgo+IAo+IFNhbWUu
IEkgaGF2ZSB0cmllZCB0byB0cmFjZSBhIHBvc3NpYmxlIG9yaWdpbiBhbmQgSSBoYXZlIG5vdCBz
ZWVuIGFueXRoaW5nIHdoaWNoIG1heSBjYXVzZSBpdC4KPiAKPj4KPj4gSXQgbWF5IGJlIHVzZWZ1
bCB0byBpbnNlcnQgdGVzdHMgZm9yIHRoaXMgY29uZGl0aW9uIChza2JfaXNfZ3NvKHNrYikKPj4g
JiYgIXNrYl9zaGluZm8oc2tiKS0+Z3NvX3R5cGUpIHRoYXQgY2FsbCBza2JfZHVtcCBhdCBvdGhl
ciBwb2ludHMgaW4KPj4gdGhlIG5ldHdvcmsgc3RhY2suIEZvciBpbnN0YW5jZSBpbiBfX2lwX3F1
ZXVlX3htaXQgYW5kCj4+IF9fZGV2X3F1ZXVlX3htaXQuCj4+Cj4+IFNpbmNlIHNrYiBzZWdtZW50
YXRpb24gZmFpbHMgaW4gdGNwX2dzb19zZWdtZW50IGZvciBzdWNoIHBhY2tldHMsIGl0Cj4+IG1h
eSBhbHNvIGJlIGluZm9ybWF0aXZlIHRvIGRpc2FibGUgVFNPIG9uIHRoZSB2ZXRoIGRldmljZSBh
bmQgc2VlIGlmCj4+IHRoZSB0ZXN0IGZhaWxzLgo+IAo+IEFjay4KPiAKPj4KPiAKCi0tIApBbnRv
biBSLiBJdmFub3YKQ2FtYnJpZGdlZ3JleXMgTGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5k
LiBDb21wYW55IE51bWJlciAxMDI3MzY2MQpodHRwczovL3d3dy5jYW1icmlkZ2VncmV5cy5jb20v
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
