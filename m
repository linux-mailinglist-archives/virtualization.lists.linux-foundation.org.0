Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCFD95461
	for <lists.virtualization@lfdr.de>; Tue, 20 Aug 2019 04:29:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 51DEFC77;
	Tue, 20 Aug 2019 02:29:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 92FFBB65
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 02:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7BF8889B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 02:29:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E479E3DBC2;
	Tue, 20 Aug 2019 02:29:38 +0000 (UTC)
Received: from [10.72.12.194] (ovpn-12-194.pek2.redhat.com [10.72.12.194])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE73510016EA;
	Tue, 20 Aug 2019 02:29:33 +0000 (UTC)
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
	<360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
	<20190812054429-mutt-send-email-mst@kernel.org>
	<663be71f-f96d-cfbc-95a0-da0ac6b82d9f@redhat.com>
	<20190819162733-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9325de4b-1d79-eb19-306e-e7a8fa8cc1a5@redhat.com>
Date: Tue, 20 Aug 2019 10:29:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819162733-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 20 Aug 2019 02:29:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, jgg@ziepe.ca, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOC8yMCDkuIrljYg1OjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBBdWcgMTMsIDIwMTkgYXQgMDQ6MTI6NDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS84LzEyIOS4i+WNiDU6NDksIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDEwOjQ0OjUxQU0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS84LzExIOS4iuWNiDE6NTIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4gT24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDE6NDg6NDJBTSAtMDQwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+IEhpIGFsbDoKPj4+Pj4+Cj4+Pj4+PiBUaGlzIHNlcmllcyB0cnkg
dG8gZml4IHNldmVyYWwgaXNzdWVzIGludHJvZHVjZWQgYnkgbWV0YSBkYXRhCj4+Pj4+PiBhY2Nl
bHJlYXRpb24gc2VyaWVzLiBQbGVhc2UgcmV2aWV3Lgo+Pj4+Pj4KPj4+Pj4+IENoYW5nZXMgZnJv
bSBWNDoKPj4+Pj4+IC0gc3dpdGNoIHRvIHVzZSBzcGlubG9jayBzeW5jaHJvbml6ZSBNTVUgbm90
aWZpZXIgd2l0aCBhY2Nlc3NvcnMKPj4+Pj4+Cj4+Pj4+PiBDaGFuZ2VzIGZyb20gVjM6Cj4+Pj4+
PiAtIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgcGF0Y2gKPj4+Pj4+Cj4+Pj4+PiBDaGFuZ2VzIGZy
b20gVjI6Cj4+Pj4+PiAtIHVzZSBzZXFsY2sgaGVscGVyIHRvIHN5bmNocm9uaXplIE1NVSBub3Rp
ZmllciB3aXRoIHZob3N0IHdvcmtlcgo+Pj4+Pj4KPj4+Pj4+IENoYW5nZXMgZnJvbSBWMToKPj4+
Pj4+IC0gdHJ5IG5vdCB1c2UgUkNVIHRvIHN5bmNyaG9uaXplIE1NVSBub3RpZmllciB3aXRoIHZo
b3N0IHdvcmtlcgo+Pj4+Pj4gLSBzZXQgZGlydHkgcGFnZXMgYWZ0ZXIgbm8gcmVhZGVycwo+Pj4+
Pj4gLSByZXR1cm4gLUVBR0FJTiBvbmx5IHdoZW4gd2UgZmluZCB0aGUgcmFuZ2UgaXMgb3Zlcmxh
cHBlZCB3aXRoCj4+Pj4+PiAgICAgIG1ldGFkYXRhCj4+Pj4+Pgo+Pj4+Pj4gSmFzb24gV2FuZyAo
OSk6Cj4+Pj4+PiAgICAgIHZob3N0OiBkb24ndCBzZXQgdWFkZHIgZm9yIGludmFsaWQgYWRkcmVz
cwo+Pj4+Pj4gICAgICB2aG9zdDogdmFsaWRhdGUgTU1VIG5vdGlmaWVyIHJlZ2lzdHJhdGlvbgo+
Pj4+Pj4gICAgICB2aG9zdDogZml4IHZob3N0IG1hcCBsZWFrCj4+Pj4+PiAgICAgIHZob3N0OiBy
ZXNldCBpbnZhbGlkYXRlX2NvdW50IGluIHZob3N0X3NldF92cmluZ19udW1fYWRkcigpCj4+Pj4+
PiAgICAgIHZob3N0OiBtYXJrIGRpcnR5IHBhZ2VzIGR1cmluZyBtYXAgdW5pbml0Cj4+Pj4+PiAg
ICAgIHZob3N0OiBkb24ndCBkbyBzeW5jaHJvbml6ZV9yY3UoKSBpbiB2aG9zdF91bmluaXRfdnFf
bWFwcygpCj4+Pj4+PiAgICAgIHZob3N0OiBkbyBub3QgdXNlIFJDVSB0byBzeW5jaHJvbml6ZSBN
TVUgbm90aWZpZXIgd2l0aCB3b3JrZXIKPj4+Pj4+ICAgICAgdmhvc3Q6IGNvcnJlY3RseSBzZXQg
ZGlydHkgcGFnZXMgaW4gTU1VIG5vdGlmaWVycyBjYWxsYmFjawo+Pj4+Pj4gICAgICB2aG9zdDog
ZG8gbm90IHJldHVybiAtRUFHQUlOIGZvciBub24gYmxvY2tpbmcgaW52YWxpZGF0aW9uIHRvbyBl
YXJseQo+Pj4+Pj4KPj4+Pj4+ICAgICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyMDIgKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+PiAgICAgZHJpdmVycy92
aG9zdC92aG9zdC5oIHwgICA2ICstCj4+Pj4+PiAgICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5z
ZXJ0aW9ucygrKSwgODYgZGVsZXRpb25zKC0pCj4+Pj4+IFRoaXMgZ2VuZXJhbGx5IGxvb2tzIG1v
cmUgc29saWQuCj4+Pj4+Cj4+Pj4+IEJ1dCB0aGlzIGFtb3VudHMgdG8gYSBzaWduaWZpY2FudCBv
dmVyaGF1bCBvZiB0aGUgY29kZS4KPj4+Pj4KPj4+Pj4gQXQgdGhpcyBwb2ludCBob3cgYWJvdXQg
d2UgcmV2ZXJ0IDdmNDY2MDMyZGM5ZTVhNjEyMTdmMjJlYTM0YjJkZjkzMjc4NmJiZmMKPj4+Pj4g
Zm9yIHRoaXMgcmVsZWFzZSwgYW5kIHRoZW4gcmUtYXBwbHkgYSBjb3JyZWN0ZWQgdmVyc2lvbgo+
Pj4+PiBmb3IgdGhlIG5leHQgb25lPwo+Pj4+IElmIHBvc3NpYmxlLCBjb25zaWRlciB3ZSd2ZSBh
Y3R1YWxseSBkaXNhYmxlZCB0aGUgZmVhdHVyZS4gSG93IGFib3V0IGp1c3QKPj4+PiBxdWV1ZWQg
dGhvc2UgcGF0Y2hlcyBmb3IgbmV4dCByZWxlYXNlPwo+Pj4+Cj4+Pj4gVGhhbmtzCj4+PiBTb3Jy
eSBpZiBJIHdhcyB1bmNsZWFyLiBNeSBpZGVhIGlzIHRoYXQKPj4+IDEuIEkgcmV2ZXJ0IHRoZSBk
aXNhYmxlZCBjb2RlCj4+PiAyLiBZb3Ugc2VuZCBhIHBhdGNoIHJlYWRkaW5nIGl0IHdpdGggYWxs
IHRoZSBmaXhlcyBzcXVhc2hlZAo+Pj4gMy4gTWF5YmUgb3B0aW1pemF0aW9ucyBvbiB0b3Agcmln
aHQgYXdheT8KPj4+IDQuIFdlIHF1ZXVlICp0aGF0KiBmb3IgbmV4dCBhbmQgc2VlIHdoYXQgaGFw
cGVucy4KPj4+Cj4+PiBBbmQgdGhlIGFkdmFudGFnZSBvdmVyIHRoZSBwYXRjaHkgYXBwcm9hY2gg
aXMgdGhhdCB0aGUgY3VycmVudCBwYXRjaGVzCj4+PiBhcmUgaGFyZCB0byByZXZpZXcuIEUuZy4g
IGl0J3Mgbm90IHJlYXNvbmFibGUgdG8gYXNrIFJDVSBndXlzIHRvIHJldmlldwo+Pj4gdGhlIHdo
b2xlIG9mIHZob3N0IGZvciBSQ1UgdXNhZ2UgYnV0IGl0J3MgbXVjaCBtb3JlIHJlYXNvbmFibGUg
dG8gYXNrCj4+PiBhYm91dCBhIHNwZWNpZmljIHBhdGNoLgo+Pgo+PiBPay4gVGhlbiBJIGFncmVl
IHRvIHJldmVydC4KPj4KPj4gVGhhbmtzCj4gR3JlYXQsIHNvIHBsZWFzZSBzZW5kIHRoZSBmb2xs
b3dpbmc6Cj4gLSByZXZlcnQKPiAtIHNxdWFzaGVkIGFuZCBmaXhlZCBwYXRjaAoKCkp1c3QgdG8g
Y29uZmlybSwgZG8geW91IHdhbnQgbWUgdG8gc2VuZCBhIHNpbmdsZSBzZXJpZXMgb3IgdHdvPwoK
VGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
