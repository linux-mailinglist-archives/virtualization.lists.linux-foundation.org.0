Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E613E152782
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 09:20:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A6C1861E7;
	Wed,  5 Feb 2020 08:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yc57kqwfbdFN; Wed,  5 Feb 2020 08:20:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B29FE861D2;
	Wed,  5 Feb 2020 08:20:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EFEEC1D82;
	Wed,  5 Feb 2020 08:20:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33D0BC0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F5B3861D2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wL6W8C7wuluQ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:20:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 423368618E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 08:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580890809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Pv73UGwJzFS2o23n3ZY6mHPWqAiB7auhiImTcV5G7BA=;
 b=go2HY+K33+bBCHTY3oYY9UKif8mKIyP+AZcNBhHbJ8Yw7UgxE3lB/S/zPnqGqV7sSfJmud
 DeGQKeZM4YtBiOuZdHz+y1y+OUNinWcfaryp89lfqeOuqWlLL2MWJV33wdu2+c+1e/1W9c
 p5d3SXrKamdmBqUYb7rmkBP+vZRbTBI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-Ht8HAqdANX-9Ti2ApN923Q-1; Wed, 05 Feb 2020 03:20:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD798801E76;
 Wed,  5 Feb 2020 08:20:03 +0000 (UTC)
Received: from [10.36.116.217] (ovpn-116-217.ams2.redhat.com [10.36.116.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FE2284779;
 Wed,  5 Feb 2020 08:19:59 +0000 (UTC)
Subject: Re: Balloon pressuring page cache
To: Nadav Amit <namit@vmware.com>
References: <CAJuQAmpDUyve2S+oxp9tLUhuRcnddXnNztC5PmYOOCpY6c68xg@mail.gmail.com>
 <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <08D323B9-0B4A-47B2-9955-511B8FBA056B@vmware.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <dd5aa189-daed-7008-d02b-4e5bd61fe6e1@redhat.com>
Date: Wed, 5 Feb 2020 09:19:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <08D323B9-0B4A-47B2-9955-511B8FBA056B@vmware.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Ht8HAqdANX-9Ti2ApN923Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Tyler Sanderson <tysand@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Michal Hocko <mhocko@kernel.org>
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

T24gMDUuMDIuMjAgMDg6MzUsIE5hZGF2IEFtaXQgd3JvdGU6Cj4+IE9uIEZlYiAzLCAyMDIwLCBh
dCAyOjUwIFBNLCBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPiB3cm90ZToKPj4KPj4+IE9u
IEZlYiAzLCAyMDIwLCBhdCA4OjM0IEFNLCBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24gMDMuMDIuMjAgMTc6MTgsIEFsZXhhbmRlciBEdXljayB3
cm90ZToKPj4+PiBPbiBNb24sIDIwMjAtMDItMDMgYXQgMDg6MTEgLTA1MDAsIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToKPj4+Pj4gT24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMTE6NTk6NDZBTSAt
MDgwMCwgVHlsZXIgU2FuZGVyc29uIHdyb3RlOgo+Pj4+Pj4gT24gVGh1LCBKYW4gMzAsIDIwMjAg
YXQgNzozMSBBTSBXYW5nLCBXZWkgVyA8d2VpLncud2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+Pj4+
Pj4KPj4+Pj4+ICAgT24gVGh1cnNkYXksIEphbnVhcnkgMzAsIDIwMjAgMTE6MDMgUE0sIERhdmlk
IEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+Pj4+IE9uIDI5LjAxLjIwIDIwOjExLCBUeWxlciBTYW5k
ZXJzb24gd3JvdGU6Cj4+Pj4+Pj4+IE9uIFdlZCwgSmFuIDI5LCAyMDIwIGF0IDI6MzEgQU0gRGF2
aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20KPj4+Pj4+Pj4gPG1haWx0bzpkYXZpZEBy
ZWRoYXQuY29tPj4gd3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgT24gMjkuMDEuMjAgMDE6MjIs
IFR5bGVyIFNhbmRlcnNvbiB2aWEgVmlydHVhbGl6YXRpb24gd3JvdGU6Cj4+Pj4+Pj4+PiBBIHBy
aW1hcnkgYWR2YW50YWdlIG9mIHZpcnRpbyBiYWxsb29uIG92ZXIgb3RoZXIgbWVtb3J5IHJlY2xh
aW0KPj4+Pj4+Pj4+IG1lY2hhbmlzbXMgaXMgdGhhdCBpdCBjYW4gcHJlc3N1cmUgdGhlIGd1ZXN0
J3MgcGFnZSBjYWNoZSBpbnRvCj4+Pj4+Pj4+ICAgc2hyaW5raW5nLgo+Pj4+Pj4+Pj4gSG93ZXZl
ciwgc2luY2UgdGhlIGJhbGxvb24gZHJpdmVyIGNoYW5nZWQgdG8gdXNpbmcgdGhlIHNocmlua2Vy
Cj4+Pj4+PiAgIEFQSQo+Pj4+Pj4+IDxodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgv
Y29tbWl0LzcxOTk0NjIwYmIyNWE4YjEwOTM4OGZlZmE5Cj4+Pj4+Pj4gZTk5YTI4ZTM1NTI1NWEj
ZGlmZi1mZDIwMmFjZjY5NGQ5ZWJhMTljOGM2NGRhM2U0ODBjOT4gdGhpcwo+Pj4+Pj4+Pj4gdXNl
IGNhc2UgaGFzIGJlY29tZSBhIGJpdCBtb3JlIHRyaWNreS4gSSdtIHdvbmRlcmluZyB3aGF0IHRo
ZQo+Pj4+Pj4+IGludGVuZGVkCj4+Pj4+Pj4+PiBkZXZpY2UgaW1wbGVtZW50YXRpb24gaXMuCj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2hlbiBpbmZsYXRpbmcgdGhlIGJhbGxvb24gYWdhaW5zdCBwYWdl
IGNhY2hlIChpLmUuIG5vIGZyZWUKPj4+Pj4+ICAgbWVtb3J5Cj4+Pj4+Pj4+PiByZW1haW5zKSB2
bXNjYW4uYyB3aWxsIGJvdGggc2hyaW5rIHBhZ2UgY2FjaGUsIGJ1dCBhbHNvIGludm9rZQo+Pj4+
Pj4gICB0aGUKPj4+Pj4+Pj4+IHNocmlua2VycyAtLSBpbmNsdWRpbmcgdGhlIGJhbGxvb24ncyBz
aHJpbmtlci4gU28gdGhlIGJhbGxvb24KPj4+Pj4+ICAgZHJpdmVyCj4+Pj4+Pj4+PiBhbGxvY2F0
ZXMgbWVtb3J5IHdoaWNoIHJlcXVpcmVzIHJlY2xhaW0sIHZtc2NhbiBnZXRzIHRoaXMgbWVtb3J5
Cj4+Pj4+Pj4gYnkKPj4+Pj4+Pj4+IHNocmlua2luZyB0aGUgYmFsbG9vbiwgYW5kIHRoZW4gdGhl
IGRyaXZlciBhZGRzIHRoZSBtZW1vcnkgYmFjawo+Pj4+Pj4gICB0bwo+Pj4+Pj4+IHRoZQo+Pj4+
Pj4+Pj4gYmFsbG9vbi4gQmFzaWNhbGx5IGEgYnVzeSBuby1vcC4KPj4+Pj4+Cj4+Pj4+PiAgIFBl
ciBteSB1bmRlcnN0YW5kaW5nLCB0aGUgYmFsbG9vbiBhbGxvY2F0aW9uIHdvbuKAmXQgaW52b2tl
IHNocmlua2VyIGFzCj4+Pj4+PiAgIF9fR0ZQX0RJUkVDVF9SRUNMQUlNIGlzbid0IHNldCwgbm8/
Cj4+Pj4+Pgo+Pj4+Pj4gSSBjb3VsZCBiZSB3cm9uZyBhYm91dCB0aGUgbWVjaGFuaXNtLCBidXQg
dGhlIGRldmljZSBzZWVzIGxvdHMgb2YgYWN0aXZpdHkgb24KPj4+Pj4+IHRoZSBkZWZsYXRlIHF1
ZXVlLiBUaGUgYmFsbG9vbiBpcyBiZWluZyBzaHJ1bmsuIEFuZCB0aGlzIG9ubHkgc3RhcnRzIG9u
Y2UgYWxsCj4+Pj4+PiBmcmVlIG1lbW9yeSBpcyBkZXBsZXRlZCBhbmQgd2UncmUgaW5mbGF0aW5n
IGludG8gcGFnZSBjYWNoZS4KPj4+Pj4KPj4+Pj4gU28gZ2l2ZW4gdGhpcyBsb29rcyBsaWtlIGEg
cmVncmVzc2lvbiwgbWF5YmUgd2Ugc2hvdWxkIHJldmVydCB0aGUKPj4+Pj4gcGF0Y2ggaW4gcXVl
c3Rpb24gNzE5OTQ2MjBiYjI1ICgidmlydGlvX2JhbGxvb246IHJlcGxhY2Ugb29tIG5vdGlmaWVy
IHdpdGggc2hyaW5rZXIiKQo+Pj4+PiBCZXNpZGVzLCB3aXRoIFZJUlRJT19CQUxMT09OX0ZfRlJF
RV9QQUdFX0hJTlQKPj4+Pj4gc2hyaW5rZXIgYWxzbyBpZ25vcmVzIFZJUlRJT19CQUxMT09OX0Zf
TVVTVF9URUxMX0hPU1Qgd2hpY2ggaXNuJ3QgbmljZQo+Pj4+PiBhdCBhbGwuCj4+Pj4+Cj4+Pj4+
IFNvIGl0IGxvb2tzIGxpa2UgYWxsIHRoaXMgcmV3b3JrIGludHJvZHVjZWQgbW9yZSBpc3N1ZXMg
dGhhbiBpdAo+Pj4+PiBhZGRyZXNzZWQgLi4uCj4+Pj4+Cj4+Pj4+IEkgYWxzbyBDQyBBbGV4IER1
eWNrIGZvciBhbiBvcGluaW9uIG9uIHRoaXMuCj4+Pj4+IEFsZXgsIHdoYXQgZG8geW91IHVzZSB0
byBwdXQgcHJlc3N1cmUgb24gcGFnZSBjYWNoZT8KPj4+Pgo+Pj4+IEkgd291bGQgc2F5IHJldmVy
dGluZyBwcm9iYWJseSBtYWtlcyBzZW5zZS4gSSdtIG5vdCBzdXJlIHRoZXJlIGlzIG11Y2gKPj4+
PiB2YWx1ZSB0byBoYXZpbmcgYSBzaHJpbmtlciBydW5uaW5nIGRlZmxhdGlvbiB3aGVuIHlvdSBh
cmUgYWN0aXZlbHkgdHJ5aW5nCj4+Pj4gdG8gaW5jcmVhc2UgdGhlIGJhbGxvb24uIEl0IHdvdWxk
IG1ha2UgbW9yZSBzZW5zZSB0byB3YWl0IHVudGlsIHlvdSBhcmUKPj4+PiBhY3R1YWxseSBhYm91
dCB0byBzdGFydCBoaXR0aW5nIG9vbS4KPj4+Cj4+PiBJIHRoaW5rIHRoZSBzaHJpbmtlciBtYWtl
cyBzZW5zZSBmb3IgZnJlZSBwYWdlIGhpbnRpbmcgZmVhdHVyZQo+Pj4gKGV2ZXJ5dGhpbmcgb24g
ZnJlZV9wYWdlX2xpc3QpLgo+Pj4KPj4+IFNvIGluc3RlYWQgb2Ygb25seSByZXZlcnRpbmcsIEkg
dGhpbmsgd2Ugc2hvdWxkIHNwbGl0IGl0IHVwIGFuZCBhbHdheXMKPj4+IHJlZ2lzdGVyIHRoZSBz
aHJpbmtlciBmb3IgVklSVElPX0JBTExPT05fRl9GUkVFX1BBR0VfSElOVCBhbmQgdGhlIE9PTQo+
Pj4gbm90aWZpZXIgKGFzIGJlZm9yZSkgZm9yIFZJUlRJT19CQUxMT09OX0ZfTVVTVF9URUxMX0hP
U1QuCj4+Pgo+Pj4gKE9mIGNvdXJzZSwgYWRhcHRpbmcgd2hhdCBpcyBiZWluZyBkb25lIGluIHRo
ZSBzaHJpbmtlciBhbmQgaW4gdGhlIE9PTQo+Pj4gbm90aWZpZXIpCj4+Cj4+IERhdmlkLAo+Pgo+
PiBQbGVhc2Uga2VlcCBtZSBwb3N0ZWQuIEkgZGVjaWRlZCB0byBhZGFwdCB0aGUgc2FtZSBzb2x1
dGlvbiBhcyB0aGUgdmlydGlvCj4+IGJhbGxvb24gZm9yIHRoZSBWTXdhcmUgYmFsbG9vbi4gSWYg
dGhlIHZlcmRpY3QgaXMgdGhhdCB0aGlzIGlzIGRhbWFnaW5nIGFuZAo+PiB0aGUgT09NIG5vdGlm
aWVyIHNob3VsZCBiZSB1c2VkIGluc3RlYWQsIEkgd2lsbCBzdWJtaXQgcGF0Y2hlcyB0byBtb3Zl
IHRvCj4+IE9PTSBub3RpZmllciBhcyB3ZWxsLgo+IAo+IEFkZGluZyBzb21lIGluZm9ybWF0aW9u
IGZvciB0aGUgcmVjb3JkIChpZiBzb21lb25lIGdvb2dsZXMgdGhpcyB0aHJlYWQpOgo+IAo+IElu
IHRoZSBWTXdhcmUgYmFsbG9vbiBkcml2ZXIsIHRoZSBzaHJpbmtlciBpcyBkaXNhYmxlZCBieSBk
ZWZhdWx0IHNpbmNlIHdlCj4gZW5jb3VudGVyZWQgYSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbiBp
biB0ZXN0aW5nLiBJIHRyaWVkIHRvIGF2b2lkIHJhcGlkCj4gaW5mbGF0aW9uL3Nocmlua2VyLWRl
ZmxhdGlvbiBjeWNsZXMgYnkgYWRkaW5nIGEgdGltZW91dCwgYnV0IGFwcGFyZW50bHkgaXQKPiBk
aWQgbm90IGhlbHAgaW4gYXZvaWRpbmcgdGhlIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24uCgpUaGFu
a3MgZm9yIHRoYXQgaW5mby4gVG8gbWUgdGhhdCBzb3VuZHMgbGlrZSB0aGUgc2hyaW5rZXIgaXMg
dGhlIHdyb25nCmFwcHJvYWNoIHRvICJhdXRvLWRlZmxhdGlvbiIuIEl0J3Mgbm90IGp1c3QgInNv
bWUgc2xhYiBjYWNoZSIuCgoKLS0gClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
