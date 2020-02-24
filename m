Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C8316B15C
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 21:59:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 70CA285D21;
	Mon, 24 Feb 2020 20:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xw4FgPUFSe4v; Mon, 24 Feb 2020 20:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2FB4E85B8A;
	Mon, 24 Feb 2020 20:59:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11F68C0177;
	Mon, 24 Feb 2020 20:59:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52010C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A25385ABE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R513L8KX8f8a
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:59:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1823C8577C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 20:59:23 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6Kow-0007LH-2s; Mon, 24 Feb 2020 20:59:18 +0000
Received: from sleer.kot-begemot.co.uk ([192.168.3.72])
 by jain.kot-begemot.co.uk with esmtps
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6Kot-0003JJ-TM; Mon, 24 Feb 2020 20:59:17 +0000
Subject: Re: [PATCH v3] virtio: Work around frames incorrectly marked as gso
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
References: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
 <CA+FuTSd8P6uQnwisZEh7+nfowW9qKLBEvA4GPg+xUkjBa-6TDA@mail.gmail.com>
 <4e7757cf-148e-4585-b358-3b38f391275d@cambridgegreys.com>
 <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <93cb2b3f-6cae-8cf1-5fab-93fa34c14628@cambridgegreys.com>
Date: Mon, 24 Feb 2020 20:59:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+FuTSdOCJZCVS4xohx+BQmkmq8JALnK=gGc0=qy1TbjY707ag@mail.gmail.com>
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

T24gMjQvMDIvMjAyMCAyMDoyMCwgV2lsbGVtIGRlIEJydWlqbiB3cm90ZToKPiBPbiBNb24sIEZl
YiAyNCwgMjAyMCBhdCAyOjU1IFBNIEFudG9uIEl2YW5vdgo+IDxhbnRvbi5pdmFub3ZAY2FtYnJp
ZGdlZ3JleXMuY29tPiB3cm90ZToKPj4gT24gMjQvMDIvMjAyMCAxOToyNywgV2lsbGVtIGRlIEJy
dWlqbiB3cm90ZToKPj4+IE9uIE1vbiwgRmViIDI0LCAyMDIwIGF0IDg6MjYgQU0gPGFudG9uLml2
YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+IHdyb3RlOgo+Pj4+IEZyb206IEFudG9uIEl2YW5vdiA8
YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPj4+Pgo+Pj4+IFNvbWUgb2YgdGhlIGxv
Y2FsbHkgZ2VuZXJhdGVkIGZyYW1lcyBtYXJrZWQgYXMgR1NPIHdoaWNoCj4+Pj4gYXJyaXZlIGF0
IHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiKCkgaGF2ZSBubyBHU09fVFlQRSwgbm8KPj4+PiBmcmFn
bWVudHMgKGRhdGFfbGVuID0gMCkgYW5kIGxlbmd0aCBzaWduaWZpY2FudGx5IHNob3J0ZXIKPj4+
PiB0aGFuIHRoZSBNVFUgKDc1MiBpbiBteSBleHBlcmltZW50cykuCj4+PiBEbyB3ZSB1bmRlcnN0
YW5kIGhvdyB0aGVzZSBwYWNrZXRzIGFyZSBnZW5lcmF0ZWQ/Cj4+IE5vLCB3ZSBoYXZlIG5vdCBi
ZWVuIGFibGUgdG8gdHJhY2UgdGhlbS4KPj4KPj4gVGhlIG9ubHkgdGhpbmcgd2Uga25vdyBpcyB0
aGF0IHRoaXMgaXMgc3BlY2lmaWMgdG8gbG9jYWxseSBnZW5lcmF0ZWQKPj4gcGFja2V0cy4gU29t
ZXRoaW5nIGFycml2aW5nIGZyb20gdGhlIG5ldHdvcmsgZG9lcyBub3Qgc2hvdyB0aGlzLgo+Pgo+
Pj4gRWxzZSBpdCBzZWVtcyB0aGlzCj4+PiBtaWdodCBiZSBwYXBlcmluZyBvdmVyIGEgZGVlcGVy
IHByb2JsZW0uCj4+Pgo+Pj4gVGhlIHN0YWNrIHNob3VsZCBub3QgY3JlYXRlIEdTTyBwYWNrZXRz
IGxlc3MgdGhhbiBvciBlcXVhbCB0bwo+Pj4gc2tiX3NoaW5mbyhza2IpLT5nc29fc2l6ZS4gU2Vl
IGZvciBpbnN0YW5jZSB0aGUgY2hlY2sgaW4KPj4+IHRjcF9nc29fc2VnbWVudCBhZnRlciBwdWxs
aW5nIHRoZSB0Y3AgaGVhZGVyOgo+Pj4KPj4+ICAgICAgICAgICBtc3MgPSBza2Jfc2hpbmZvKHNr
YiktPmdzb19zaXplOwo+Pj4gICAgICAgICAgIGlmICh1bmxpa2VseShza2ItPmxlbiA8PSBtc3Mp
KQo+Pj4gICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4+Pgo+Pj4gV2hhdCBpcyB0aGUgZ3Nv
X3R5cGUsIGFuZCBkb2VzIGl0IGluY2x1ZGUgU0tCX0dTT19ET0RHWT8KPj4+Cj4+Cj4+IDAgLSBu
b3Qgc2V0Lgo+IFRoYW5rcyBmb3IgdGhlIGZvbGxvdy11cCBkZXRhaWxzLiBJcyB0aGlzIHNvbWV0
aGluZyB0aGF0IHlvdSBjYW4gdHJpZ2dlciBlYXNpbHk/CgpZZXMsIGlmIHlvdSBoYXZlIGEgVU1M
IGluc3RhbmNlIGhhbmR5LgoKUnVubmluZyBpcGVyZiBiZXR3ZWVuIHRoZSBob3N0IGFuZCBhIFVN
TCBndWVzdCB1c2luZyByYXcgc29ja2V0IAp0cmFuc3BvcnQgdHJpZ2dlcnMgaXQgaW1tZWRpYXRl
bHkuCgpUaGlzIGlzIG15IFVNTCBjb21tYW5kIGxpbmU6Cgp2bWxpbnV4IG1lbT0yMDQ4TSB1bWlk
PU9QWCBcCiDCoMKgwqAgdWJkMD1PUFgtMy4wLVdvcmsuaW1nIFwKdmVjMDp0cmFuc3BvcnQ9cmF3
LGlmbmFtZT1wLXZldGgwLGRlcHRoPTEyOCxncm89MSxtYWM9OTI6OWI6MzY6NWU6Mzg6NjkgXAog
wqDCoMKgIHJvb3Q9L2Rldi91YmRhIHJvIGNvbj1udWxsIGNvbjA9bnVsbCxmZDoyIGNvbjE9ZmQ6
MCxmZDoxCgpwLXJpZ2h0IGlzIGEgcGFydCBvZiBhIHZFdGggcGFpcjoKCmlwIGxpbmsgYWRkIGwt
dmV0aDAgdHlwZSB2ZXRoIHBlZXIgbmFtZSBwLXZldGgwICYmIGlmY29uZmlnIHAtdmV0aDAgdXAK
CmlwZXJmIHNlcnZlciBpcyBvbiBob3N0LCBpcGVyZiAtYyBpbiB0aGUgZ3Vlc3QuCgo+Cj4gQW4g
c2tiX2R1bXAoKSArIGR1bXBfc3RhY2soKSB3aGVuIHRoZSBwYWNrZXQgc29ja2V0IGdldHMgc3Vj
aCBhCj4gcGFja2V0IG1heSBwb2ludCB1cyB0byB0aGUgcm9vdCBjYXVzZSBhbmQgZml4IHRoYXQu
CgpXZSB0cmllZCBkdW1wIHN0YWNrLCBpdCB3YXMgbm90IGluZm9ybWF0aXZlIC0gaXQgd2FzIGp1
c3QgdGhlIHJlY3ZtbXNnIApjYWxsIHN0YWNrIGNvbWluZyBmcm9tIHRoZSBVTUwgdW50aWwgaXQg
aGl0cyB0aGUgcmVsZXZhbnQgcmVjdiBiaXQgaW4gCmFmX3BhY2tldCAtIGl0IGRvZXMgbm90IHRl
bGwgdXMgd2hlcmUgdGhlIHBhY2tldCBpcyBjb21pbmcgZnJvbS4KClF1b3RpbmcgZnJvbSB0aGUg
bWVzc2FnZSBlYXJsaWVyIGluIHRoZSB0aHJlYWQ6CgpbIDIzMzQuMTgwODU0XSBDYWxsIFRyYWNl
OgpbIDIzMzQuMTgxOTQ3XcKgIGR1bXBfc3RhY2srMHg1Yy8weDgwClsgMjMzNC4xODMwMjFdwqAg
cGFja2V0X3JlY3Ztc2cuY29sZCsweDIzLzB4NDkKWyAyMzM0LjE4NDA2M13CoCBfX19zeXNfcmVj
dm1zZysweGUxLzB4MWYwClsgMjMzNC4xODUwMzRdwqAgPyBwYWNrZXRfcG9sbCsweGNhLzB4MTMw
ClsgMjMzNC4xODYwMTRdwqAgPyBzb2NrX3BvbGwrMHg3Ny8weGIwClsgMjMzNC4xODY5NzddwqAg
PyBlcF9pdGVtX3BvbGwuaXNyYS4wKzB4M2YvMHhiMApbIDIzMzQuMTg3OTM2XcKgID8gZXBfc2Vu
ZF9ldmVudHNfcHJvYysweGYxLzB4MjQwClsgMjMzNC4xODg5MDFdwqAgPyBkZXF1ZXVlX3NpZ25h
bCsweGRiLzB4MTgwClsgMjMzNC4xODk4NDhdwqAgZG9fcmVjdm1tc2crMHhjOC8weDJkMApbIDIz
MzQuMTkwNzI4XcKgID8gZXBfcG9sbCsweDhjLzB4NDcwClsgMjMzNC4xOTE1ODFdwqAgX19zeXNf
cmVjdm1tc2crMHgxMDgvMHgxNTAKWyAyMzM0LjE5MjQ0MV3CoCBfX3g2NF9zeXNfcmVjdm1tc2cr
MHgyNS8weDMwClsgMjMzNC4xOTMzNDZdwqAgZG9fc3lzY2FsbF82NCsweDUzLzB4MTQwClsgMjMz
NC4xOTQyNjJdwqAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQoKPgoK
LS0gCkFudG9uIFIuIEl2YW5vdgpDYW1icmlkZ2VncmV5cyBMaW1pdGVkLiBSZWdpc3RlcmVkIGlu
IEVuZ2xhbmQuIENvbXBhbnkgTnVtYmVyIDEwMjczNjYxCmh0dHBzOi8vd3d3LmNhbWJyaWRnZWdy
ZXlzLmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==
