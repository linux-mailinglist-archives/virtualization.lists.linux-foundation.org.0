Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C11150C3D
	for <lists.virtualization@lfdr.de>; Mon,  3 Feb 2020 17:34:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EBC686D63;
	Mon,  3 Feb 2020 16:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9AjoiM-JDG-B; Mon,  3 Feb 2020 16:34:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9445586CB6;
	Mon,  3 Feb 2020 16:34:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D439C0174;
	Mon,  3 Feb 2020 16:34:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B250C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 16:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6769320334
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 16:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzXkYGhQRFJW
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 16:34:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 21FE51FEED
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Feb 2020 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580747672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NykWYme8YdsCSeRKX8PrAdNrh8gNldWFRYnap5oR79k=;
 b=jWtJach0BH1mE/P2SGGEubBTcCC/PNFbWL9RAuNCt/J3jIfZi+IZhwnRHAx7GnYONxuvdU
 l184IdXA0JmWBWVFJ3oB+CN5Lw0SSNhl+HsswWOkVcDeNSuyLDtgz9IrNG/oxpXXbYW1k2
 CE6/ek4pS5GTPvMve0pMRaM7kZwc+hY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-zxD6shzvNXqZ3DMfEPygnQ-1; Mon, 03 Feb 2020 11:34:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DBA8108F9EB;
 Mon,  3 Feb 2020 16:34:25 +0000 (UTC)
Received: from [10.36.117.77] (ovpn-117-77.ams2.redhat.com [10.36.117.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E24A60BE2;
 Mon,  3 Feb 2020 16:34:20 +0000 (UTC)
Subject: Re: Balloon pressuring page cache
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Tyler Sanderson <tysand@google.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
Date: Mon, 3 Feb 2020 17:34:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: zxD6shzvNXqZ3DMfEPygnQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

T24gMDMuMDIuMjAgMTc6MTgsIEFsZXhhbmRlciBEdXljayB3cm90ZToKPiBPbiBNb24sIDIwMjAt
MDItMDMgYXQgMDg6MTEgLTA1MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4gT24gVGh1
LCBKYW4gMzAsIDIwMjAgYXQgMTE6NTk6NDZBTSAtMDgwMCwgVHlsZXIgU2FuZGVyc29uIHdyb3Rl
Ogo+Pj4KPj4+IE9uIFRodSwgSmFuIDMwLCAyMDIwIGF0IDc6MzEgQU0gV2FuZywgV2VpIFcgPHdl
aS53LndhbmdAaW50ZWwuY29tPiB3cm90ZToKPj4+Cj4+PiAgICAgT24gVGh1cnNkYXksIEphbnVh
cnkgMzAsIDIwMjAgMTE6MDMgUE0sIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4gICAgID4g
T24gMjkuMDEuMjAgMjA6MTEsIFR5bGVyIFNhbmRlcnNvbiB3cm90ZToKPj4+ICAgICA+ID4KPj4+
ICAgICA+ID4KPj4+ICAgICA+ID4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMjozMSBBTSBEYXZp
ZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbQo+Pj4gICAgID4gPiA8bWFpbHRvOmRhdmlk
QHJlZGhhdC5jb20+PiB3cm90ZToKPj4+ICAgICA+ID4KPj4+ICAgICA+ID4gICAgIE9uIDI5LjAx
LjIwIDAxOjIyLCBUeWxlciBTYW5kZXJzb24gdmlhIFZpcnR1YWxpemF0aW9uIHdyb3RlOgo+Pj4g
ICAgID4gPiAgICAgPiBBIHByaW1hcnkgYWR2YW50YWdlIG9mIHZpcnRpbyBiYWxsb29uIG92ZXIg
b3RoZXIgbWVtb3J5IHJlY2xhaW0KPj4+ICAgICA+ID4gICAgID4gbWVjaGFuaXNtcyBpcyB0aGF0
IGl0IGNhbiBwcmVzc3VyZSB0aGUgZ3Vlc3QncyBwYWdlIGNhY2hlIGludG8KPj4+ICAgICA+ID4g
ICAgIHNocmlua2luZy4KPj4+ICAgICA+ID4gICAgID4KPj4+ICAgICA+ID4gICAgID4gSG93ZXZl
ciwgc2luY2UgdGhlIGJhbGxvb24gZHJpdmVyIGNoYW5nZWQgdG8gdXNpbmcgdGhlIHNocmlua2Vy
Cj4+PiAgICAgQVBJCj4+PiAgICAgPiA+ICAgICA+Cj4+PiAgICAgPiA+Cj4+PiAgICAgPiA8aHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC83MTk5NDYyMGJiMjVhOGIxMDkz
ODhmZWZhOQo+Pj4gICAgID4gZTk5YTI4ZTM1NTI1NWEjZGlmZi1mZDIwMmFjZjY5NGQ5ZWJhMTlj
OGM2NGRhM2U0ODBjOT4gdGhpcwo+Pj4gICAgID4gPiAgICAgPiB1c2UgY2FzZSBoYXMgYmVjb21l
IGEgYml0IG1vcmUgdHJpY2t5LiBJJ20gd29uZGVyaW5nIHdoYXQgdGhlCj4+PiAgICAgPiBpbnRl
bmRlZAo+Pj4gICAgID4gPiAgICAgPiBkZXZpY2UgaW1wbGVtZW50YXRpb24gaXMuCj4+PiAgICAg
PiA+ICAgICA+Cj4+PiAgICAgPiA+ICAgICA+IFdoZW4gaW5mbGF0aW5nIHRoZSBiYWxsb29uIGFn
YWluc3QgcGFnZSBjYWNoZSAoaS5lLiBubyBmcmVlCj4+PiAgICAgbWVtb3J5Cj4+PiAgICAgPiA+
ICAgICA+IHJlbWFpbnMpIHZtc2Nhbi5jIHdpbGwgYm90aCBzaHJpbmsgcGFnZSBjYWNoZSwgYnV0
IGFsc28gaW52b2tlCj4+PiAgICAgdGhlCj4+PiAgICAgPiA+ICAgICA+IHNocmlua2VycyAtLSBp
bmNsdWRpbmcgdGhlIGJhbGxvb24ncyBzaHJpbmtlci4gU28gdGhlIGJhbGxvb24KPj4+ICAgICBk
cml2ZXIKPj4+ICAgICA+ID4gICAgID4gYWxsb2NhdGVzIG1lbW9yeSB3aGljaCByZXF1aXJlcyBy
ZWNsYWltLCB2bXNjYW4gZ2V0cyB0aGlzIG1lbW9yeQo+Pj4gICAgID4gYnkKPj4+ICAgICA+ID4g
ICAgID4gc2hyaW5raW5nIHRoZSBiYWxsb29uLCBhbmQgdGhlbiB0aGUgZHJpdmVyIGFkZHMgdGhl
IG1lbW9yeSBiYWNrCj4+PiAgICAgdG8KPj4+ICAgICA+IHRoZQo+Pj4gICAgID4gPiAgICAgPiBi
YWxsb29uLiBCYXNpY2FsbHkgYSBidXN5IG5vLW9wLgo+Pj4KPj4+ICAgICBQZXIgbXkgdW5kZXJz
dGFuZGluZywgdGhlIGJhbGxvb24gYWxsb2NhdGlvbiB3b27igJl0IGludm9rZSBzaHJpbmtlciBh
cwo+Pj4gICAgIF9fR0ZQX0RJUkVDVF9SRUNMQUlNIGlzbid0IHNldCwgbm8/Cj4+Pgo+Pj4gSSBj
b3VsZCBiZSB3cm9uZyBhYm91dCB0aGUgbWVjaGFuaXNtLCBidXQgdGhlIGRldmljZSBzZWVzIGxv
dHMgb2YgYWN0aXZpdHkgb24KPj4+IHRoZSBkZWZsYXRlIHF1ZXVlLiBUaGUgYmFsbG9vbiBpcyBi
ZWluZyBzaHJ1bmsuIEFuZCB0aGlzIG9ubHkgc3RhcnRzIG9uY2UgYWxsCj4+PiBmcmVlIG1lbW9y
eSBpcyBkZXBsZXRlZCBhbmQgd2UncmUgaW5mbGF0aW5nIGludG8gcGFnZSBjYWNoZS4KPj4KPj4g
U28gZ2l2ZW4gdGhpcyBsb29rcyBsaWtlIGEgcmVncmVzc2lvbiwgbWF5YmUgd2Ugc2hvdWxkIHJl
dmVydCB0aGUKPj4gcGF0Y2ggaW4gcXVlc3Rpb24gNzE5OTQ2MjBiYjI1ICgidmlydGlvX2JhbGxv
b246IHJlcGxhY2Ugb29tIG5vdGlmaWVyIHdpdGggc2hyaW5rZXIiKQo+PiBCZXNpZGVzLCB3aXRo
IFZJUlRJT19CQUxMT09OX0ZfRlJFRV9QQUdFX0hJTlQKPj4gc2hyaW5rZXIgYWxzbyBpZ25vcmVz
IFZJUlRJT19CQUxMT09OX0ZfTVVTVF9URUxMX0hPU1Qgd2hpY2ggaXNuJ3QgbmljZQo+PiBhdCBh
bGwuCj4+Cj4+IFNvIGl0IGxvb2tzIGxpa2UgYWxsIHRoaXMgcmV3b3JrIGludHJvZHVjZWQgbW9y
ZSBpc3N1ZXMgdGhhbiBpdAo+PiBhZGRyZXNzZWQgLi4uCj4+Cj4+IEkgYWxzbyBDQyBBbGV4IER1
eWNrIGZvciBhbiBvcGluaW9uIG9uIHRoaXMuCj4+IEFsZXgsIHdoYXQgZG8geW91IHVzZSB0byBw
dXQgcHJlc3N1cmUgb24gcGFnZSBjYWNoZT8KPiAKPiBJIHdvdWxkIHNheSByZXZlcnRpbmcgcHJv
YmFibHkgbWFrZXMgc2Vuc2UuIEknbSBub3Qgc3VyZSB0aGVyZSBpcyBtdWNoCj4gdmFsdWUgdG8g
aGF2aW5nIGEgc2hyaW5rZXIgcnVubmluZyBkZWZsYXRpb24gd2hlbiB5b3UgYXJlIGFjdGl2ZWx5
IHRyeWluZwo+IHRvIGluY3JlYXNlIHRoZSBiYWxsb29uLiBJdCB3b3VsZCBtYWtlIG1vcmUgc2Vu
c2UgdG8gd2FpdCB1bnRpbCB5b3UgYXJlCj4gYWN0dWFsbHkgYWJvdXQgdG8gc3RhcnQgaGl0dGlu
ZyBvb20uCgpJIHRoaW5rIHRoZSBzaHJpbmtlciBtYWtlcyBzZW5zZSBmb3IgZnJlZSBwYWdlIGhp
bnRpbmcgZmVhdHVyZQooZXZlcnl0aGluZyBvbiBmcmVlX3BhZ2VfbGlzdCkuCgpTbyBpbnN0ZWFk
IG9mIG9ubHkgcmV2ZXJ0aW5nLCBJIHRoaW5rIHdlIHNob3VsZCBzcGxpdCBpdCB1cCBhbmQgYWx3
YXlzCnJlZ2lzdGVyIHRoZSBzaHJpbmtlciBmb3IgVklSVElPX0JBTExPT05fRl9GUkVFX1BBR0Vf
SElOVCBhbmQgdGhlIE9PTQpub3RpZmllciAoYXMgYmVmb3JlKSBmb3IgVklSVElPX0JBTExPT05f
Rl9NVVNUX1RFTExfSE9TVC4KCihPZiBjb3Vyc2UsIGFkYXB0aW5nIHdoYXQgaXMgYmVpbmcgZG9u
ZSBpbiB0aGUgc2hyaW5rZXIgYW5kIGluIHRoZSBPT00Kbm90aWZpZXIpCgotLSAKVGhhbmtzLAoK
RGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
