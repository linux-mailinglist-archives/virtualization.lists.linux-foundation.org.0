Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E50BF1AD73
	for <lists.virtualization@lfdr.de>; Sun, 12 May 2019 19:10:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B43EAE20;
	Sun, 12 May 2019 17:10:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E85B9DA8
	for <virtualization@lists.linux-foundation.org>;
	Sun, 12 May 2019 17:10:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B1552E6
	for <virtualization@lists.linux-foundation.org>;
	Sun, 12 May 2019 17:10:35 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z128so6664038qkb.6
	for <virtualization@lists.linux-foundation.org>;
	Sun, 12 May 2019 10:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=dGkusROmRVTxifYPLi0Ky7Gg3CaeREE3G18dOX0eiu0=;
	b=mR0qq567wCKJC8LkhRLlHTP05zQ3VcDH846Xa2yQyweix5gic8rf6ia3+zPEDxCZCU
	8jXg1ehxXJoKs0fm6YahZe2KV8OKEeUTaxFfbuLVphB9YxhOUTFd4DS9asIMoaGA7cVE
	IHhKwoIkdadZxrIXc2KW9p4yYGQcwHtiQF04P9qK3BHr6igX73kwyk9+n33qsJgEb6ap
	CP9Urv/VWA9juQ07Fx69XqFd/eFXag97LB/m8wnRv17iciormL+eO1r5wjIeWuOipYEe
	j6ccdt8/pRr/d49AuCz495xTed3ldUskYdyIucPRMqdf3vNhniXhE+sfMUsQRpaKfNOm
	HV2w==
X-Gm-Message-State: APjAAAWmEyd/5QfBqxa1cuuqtJ8kCSjwKGZA9UevoodCe9VA11HweIP+
	cDVFs8eXlpmqsHQGrWP8MVPgGg==
X-Google-Smtp-Source: APXvYqx+dnJlu9/WHsWE/MV7DH2MGKju7AgCjrcx17FOCrkBNLPSiNeThomPAvDUqz1LbPxO6QZG2Q==
X-Received: by 2002:a37:59c7:: with SMTP id n190mr18462302qkb.24.1557681034785;
	Sun, 12 May 2019 10:10:34 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71])
	by smtp.gmail.com with ESMTPSA id p8sm5181296qta.24.2019.05.12.10.10.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 12 May 2019 10:10:33 -0700 (PDT)
Date: Sun, 12 May 2019 13:10:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net] vhost_net: fix possible infinite loop
Message-ID: <20190512125959-mutt-send-email-mst@kernel.org>
References: <1556177599-56248-1-git-send-email-jasowang@redhat.com>
	<20190425131021-mutt-send-email-mst@kernel.org>
	<f4b4ff70-d64f-c3fb-fe2e-97ef6c55bda0@redhat.com>
	<999ef863-2994-e0c0-fbb1-a6e92de3fd24@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <999ef863-2994-e0c0-fbb1-a6e92de3fd24@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, ppandit@redhat.com, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

T24gU3VuLCBNYXkgMDUsIDIwMTkgYXQgMTI6MjA6MjRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzQvMjYg5LiL5Y2IMzozNSwgSmFzb24gV2FuZyB3cm90ZToKPiA+IAo+
ID4gT24gMjAxOS80LzI2IOS4iuWNiDE6NTIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+
ID4gT24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMDM6MzM6MTlBTSAtMDQwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+ID4gPiBXaGVuIHRoZSByeCBidWZmZXIgaXMgdG9vIHNtYWxsIGZvciBhIHBhY2tl
dCwgd2Ugd2lsbCBkaXNjYXJkIHRoZSB2cQo+ID4gPiA+IGRlc2NyaXB0b3IgYW5kIHJldHJ5IGl0
IGZvciB0aGUgbmV4dCBwYWNrZXQ6Cj4gPiA+ID4gCj4gPiA+ID4gd2hpbGUgKChzb2NrX2xlbiA9
IHZob3N0X25ldF9yeF9wZWVrX2hlYWRfbGVuKG5ldCwgc29jay0+c2ssCj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmJ1c3lsb29wX2lu
dHIpKSkgewo+ID4gPiA+IC4uLgo+ID4gPiA+IMKgwqDCoMKgLyogT24gb3ZlcnJ1biwgdHJ1bmNh
dGUgYW5kIGRpc2NhcmQgKi8KPiA+ID4gPiDCoMKgwqDCoGlmICh1bmxpa2VseShoZWFkY291bnQg
PiBVSU9fTUFYSU9WKSkgewo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIGlvdl9pdGVyX2luaXQoJm1z
Zy5tc2dfaXRlciwgUkVBRCwgdnEtPmlvdiwgMSwgMSk7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAg
ZXJyID0gc29jay0+b3BzLT5yZWN2bXNnKHNvY2ssICZtc2csCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxLCBNU0dfRE9OVFdBSVQgfCBNU0dfVFJVTkMp
Owo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHByX2RlYnVnKCJEaXNjYXJkZWQgcnggcGFja2V0OiBs
ZW4gJXpkXG4iLCBzb2NrX2xlbik7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4g
PiA+ID4gwqDCoMKgwqB9Cj4gPiA+ID4gLi4uCj4gPiA+ID4gfQo+ID4gPiA+IAo+ID4gPiA+IFRo
aXMgbWFrZXMgaXQgcG9zc2libGUgdG8gdHJpZ2dlciBhIGluZmluaXRlIHdoaWxlLi5jb250aW51
ZSBsb29wCj4gPiA+ID4gdGhyb3VnaCB0aGUgY28tb3ByZWF0aW9uIG9mIHR3byBWTXMgbGlrZToK
PiA+ID4gPiAKPiA+ID4gPiAxKSBNYWxpY2lvdXMgVk0xIGFsbG9jYXRlIDEgYnl0ZSByeCBidWZm
ZXIgYW5kIHRyeSB0byBzbG93IGRvd24gdGhlCj4gPiA+ID4gwqDCoMKgIHZob3N0IHByb2Nlc3Mg
YXMgbXVjaCBhcyBwb3NzaWJsZSBlLmcgdXNpbmcgaW5kaXJlY3QgZGVzY3JpcHRvcnMgb3IKPiA+
ID4gPiDCoMKgwqAgb3RoZXIuCj4gPiA+ID4gMikgTWFsaWNpb3VzIFZNMiBnZW5lcmF0ZSBwYWNr
ZXRzIHRvIFZNMSBhcyBmYXN0IGFzIHBvc3NpYmxlCj4gPiA+ID4gCj4gPiA+ID4gRml4aW5nIHRo
aXMgYnkgY2hlY2tpbmcgYWdhaW5zdCB3ZWlnaHQgYXQgdGhlIGVuZCBvZiBSWCBhbmQgVFgKPiA+
ID4gPiBsb29wLiBUaGlzIGFsc28gZWxpbWluYXRlIG90aGVyIHNpbWlsYXIgY2FzZXMgd2hlbjoK
PiA+ID4gPiAKPiA+ID4gPiAtIHVzZXJzcGFjZSBpcyBjb25zdW1pbmcgdGhlIHBhY2tldHMgaW4g
dGhlIG1lYW53aGlsZQo+ID4gPiA+IC0gdGhlb3JldGljYWwgVE9DVE9VIGF0dGFjayBpZiBndWVz
dCBtb3ZpbmcgYXZhaWwgaW5kZXggYmFjayBhbmQgZm9ydGgKPiA+ID4gPiDCoMKgIHRvIGhpdCB0
aGUgY29udGludWUgYWZ0ZXIgdmhvc3QgZmluZCBndWVzdCBqdXN0IGFkZCBuZXcgYnVmZmVycwo+
ID4gPiA+IAo+ID4gPiA+IFRoaXMgYWRkcmVzc2VzIENWRS0yMDE5LTM5MDAuCj4gPiA+ID4gCj4g
PiA+ID4gRml4ZXM6IGQ4MzE2ZjM5OTFkMjAgKCJ2aG9zdDogZml4IHRvdGFsIGxlbmd0aCB3aGVu
IHBhY2tldHMgYXJlCj4gPiA+ID4gdG9vIHNob3J0IikKPiA+ID4gSSBhZ3JlZSB0aGlzIGlzIHRo
ZSByZWFsIGlzc3VlLgo+ID4gPiAKPiA+ID4gPiBGaXhlczogM2E0ZDVjOTRlOTU5MyAoInZob3N0
X25ldDogYSBrZXJuZWwtbGV2ZWwgdmlydGlvIHNlcnZlciIpCj4gPiA+IFRoaXMgaXMganVzdCBh
IHJlZCBoZXJyaW5nIGltaG8uIFdlIGNhbiBzdGljayB0aGlzIG9uIGFueSB2aG9zdCBwYXRjaCA6
KQo+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+IMKgIGRyaXZlcnMvdmhvc3QvbmV0LmMgfCA0MSAr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9uZXQuYyBiL2RyaXZlcnMvdmhvc3QvbmV0
LmMKPiA+ID4gPiBpbmRleCBkZjUxYTM1Li5mYjQ2ZTZiIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvdmhvc3QvbmV0LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3Zob3N0L25ldC5jCj4gPiA+
ID4gQEAgLTc3OCw4ICs3NzgsOSBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfdHhfY29weShzdHJ1Y3Qg
dmhvc3RfbmV0Cj4gPiA+ID4gKm5ldCwgc3RydWN0IHNvY2tldCAqc29jaykKPiA+ID4gPiDCoMKg
wqDCoMKgIGludCBlcnI7Cj4gPiA+ID4gwqDCoMKgwqDCoCBpbnQgc2VudF9wa3RzID0gMDsKPiA+
ID4gPiDCoMKgwqDCoMKgIGJvb2wgc29ja19jYW5fYmF0Y2ggPSAoc29jay0+c2stPnNrX3NuZGJ1
ZiA9PSBJTlRfTUFYKTsKPiA+ID4gPiArwqDCoMKgIGJvb2wgbmV4dF9yb3VuZCA9IGZhbHNlOwo+
ID4gPiA+IMKgIC3CoMKgwqAgZm9yICg7Oykgewo+ID4gPiA+ICvCoMKgwqAgZG8gewo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIGJ1c3lsb29wX2ludHIgPSBmYWxzZTsKPiA+ID4gPiDC
oCDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG52cS0+ZG9uZV9pZHggPT0gVkhPU1RfTkVUX0JBVENI
KQo+ID4gPiA+IEBAIC04NDUsMTEgKzg0NiwxMCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfdHhfY29w
eShzdHJ1Y3QKPiA+ID4gPiB2aG9zdF9uZXQgKm5ldCwgc3RydWN0IHNvY2tldCAqc29jaykKPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgdnEtPmhlYWRzW252cS0+ZG9uZV9pZHhdLmlkID0gY3B1
X3RvX3Zob3N0MzIodnEsIGhlYWQpOwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCB2cS0+aGVh
ZHNbbnZxLT5kb25lX2lkeF0ubGVuID0gMDsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgKytu
dnEtPmRvbmVfaWR4Owo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoCBpZiAodmhvc3RfZXhjZWVkc193
ZWlnaHQoKytzZW50X3BrdHMsIHRvdGFsX2xlbikpIHsKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2aG9zdF9wb2xsX3F1ZXVlKCZ2cS0+cG9sbCk7Cj4gPiA+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgIH0KPiA+ID4gPiAtwqDC
oMKgIH0KPiA+ID4gPiArwqDCoMKgIH0gd2hpbGUgKCEobmV4dF9yb3VuZCA9IHZob3N0X2V4Y2Vl
ZHNfd2VpZ2h0KCsrc2VudF9wa3RzLAo+ID4gPiA+IHRvdGFsX2xlbikpKTsKPiA+ID4gPiArCj4g
PiA+ID4gK8KgwqDCoCBpZiAobmV4dF9yb3VuZCkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgdmhv
c3RfcG9sbF9xdWV1ZSgmdnEtPnBvbGwpOwo+ID4gPiA+IMKgIMKgwqDCoMKgwqAgdmhvc3RfdHhf
YmF0Y2gobmV0LCBudnEsIHNvY2ssICZtc2cpOwo+ID4gPiA+IMKgIH0KPiA+ID4gPiBAQCAtODcz
LDggKzg3Myw5IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV90eF96ZXJvY29weShzdHJ1Y3QKPiA+ID4g
PiB2aG9zdF9uZXQgKm5ldCwgc3RydWN0IHNvY2tldCAqc29jaykKPiA+ID4gPiDCoMKgwqDCoMKg
IHN0cnVjdCB2aG9zdF9uZXRfdWJ1Zl9yZWYgKnVuaW5pdGlhbGl6ZWRfdmFyKHVidWZzKTsKPiA+
ID4gPiDCoMKgwqDCoMKgIGJvb2wgemNvcHlfdXNlZDsKPiA+ID4gPiDCoMKgwqDCoMKgIGludCBz
ZW50X3BrdHMgPSAwOwo+ID4gPiA+ICvCoMKgwqAgYm9vbCBuZXh0X3JvdW5kID0gZmFsc2U7Cj4g
PiA+ID4gwqAgLcKgwqDCoCBmb3IgKDs7KSB7Cj4gPiA+ID4gK8KgwqDCoCBkbyB7Cj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgYnVzeWxvb3BfaW50cjsKPiA+ID4gPiDCoCDCoMKgwqDC
oMKgwqDCoMKgwqAgLyogUmVsZWFzZSBETUFzIGRvbmUgYnVmZmVycyBmaXJzdCAqLwo+ID4gPiA+
IEBAIC05NTEsMTEgKzk1MiwxMCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfdHhfemVyb2NvcHkoc3Ry
dWN0Cj4gPiA+ID4gdmhvc3RfbmV0ICpuZXQsIHN0cnVjdCBzb2NrZXQgKnNvY2spCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2aG9zdF96ZXJvY29weV9zaWduYWxfdXNlZChuZXQsIHZxKTsKPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqAgdmhvc3RfbmV0X3R4X3BhY2tldChuZXQpOwo+ID4gPiA+IC3CoMKgwqDCoMKgwqDC
oCBpZiAodW5saWtlbHkodmhvc3RfZXhjZWVkc193ZWlnaHQoKytzZW50X3BrdHMsIHRvdGFsX2xl
bikpKSB7Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmhvc3RfcG9sbF9xdWV1ZSgm
dnEtPnBvbGwpOwo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoCB9Cj4gPiA+ID4gLcKgwqDCoCB9Cj4gPiA+ID4gK8KgwqDCoCB9IHdo
aWxlICghKG5leHRfcm91bmQgPSB2aG9zdF9leGNlZWRzX3dlaWdodCgrK3NlbnRfcGt0cywKPiA+
ID4gPiB0b3RhbF9sZW4pKSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqAgaWYgKG5leHRfcm91
bmQpCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIHZob3N0X3BvbGxfcXVldWUoJnZxLT5wb2xsKTsK
PiA+ID4gPiDCoCB9Cj4gPiA+ID4gwqAgwqAgLyogRXhwZWN0cyB0byBiZSBhbHdheXMgcnVuIGZy
b20gd29ya3F1ZXVlIC0gd2hpY2ggYWN0cyBhcwo+ID4gPiA+IEBAIC0xMTM0LDYgKzExMzQsNyBA
QCBzdGF0aWMgdm9pZCBoYW5kbGVfcngoc3RydWN0IHZob3N0X25ldCAqbmV0KQo+ID4gPiA+IMKg
wqDCoMKgwqAgc3RydWN0IGlvdl9pdGVyIGZpeHVwOwo+ID4gPiA+IMKgwqDCoMKgwqAgX192aXJ0
aW8xNiBudW1fYnVmZmVyczsKPiA+ID4gPiDCoMKgwqDCoMKgIGludCByZWN2X3BrdHMgPSAwOwo+
ID4gPiA+ICvCoMKgwqAgYm9vbCBuZXh0X3JvdW5kID0gZmFsc2U7Cj4gPiA+ID4gwqAgwqDCoMKg
wqDCoCBtdXRleF9sb2NrX25lc3RlZCgmdnEtPm11dGV4LCBWSE9TVF9ORVRfVlFfUlgpOwo+ID4g
PiA+IMKgwqDCoMKgwqAgc29jayA9IHZxLT5wcml2YXRlX2RhdGE7Cj4gPiA+ID4gQEAgLTExNTMs
OCArMTE1NCwxMSBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfcngoc3RydWN0IHZob3N0X25ldCAqbmV0
KQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCB2cS0+bG9nIDogTlVMTDsKPiA+ID4gPiDCoMKg
wqDCoMKgIG1lcmdlYWJsZSA9IHZob3N0X2hhc19mZWF0dXJlKHZxLCBWSVJUSU9fTkVUX0ZfTVJH
X1JYQlVGKTsKPiA+ID4gPiDCoCAtwqDCoMKgIHdoaWxlICgoc29ja19sZW4gPSB2aG9zdF9uZXRf
cnhfcGVla19oZWFkX2xlbihuZXQsIHNvY2stPnNrLAo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZidXN5bG9vcF9pbnRy
KSkpIHsKPiA+ID4gPiArwqDCoMKgIGRvIHsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgc29ja19s
ZW4gPSB2aG9zdF9uZXRfcnhfcGVla19oZWFkX2xlbihuZXQsIHNvY2stPnNrLAo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICZidXN5bG9vcF9pbnRyKTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgaWYgKCFzb2NrX2xlbikK
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqAgc29ja19sZW4gKz0gc29ja19obGVuOwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oCB2aG9zdF9sZW4gPSBzb2NrX2xlbiArIHZob3N0X2hsZW47Cj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgIGhlYWRjb3VudCA9IGdldF9yeF9idWZzKHZxLCB2cS0+aGVhZHMgKyBudnEtPmRvbmVf
aWR4LAo+ID4gPiA+IEBAIC0xMjM5LDEyICsxMjQzLDkgQEAgc3RhdGljIHZvaWQgaGFuZGxlX3J4
KHN0cnVjdCB2aG9zdF9uZXQgKm5ldCkKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2aG9zdF9sb2dfd3JpdGUodnEsIHZxX2xvZywgbG9nLCB2aG9zdF9sZW4sCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZxLT5pb3YsIGluKTsKPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgdG90YWxfbGVuICs9IHZob3N0X2xlbjsKPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KHZob3N0X2V4Y2VlZHNfd2VpZ2h0KCsrcmVjdl9w
a3RzLCB0b3RhbF9sZW4pKSkgewo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZob3N0
X3BvbGxfcXVldWUoJnZxLT5wb2xsKTsKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIG91dDsKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqAgfQo+ID4gPiA+IC3CoMKgwqAgfQo+ID4g
PiA+IC3CoMKgwqAgaWYgKHVubGlrZWx5KGJ1c3lsb29wX2ludHIpKQo+ID4gPiA+ICvCoMKgwqAg
fSB3aGlsZSAoIShuZXh0X3JvdW5kID0gdmhvc3RfZXhjZWVkc193ZWlnaHQoKytyZWN2X3BrdHMs
Cj4gPiA+ID4gdG90YWxfbGVuKSkpOwo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgIGlmICh1bmxp
a2VseShidXN5bG9vcF9pbnRyIHx8IG5leHRfcm91bmQpKQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoCB2aG9zdF9wb2xsX3F1ZXVlKCZ2cS0+cG9sbCk7Cj4gPiA+ID4gwqDCoMKgwqDCoCBlbHNl
Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIHZob3N0X25ldF9lbmFibGVfdnEobmV0LCB2cSk7
Cj4gPiA+IAo+ID4gPiBJJ20gYWZyYWlkIHdpdGggdGhpcyBhZGRpdGlvbiB0aGUgY29kZSBpcyB0
b28gbXVjaCBsaWtlIHNwYWdldHR5LiBXaGF0Cj4gPiA+IGRvZXMgbmV4dF9yb3VuZCBtZWFuP8Kg
IEp1c3QgdGhhdCB3ZSBhcmUgYnJlYWtpbmcgb3V0IG9mIGxvb3A/Cj4gPiAKPiA+IAo+ID4gWWVz
LCB3ZSBjYW4gaGF2ZSBhIGJldHRlciBuYW1lIG9mIGNvdXJzZS4KPiA+IAo+ID4gCj4gPiA+IFRo
YXQgaXMKPiA+ID4gd2hhdCBnb3RvIGlzIGZvci4uLsKgIEVpdGhlciBsZXQncyBoYXZlIGZvcig7
Oykgd2l0aCBnb3RvL2JyZWFrIHRvIGdldAo+ID4gPiBvdXRzaWRlIG9yIGEgd2hpbGUgbG9vcCB3
aXRoIGEgY29uZGl0aW9uLsKgIEJvdGggaXMganVzdCB1bnJlYWRhYmxlLgo+ID4gPiAKPiA+ID4g
QWxsIHRoZXNlIGNoZWNrcyBpbiAzIHBsYWNlcyBhcmUgZXhhY3RseSB0aGUgc2FtZSBvbiBhbGwg
cGF0aHMgYW5kIHRoZXkKPiA+ID4gYXJlIHNsb3cgcGF0aC4gV2h5IGRvbid0IHdlIHB1dCB0aGlz
IGluIGEgZnVuY3Rpb24/Cj4gPiAKPiA+IAo+ID4gVGhlIHBvaW50IEkgdGhpbmsgaXMsIHdlIHdh
bnQgdGhlIHdlaWdodCB0byBiZSBjaGVja2VkIGluIGJvdGggZmFzdCBwYXRoCj4gPiBhbmQgc2xv
dyBwYXRoLgo+ID4gCj4gPiAKPiA+ID4gRS5nLiBsaWtlIHRoZSBiZWxvdy4KPiA+ID4gV2Fybmlu
ZzogY29tcGxldGVseSB1bnRlc3RlZC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiA+IAo+ID4gPiAtLS0KPiA+ID4gCj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L25ldC5jIGIvZHJpdmVycy92aG9zdC9uZXQu
Ywo+ID4gPiBpbmRleCBkZjUxYTM1Y2Y1MzcuLmEwZjg5YTUwNGNkOSAxMDA2NDQKPiA+ID4gLS0t
IGEvZHJpdmVycy92aG9zdC9uZXQuYwo+ID4gPiArKysgYi9kcml2ZXJzL3Zob3N0L25ldC5jCj4g
PiA+IEBAIC03NjEsNiArNzYxLDIzIEBAIHN0YXRpYyBpbnQgdmhvc3RfbmV0X2J1aWxkX3hkcChz
dHJ1Y3QKPiA+ID4gdmhvc3RfbmV0X3ZpcnRxdWV1ZSAqbnZxLAo+ID4gPiDCoMKgwqDCoMKgIHJl
dHVybiAwOwo+ID4gPiDCoCB9Cj4gPiA+IMKgICsvKiBSZXR1cm5zIHRydWUgaWYgY2FsbGVyIG5l
ZWRzIHRvIGdvIGJhY2sgYW5kIHJlLXJlYWQgdGhlIHJpbmcuICovCj4gPiA+ICtzdGF0aWMgYm9v
bCBlbXB0eV9yaW5nKHN0cnVjdCB2aG9zdF9uZXQgKm5ldCwgc3RydWN0Cj4gPiA+IHZob3N0X3Zp
cnRxdWV1ZSAqdnEsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBwa3Rz
LCBzaXplX3QgdG90YWxfbGVuLCBib29sIGJ1c3lsb29wX2ludHIpCj4gPiA+ICt7Cj4gPiA+ICvC
oMKgwqAgaWYgKHVubGlrZWx5KGJ1c3lsb29wX2ludHIpKSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oCB2aG9zdF9wb2xsX3F1ZXVlKCZ2cS0+cG9sbCk7Cj4gPiA+ICvCoMKgwqAgfSBlbHNlIGlmICh1
bmxpa2VseSh2aG9zdF9lbmFibGVfbm90aWZ5KCZuZXQtPmRldiwgdnEpKSkgewo+ID4gPiArwqDC
oMKgwqDCoMKgwqAgLyogVGhleSBoYXZlIHNsaXBwZWQgb25lIGluIG1lYW53aGlsZTogY2hlY2sg
YWdhaW4uICovCj4gPiA+ICvCoMKgwqDCoMKgwqDCoCB2aG9zdF9kaXNhYmxlX25vdGlmeSgmbmV0
LT5kZXYsIHZxKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgIGlmICghdmhvc3RfZXhjZWVkc193ZWln
aHQocGt0cywgdG90YWxfbGVuKSkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHRydWU7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoCB2aG9zdF9wb2xsX3F1ZXVlKCZ2cS0+cG9sbCk7
Cj4gPiA+ICvCoMKgwqAgfQo+ID4gPiArwqDCoMKgIC8qIE5vdGhpbmcgbmV3P8KgIFdhaXQgZm9y
IGV2ZW50ZmQgdG8gdGVsbCB1cyB0aGV5IHJlZmlsbGVkLiAqLwo+ID4gPiArwqDCoMKgIHJldHVy
biBmYWxzZTsKPiA+ID4gK30KPiA+IAo+ID4gCj4gPiBSaW5nIGVtcHkgaXMgbm90IHRoZSBvbmx5
IHBsYWNlcyB0aGF0IG5lZWRzIGNhcmUuIEUuZyBmb3IgUlgsIHdlIG5lZWQKPiA+IGNhcmUgYWJv
dXQgb3ZlcnJ1biBhbmQgd2hlbiB1c2Vyc3BhY2UgaXMgY29uc3VtaW5nIHRoZSBwYWNrZXQgaW4g
dGhlCj4gPiBzYW1lIHRpbWUuIFNvIHRoZXJlJ3Mgbm8gbmVlZCB0byB0b2dnbGUgdnEgbm90aWZp
Y2F0aW9uIGluIHRob3NlIHR3by4KCldlbGwgSSBqdXN0IGZhY3RvcmVkIG91dCBjb2RlIHRoYXQg
bG9va2VkIGV4YWN0bHkgdGhlIHNhbWUuCllvdSBjYW4gYWRkIG1vcmUgY29tbW9uIGNvZGUgYW5k
IHJlbmFtZSB0aGUgZnVuY3Rpb24KaWYgaXQgdHVybnMgb3V0IHRvIGJlIHdvcnRoIHdoaWxlLgoK
Cj4gPiAKPiA+IAo+ID4gPiArCj4gPiA+IMKgIHN0YXRpYyB2b2lkIGhhbmRsZV90eF9jb3B5KHN0
cnVjdCB2aG9zdF9uZXQgKm5ldCwgc3RydWN0IHNvY2tldCAqc29jaykKPiA+ID4gwqAgewo+ID4g
PiDCoMKgwqDCoMKgIHN0cnVjdCB2aG9zdF9uZXRfdmlydHF1ZXVlICpudnEgPSAmbmV0LT52cXNb
VkhPU1RfTkVUX1ZRX1RYXTsKPiA+ID4gQEAgLTc5MCwxNSArODA3LDEwIEBAIHN0YXRpYyB2b2lk
IGhhbmRsZV90eF9jb3B5KHN0cnVjdCB2aG9zdF9uZXQKPiA+ID4gKm5ldCwgc3RydWN0IHNvY2tl
dCAqc29jaykKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIE9uIGVycm9yLCBzdG9wIGhhbmRs
aW5nIHVudGlsIHRoZSBuZXh0IGtpY2suICovCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dW5saWtlbHkoaGVhZCA8IDApKQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgIC8qIE5vdGhpbmcgbmV3P8KgIFdhaXQgZm9yIGV2ZW50
ZmQgdG8gdGVsbCB1cyB0aGV5IHJlZmlsbGVkLiAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKGhlYWQgPT0gdnEtPm51bSkgewo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dW5saWtlbHkoYnVzeWxvb3BfaW50cikpIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2aG9zdF9wb2xsX3F1ZXVlKCZ2cS0+cG9sbCk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0gZWxzZSBpZiAodW5saWtlbHkodmhvc3RfZW5hYmxlX25vdGlmeSgmbmV0LT5k
ZXYsCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB2cSkpKSB7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdmhvc3RfZGlzYWJsZV9ub3RpZnkoJm5ldC0+ZGV2LCB2cSk7Cj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShlbXB0eV9yaW5nKG5ldCwgdnEsICsrc2VudF9w
a3RzLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0b3RhbF9sZW4sIGJ1c3lsb29wX2ludHIpKSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgIH0KPiA+ID4gwqAgQEAgLTg4NiwxNCArODk4LDEwIEBAIHN0YXRpYyB2b2lkIGhhbmRs
ZV90eF96ZXJvY29weShzdHJ1Y3QKPiA+ID4gdmhvc3RfbmV0ICpuZXQsIHN0cnVjdCBzb2NrZXQg
KnNvY2spCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBPbiBlcnJvciwgc3RvcCBoYW5kbGlu
ZyB1bnRpbCB0aGUgbmV4dCBraWNrLiAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVu
bGlrZWx5KGhlYWQgPCAwKSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoCAvKiBOb3RoaW5nIG5ldz/CoCBXYWl0IGZvciBldmVudGZk
IHRvIHRlbGwgdXMgdGhleSByZWZpbGxlZC4gKi8KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGlm
IChoZWFkID09IHZxLT5udW0pIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVu
bGlrZWx5KGJ1c3lsb29wX2ludHIpKSB7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdmhvc3RfcG9sbF9xdWV1ZSgmdnEtPnBvbGwpOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9IGVsc2UgaWYgKHVubGlrZWx5KHZob3N0X2VuYWJsZV9ub3RpZnkoJm5ldC0+ZGV2
LCB2cSkpKSB7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmhvc3RfZGlz
YWJsZV9ub3RpZnkoJm5ldC0+ZGV2LCB2cSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICh1bmxpa2VseShlbXB0eV9yaW5nKG5ldCwgdnEsICsrc2VudF9wa3RzLAo+ID4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0b3RhbF9sZW4sIGJ1
c3lsb29wX2ludHIpKSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b250aW51ZTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+ID4g
wqAgQEAgLTExNjMsMTggKzExNzEsMTAgQEAgc3RhdGljIHZvaWQgaGFuZGxlX3J4KHN0cnVjdCB2
aG9zdF9uZXQgKm5ldCkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIE9uIGVycm9yLCBzdG9w
IGhhbmRsaW5nIHVudGlsIHRoZSBuZXh0IGtpY2suICovCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAodW5saWtlbHkoaGVhZGNvdW50IDwgMCkpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gb3V0Owo+ID4gPiAtwqDCoMKgwqDCoMKgwqAgLyogT0ssIG5vdyB3ZSBuZWVk
IHRvIGtub3cgYWJvdXQgYWRkZWQgZGVzY3JpcHRvcnMuICovCj4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoIWhlYWRjb3VudCkgewo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dW5saWtlbHkoYnVzeWxvb3BfaW50cikpIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB2aG9zdF9wb2xsX3F1ZXVlKCZ2cS0+cG9sbCk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0gZWxzZSBpZiAodW5saWtlbHkodmhvc3RfZW5hYmxlX25vdGlmeSgmbmV0LT5k
ZXYsIHZxKSkpIHsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBUaGV5
IGhhdmUgc2xpcHBlZCBvbmUgaW4gYXMgd2Ugd2VyZQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBkb2luZyB0aGF0OiBjaGVjayBhZ2Fpbi4gKi8KPiA+ID4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2aG9zdF9kaXNhYmxlX25vdGlmeSgmbmV0LT5kZXYs
IHZxKTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPiA+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAvKiBOb3RoaW5nIG5ldz/CoCBXYWl0IGZvciBldmVudGZkIHRvIHRlbGwgdXMKPiA+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZXkgcmVmaWxsZWQuICovCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShlbXB0eV9yaW5nKG5ldCwgdnEsICsrcmVjdl9w
a3RzLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB0b3RhbF9sZW4sIGJ1c3lsb29wX2ludHIpKSkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dDsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgIGJ1c3lsb29wX2ludHIgPSBmYWxzZTsKPiA+IAo+ID4gVGhlIHBhdGNoIG1pc3Nl
cyBzZXZlcmFsIG90aGVyIGNvbnRpbnVlIHRoYXQgbmVlZCBjYXJlcyBhbmQgdGhlcmUncwo+ID4g
YW5vdGhlciBjYWxsIG9mIHZob3N0X2V4Y2VlZHNfd2VpZ2h0KCkgYXQgdGhlIGVuZCBvZiB0aGUg
bG9vcC4KPiA+IAo+ID4gU28gaW5zdGVhZCBvZiBkdXBsaWNhdGluZyBjaGVjayBldmVyeXdoZXJl
IGxpa2U6Cj4gPiAKPiA+IGZvciAoOzspIHsKPiA+IMKgwqDCoCBpZiAoY29uZGl0aW9uX3gpIHsK
PiA+IMKgwqDCoCDCoMKgwqAgaWYgKGVtcHR5X3JpbmcoKSkKPiA+IMKgwqDCoCDCoMKgwqAgwqDC
oMKgIGNvbnRpbnVlOwo+ID4gwqDCoMKgIMKgwqDCoCBicmVhazsKPiA+IMKgwqDCoCB9Cj4gPiDC
oMKgwqAgaWYgKGNvbmRpdGlvbl95KSB7Cj4gPiDCoMKgwqAgwqDCoMKgIGlmIChlbXB0eV9yaW5n
KCkpOwo+ID4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgY29udGludWU7Cj4gPiDCoMKgwqAgwqDCoMKg
IGJyZWFrOwo+ID4gwqDCoMKgIH0KPiA+IMKgwqDCoCBpZiAoY29uZGl0aW9uX3opIHsKPiA+IMKg
wqDCoCDCoMKgwqAgaWYgKGVtcHR5X3JpbmcoKSkKPiA+IMKgwqDCoCDCoMKgwqAgwqDCoMKgIGNv
bnRpbnVlOwo+ID4gwqDCoMKgIMKgwqDCoCBicmVhazsKPiA+IMKgwqDCoCB9Cj4gPiAKPiA+IH0K
PiA+IAo+ID4gV2hhdCB0aGlzIHBhdGNoIGRpZDoKPiA+IAo+ID4gZG8gewo+ID4gwqDCoCBpZiAo
Y29uZGl0aW9uX3gpCj4gPiDCoMKgwqAgY29udGludWU7Cj4gPiDCoMKgIGlmIChjb25kaXRpb25f
eSkKPiA+IMKgwqDCoCBjb250aW51ZTsKPiA+IMKgwqAgaWYgKGNvbmRpdGlvbl96KQo+ID4gwqDC
oMKgIGNvbnRpbnVlOwo+ID4gfSB3aGlsZSghbmVlZF9icmVhaygpKQo+ID4gCj4gPiBpcyBtdWNo
IG1vcmUgY29tcGFjdCBhbmQgZWFzaWVyIHRvIHJlYWQ/Cj4gPiAKPiA+IFRoYW5rcwo+IAo+IAo+
IEhpIE1pY2hhZWw6Cj4gCj4gQW55IG1vcmUgY29tbWVudHM/Cj4gCj4gVGhhbmtzCgpKYXNvbiB0
aGUgYWN0dWFsIGNvZGUgaW4gZS5nLiBoYW5kbGVfdHhfY29weSBpcyBub3doZXJlIGNsb3NlIHRv
IHRoZQpuZWF0IGV4YW1wbGUgeW91IHByb3ZpZGUgYmVsb3cuIFllcyBuZXcgcGFydHMgYXJlIGxp
a2UgdGhpcyBidXQgd2UKa2VwdCBhbGwgdGhlIG9sZCBjb2RlIGFyb3VuZCBhbmQgdGhhdCB3b3Jr
cyBkaWZmZXJlbnRseS4KCgpMb29rIGF0IGhhbmRsZV90eF9jb3B5IGZvciBleGFtcGxlLgpXaXRo
IHlvdXIgcGF0Y2ggYXBwbGllZCBvbmUgY2FuIGV4aXQgdGhlIGxvb3A6CgoKCXdpdGggYSBicmVh
awoJd2l0aCBjb250aW51ZSBhbmQgY29uZGl0aW9uIGZhbHNlCglnZXQgdG8gZW5kIG9mIGxvb3Ag
YW5kIGNvbmRpdGlvbiBmYWxzZQoKCWFuZCB3ZSBoYXZlIGEgZ290byB0aGVyZSB3aGljaCBub3cg
Y2FuIGdldCB1cyB0bwoJZW5kIG9mIGxvb3AgYW5kIHRoZW4gZXhpdC4KCnByZXZpb3VzbHkgYXQg
bGVhc3Qgd2Ugd291bGQgb25seSBleGl0Cm9uIGEgYnJlYWsuCgpGcmFua2x5IHRyeWluZyB0byBy
ZXZpZXcgaXQgSSBnZXQgbG9zdCBub3cuCkkgYWxzbyB0aGluayByZXBlYXRlZCBjaGVja2luZyBv
ZiBlbXB0eV9yaW5nIGlzIG5vdCB0aGF0CnByb2JsZW1hdGljLgpCdXQgSSBkb24ndCBpbnNpc3Qg
b24gdGhpcyBzcGVjaWZpYyBzcGxpdHVwCmp1c3QgcGxzIG1ha2UgdGhlIGNvZGUgcmVndWxhciBi
eQptb3Zpbmcgc3R1ZmYgdG8gc3ViLWZ1bmN0aW9uLgoKCi0tIApNU1QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
