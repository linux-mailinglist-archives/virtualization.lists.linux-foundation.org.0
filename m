Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC91E9FC
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 10:22:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 59350CB6;
	Wed, 15 May 2019 08:22:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AD9C0C74
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 08:22:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1335B2C3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 08:22:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 198so1635747wme.3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 01:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=PPQSJiwlVW1PE92NeJWVh3dDEhwcNImDy2Q5NEYn4yo=;
	b=i5ViYn6xQiPCEgCk1y0IsFOugx+2JpTwToZeJT61Vt/lCY1lzDQBbjqzM3dUca7cGF
	W5QkEvqGQq6hMgrDxkcFON1bAJx8kv0BaUdGSnAAQxaZTygmR97l97uD2DlpYdzbo0Ql
	SgCDwD5PMajXVa+tEmAs8pN5PzHV6L72suFkyfY12ZJ1MqhrXzfrhF5FmVafgm2n44qJ
	6aCZapdmmSJbSDSaclKTTmGB5frSzT2JRO3nZwqqvLEbEaIxm3Gp0lYvE94SwQrkWkRX
	C0mI1LxpMWD/VBZ2ez0Ah+UM7ODNDl5V9XIF3zs51TLTZ8cI1pnxKUAo0NBZA0oHyZwx
	3AZQ==
X-Gm-Message-State: APjAAAV362e/ExvdGlclFpkIdDe/o1qUZ3UmXwXEfe8khZXctDHg8GOl
	916CKeVrgZr8psR/BETHnFK2fw==
X-Google-Smtp-Source: APXvYqwpXrWkAROlq0ytsK33r1VNVYl9awseeDiyNlDpFhZC69GGaWDX1zimAMr2LLpZz2MeWmJqQg==
X-Received: by 2002:a1c:2104:: with SMTP id h4mr21953640wmh.146.1557908557541; 
	Wed, 15 May 2019 01:22:37 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	y184sm1579251wmg.7.2019.05.15.01.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 May 2019 01:22:36 -0700 (PDT)
Date: Wed, 15 May 2019 10:22:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 7/8] vsock/virtio: increase RX buffer size to 64 KiB
Message-ID: <20190515082233.iqaibtfdoblijb5z@steredhat>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-8-sgarzare@redhat.com>
	<bf0416f1-0e69-722d-75ce-3d101e6d7d71@redhat.com>
	<20190513175138.4yycad2xi65komw6@steredhat>
	<fd934a4c-f7d2-8a04-ed93-a3b690ed0d79@redhat.com>
	<20190514162056.5aotcuzsi6e6wya7@steredhat>
	<646275c5-3530-f428-98da-56da99d72fe1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <646275c5-3530-f428-98da-56da99d72fe1@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTA6NTA6NDNBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzUvMTUg5LiK5Y2IMTI6MjAsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90
ZToKPiA+IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDExOjM4OjA1QU0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4gPiA+IE9uIDIwMTkvNS8xNCDkuIrljYgxOjUxLCBTdGVmYW5vIEdhcnphcmVs
bGEgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDY6MDE6NTJQTSArMDgw
MCwgSmFzb24gV2FuZyB3cm90ZToKPiA+ID4gPiA+IE9uIDIwMTkvNS8xMCDkuIvljYg4OjU4LCBT
dGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gPiA+ID4gPiA+IEluIG9yZGVyIHRvIGluY3JlYXNl
IGhvc3QgLT4gZ3Vlc3QgdGhyb3VnaHB1dCB3aXRoIGxhcmdlIHBhY2tldHMsCj4gPiA+ID4gPiA+
IHdlIGNhbiB1c2UgNjQgS2lCIFJYIGJ1ZmZlcnMuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5jb20+Cj4g
PiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiAgICAgaW5jbHVkZS9saW51eC92aXJ0aW9fdnNvY2su
aCB8IDIgKy0KPiA+ID4gPiA+ID4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvdmlydGlvX3Zzb2NrLmggYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oCj4g
PiA+ID4gPiA+IGluZGV4IDg0YjcyMDI2ZDMyNy4uNWE5ZDI1YmU3MmRmIDEwMDY0NAo+ID4gPiA+
ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5oCj4gPiA+ID4gPiA+ICsrKyBi
L2luY2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmgKPiA+ID4gPiA+ID4gQEAgLTEwLDcgKzEwLDcg
QEAKPiA+ID4gPiA+ID4gICAgICNkZWZpbmUgVklSVElPX1ZTT0NLX0RFRkFVTFRfTUlOX0JVRl9T
SVpFCTEyOAo+ID4gPiA+ID4gPiAgICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfREVGQVVMVF9CVUZf
U0laRQkJKDEwMjQgKiAyNTYpCj4gPiA+ID4gPiA+ICAgICAjZGVmaW5lIFZJUlRJT19WU09DS19E
RUZBVUxUX01BWF9CVUZfU0laRQkoMTAyNCAqIDI1NikKPiA+ID4gPiA+ID4gLSNkZWZpbmUgVklS
VElPX1ZTT0NLX0RFRkFVTFRfUlhfQlVGX1NJWkUJKDEwMjQgKiA0KQo+ID4gPiA+ID4gPiArI2Rl
ZmluZSBWSVJUSU9fVlNPQ0tfREVGQVVMVF9SWF9CVUZfU0laRQkoMTAyNCAqIDY0KQo+ID4gPiA+
ID4gPiAgICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfTUFYX0JVRl9TSVpFCQkweEZGRkZGRkZGVUwK
PiA+ID4gPiA+ID4gICAgICNkZWZpbmUgVklSVElPX1ZTT0NLX01BWF9QS1RfQlVGX1NJWkUJCSgx
MDI0ICogNjQpCj4gPiA+ID4gPiBXZSBwcm9iYWJseSBkb24ndCB3YW50IHN1Y2ggaGlnaCBvcmRl
ciBhbGxvY2F0aW9uLiBJdCdzIGJldHRlciB0byBzd2l0Y2ggdG8KPiA+ID4gPiA+IHVzZSBvcmRl
ciAwIHBhZ2VzIGluIHRoaXMgY2FzZS4gU2VlIGFkZF9yZWN2YnVmX2JpZygpIGZvciB2aXJ0aW8t
bmV0LiBJZiB3ZQo+ID4gPiA+ID4gZ2V0IGRhdGFwYXRoIHVuaWZpZWQsIHdlIHdpbGwgZ2V0IG1v
cmUgc3R1ZmZzIHNldC4KPiA+ID4gPiBJSVVDLCB5b3UgYXJlIHN1Z2dlc3RpbmcgdG8gYWxsb2Nh
dGUgb25seSBwYWdlcyBhbmQgcHV0IHRoZW0gaW4gYQo+ID4gPiA+IHNjYXR0ZXJsaXN0LCB0aGVu
IGFkZCB0aGVtIHRvIHRoZSB2aXJ0cXVldWUuCj4gPiA+ID4gCj4gPiA+ID4gSXMgaXQgY29ycmVj
dD8KPiA+ID4gCj4gPiA+IFllcyBzaW5jZSB5b3UgYXJlIHVzaW5nOgo+ID4gPiAKPiA+ID4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwa3QtPmJ1ZiA9IGttYWxsb2MoYnVmX2xlbiwg
R0ZQX0tFUk5FTCk7Cj4gPiA+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFw
a3QtPmJ1Zikgewo+ID4gPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2aXJ0aW9fdHJhbnNwb3J0X2ZyZWVfcGt0KHBrdCk7Cj4gPiA+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+ID4gCj4gPiA+IFRoaXMgaXMgbGlrZWx5IHRv
IGZhaWwgd2hlbiB0aGUgbWVtb3J5IGlzIGZyYWdtZW50ZWQgd2hpY2ggaXMga2luZCBvZgo+ID4g
PiBmcmFnaWxlLgo+ID4gPiAKPiA+ID4gCj4gPiBUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0
Lgo+ID4gCj4gPiA+ID4gVGhlIGlzc3VlIHRoYXQgSSBoYXZlIGhlcmUsIGlzIHRoYXQgdGhlIHZp
cnRpby12c29jayBndWVzdCBkcml2ZXIsIHNlZQo+ID4gPiA+IHZpcnRpb192c29ja19yeF9maWxs
KCksIGFsbG9jYXRlcyBhIHN0cnVjdCB2aXJ0aW9fdnNvY2tfcGt0IHRoYXQKPiA+ID4gPiBjb250
YWlucyB0aGUgcm9vbSBmb3IgdGhlIGhlYWRlciwgdGhlbiBhbGxvY2F0ZXMgdGhlIGJ1ZmZlciBm
b3IgdGhlIHBheWxvYWQuCj4gPiA+ID4gQXQgdGhpcyBwb2ludCBpdCBmaWxscyB0aGUgc2NhdHRl
cmxpc3Qgd2l0aCB0aGUgJnZpcnRpb192c29ja19wa3QuaGRyIGFuZCB0aGUKPiA+ID4gPiBidWZm
ZXIgZm9yIHRoZSBwYXlsb2FkLgo+ID4gPiAKPiA+ID4gVGhpcyBwYXJ0IHNob3VsZCBiZSBmaW5l
IHNpbmNlIHdoYXQgaXMgbmVlZGVkIGlzIGp1c3QgYWRkaW5nIG1vcmUgcGFnZXMgdG8KPiA+ID4g
c2dbXSBhbmQgY2FsbCB2aXJ0dXFldWV1X2FkZF9zZygpLgo+ID4gPiAKPiA+ID4gCj4gPiBZZXMs
IEkgYWdyZWUuCj4gPiAKPiA+ID4gPiBDaGFuZ2luZyB0aGlzIHdpbGwgcmVxdWlyZSBzZXZlcmFs
IG1vZGlmaWNhdGlvbnMsIGFuZCBpZiB3ZSBnZXQgZGF0YXBhdGgKPiA+ID4gPiB1bmlmaWVkLCBJ
J20gbm90IHN1cmUgaXQncyB3b3J0aCBpdC4KPiA+ID4gPiBPZiBjb3Vyc2UsIGlmIHdlIGxlYXZl
IHRoZSBkYXRhcGF0aHMgc2VwYXJhdGVkLCBJJ2QgbGlrZSB0byBkbyB0aGF0IGxhdGVyLgo+ID4g
PiA+IAo+ID4gPiA+IFdoYXQgZG8geW91IHRoaW5rPwo+ID4gPiAKPiA+ID4gRm9yIHRoZSBkcml2
ZXIgaXQgc2VsZiwgaXQgc2hvdWxkIG5vdCBiZSBoYXJkLiBCdXQgSSB0aGluayB5b3UgbWVhbiB0
aGUKPiA+ID4gaXNzdWUgb2YgZS5nIHZpcnRpb192c29ja19wa3QgaXRzZWxmIHdoaWNoIGRvZXNu
J3Qgc3VwcG9ydCBzZy4gRm9yIHNob3J0Cj4gPiA+IHRpbWUsIG1heWJlIHdlIGNhbiB1c2Uga3Zl
YyBpbnN0ZWFkLgo+ID4gSSdsbCB0cnkgdG8gdXNlIGt2ZWMgaW4gdGhlIHZpcnRpb192c29ja19w
a3QuCj4gPiAKPiA+IFNpbmNlIHRoaXMgc3RydWN0IGlzIHNoYXJlZCBhbHNvIHdpdGggdGhlIGhv
c3QgZHJpdmVyICh2aG9zdC12c29jayksCj4gPiBJIGhvcGUgdGhlIGNoYW5nZXMgY291bGQgYmUg
bGltaXRlZCwgb3RoZXJ3aXNlIHdlIGNhbiByZW1vdmUgdGhlIGxhc3QgMgo+ID4gcGF0Y2hlcyBv
ZiB0aGUgc2VyaWVzIGZvciBub3csIGxlYXZpbmcgdGhlIFJYIGJ1ZmZlciBzaXplIHRvIDRLQi4K
PiAKPiAKPiBZZXMgYW5kIGlmIGl0IGludHJvZHVjZXMgdG9vIG11Y2ggY2hhbmdlcywgbWF5YmUg
d2UgY2FuIGRvIHRoZSA2NEtCIGJ1ZmZlcgo+IGluIHRoZSBmdXR1cmUgd2l0aCB0aGUgY29udmVy
c2lvbiBvZiB1c2luZyBza2Igd2hlcmUgc3VwcG9ydHMgcGFnZSBmcmFnCj4gbmF0aXZlbHkuCgpZ
ZXMsIEkgY29tcGxldGVseSBhZ3JlZSEKClRoYW5rcywKU3RlZmFubwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
