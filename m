Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6421D8956F
	for <lists.virtualization@lfdr.de>; Mon, 12 Aug 2019 04:45:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0A90941;
	Mon, 12 Aug 2019 02:44:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 05DD02C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 02:44:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A8BFA87B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 12 Aug 2019 02:44:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBAC63090FCF;
	Mon, 12 Aug 2019 02:44:56 +0000 (UTC)
Received: from [10.72.12.78] (ovpn-12-78.pek2.redhat.com [10.72.12.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0273610016E8;
	Mon, 12 Aug 2019 02:44:51 +0000 (UTC)
Subject: Re: [PATCH V5 0/9] Fixes for vhost metadata acceleration
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190809054851.20118-1-jasowang@redhat.com>
	<20190810134948-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <360a3b91-1ac5-84c0-d34b-a4243fa748c4@redhat.com>
Date: Mon, 12 Aug 2019 10:44:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810134948-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 12 Aug 2019 02:44:57 +0000 (UTC)
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

Ck9uIDIwMTkvOC8xMSDkuIrljYgxOjUyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBBdWcgMDksIDIwMTkgYXQgMDE6NDg6NDJBTSAtMDQwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gSGkgYWxsOgo+Pgo+PiBUaGlzIHNlcmllcyB0cnkgdG8gZml4IHNldmVyYWwgaXNzdWVzIGlu
dHJvZHVjZWQgYnkgbWV0YSBkYXRhCj4+IGFjY2VscmVhdGlvbiBzZXJpZXMuIFBsZWFzZSByZXZp
ZXcuCj4+Cj4+IENoYW5nZXMgZnJvbSBWNDoKPj4gLSBzd2l0Y2ggdG8gdXNlIHNwaW5sb2NrIHN5
bmNocm9uaXplIE1NVSBub3RpZmllciB3aXRoIGFjY2Vzc29ycwo+Pgo+PiBDaGFuZ2VzIGZyb20g
VjM6Cj4+IC0gcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwYXRjaAo+Pgo+PiBDaGFuZ2VzIGZyb20g
VjI6Cj4+IC0gdXNlIHNlcWxjayBoZWxwZXIgdG8gc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdp
dGggdmhvc3Qgd29ya2VyCj4+Cj4+IENoYW5nZXMgZnJvbSBWMToKPj4gLSB0cnkgbm90IHVzZSBS
Q1UgdG8gc3luY3Job25pemUgTU1VIG5vdGlmaWVyIHdpdGggdmhvc3Qgd29ya2VyCj4+IC0gc2V0
IGRpcnR5IHBhZ2VzIGFmdGVyIG5vIHJlYWRlcnMKPj4gLSByZXR1cm4gLUVBR0FJTiBvbmx5IHdo
ZW4gd2UgZmluZCB0aGUgcmFuZ2UgaXMgb3ZlcmxhcHBlZCB3aXRoCj4+ICAgIG1ldGFkYXRhCj4+
Cj4+IEphc29uIFdhbmcgKDkpOgo+PiAgICB2aG9zdDogZG9uJ3Qgc2V0IHVhZGRyIGZvciBpbnZh
bGlkIGFkZHJlc3MKPj4gICAgdmhvc3Q6IHZhbGlkYXRlIE1NVSBub3RpZmllciByZWdpc3RyYXRp
b24KPj4gICAgdmhvc3Q6IGZpeCB2aG9zdCBtYXAgbGVhawo+PiAgICB2aG9zdDogcmVzZXQgaW52
YWxpZGF0ZV9jb3VudCBpbiB2aG9zdF9zZXRfdnJpbmdfbnVtX2FkZHIoKQo+PiAgICB2aG9zdDog
bWFyayBkaXJ0eSBwYWdlcyBkdXJpbmcgbWFwIHVuaW5pdAo+PiAgICB2aG9zdDogZG9uJ3QgZG8g
c3luY2hyb25pemVfcmN1KCkgaW4gdmhvc3RfdW5pbml0X3ZxX21hcHMoKQo+PiAgICB2aG9zdDog
ZG8gbm90IHVzZSBSQ1UgdG8gc3luY2hyb25pemUgTU1VIG5vdGlmaWVyIHdpdGggd29ya2VyCj4+
ICAgIHZob3N0OiBjb3JyZWN0bHkgc2V0IGRpcnR5IHBhZ2VzIGluIE1NVSBub3RpZmllcnMgY2Fs
bGJhY2sKPj4gICAgdmhvc3Q6IGRvIG5vdCByZXR1cm4gLUVBR0FJTiBmb3Igbm9uIGJsb2NraW5n
IGludmFsaWRhdGlvbiB0b28gZWFybHkKPj4KPj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAy
MDIgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgZHJpdmVy
cy92aG9zdC92aG9zdC5oIHwgICA2ICstCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0
aW9ucygrKSwgODYgZGVsZXRpb25zKC0pCj4gVGhpcyBnZW5lcmFsbHkgbG9va3MgbW9yZSBzb2xp
ZC4KPgo+IEJ1dCB0aGlzIGFtb3VudHMgdG8gYSBzaWduaWZpY2FudCBvdmVyaGF1bCBvZiB0aGUg
Y29kZS4KPgo+IEF0IHRoaXMgcG9pbnQgaG93IGFib3V0IHdlIHJldmVydCA3ZjQ2NjAzMmRjOWU1
YTYxMjE3ZjIyZWEzNGIyZGY5MzI3ODZiYmZjCj4gZm9yIHRoaXMgcmVsZWFzZSwgYW5kIHRoZW4g
cmUtYXBwbHkgYSBjb3JyZWN0ZWQgdmVyc2lvbgo+IGZvciB0aGUgbmV4dCBvbmU/CgoKSWYgcG9z
c2libGUsIGNvbnNpZGVyIHdlJ3ZlIGFjdHVhbGx5IGRpc2FibGVkIHRoZSBmZWF0dXJlLiBIb3cg
YWJvdXQgCmp1c3QgcXVldWVkIHRob3NlIHBhdGNoZXMgZm9yIG5leHQgcmVsZWFzZT8KClRoYW5r
cwoKCj4KPj4gLS0gCj4+IDIuMTguMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
