Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B52D80E4
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 22:21:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CEDEAFE2;
	Tue, 15 Oct 2019 20:20:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0AA1E58
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 20:20:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 33C586C5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 20:20:54 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57DB181F0C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 20:20:53 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id s16so149407wme.6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 13:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=8GMAVQL2NP8TCu+G/gUvtl2ZtnzY76GnRz9u4ZClHjY=;
	b=OQRMzLqxx8+R6tClwwUFhAfpXcKOn8mB+50l1HoCRZQcDTLOyseR5sD3kr6S46zDnu
	uytvnTuxCv5FAhKeLRPNVrQNqkgsQ4CO+gYcuwmV+xsk1V/giOHcZE7O5maVFPEFgFUf
	hoDstnFtzT+NIbSWybwTTMN/uGHLlqIRM1+il0JJb3DBuh8LHfgmcjkF/nNuLHgGsiYi
	iV4xT+TOU7AokiD/7BHuigdq9n/oLPZScdoHY8YGWAVmbFGTh5GWgPySLAmseoCnuoO+
	dkctyOM3NQOV+E7W3QLp1jNlkm5NQzJKhI8i4EX02CiqA7p/RywpqTIz3sqoEJ60RnKX
	hxGw==
X-Gm-Message-State: APjAAAWVSKgZmyyXusXnxdQU370/gBdlNvFKvYmFQeN1B/tPoDWNOPR/
	EzUdgcMgeCav9CcRrBaE5qIPGnolHOs3sGvjp9/htqnCjp/KhUq9bYf1ysWpJ1dG3KVW6ZuZm3M
	7jdxtvT+8BjCvwgNiKvv0J6nW1cbFmap7EgYQANn47A==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr297818wmj.51.1571170851989;
	Tue, 15 Oct 2019 13:20:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzh9v01jF2Ba/auCgYS73sLQ6h1NSdbRfqN5RREozaF93h2gJUeFMSOjFP8XokdJfsFY9RWMA==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr297798wmj.51.1571170851664;
	Tue, 15 Oct 2019 13:20:51 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	h63sm547409wmf.15.2019.10.15.13.20.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 13:20:49 -0700 (PDT)
Date: Tue, 15 Oct 2019 16:20:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v1 1/2] vhost: option to fetch descriptors through an
	independent struct
Message-ID: <20191014085806-mutt-send-email-mst@kernel.org>
References: <20191011134358.16912-1-mst@redhat.com>
	<20191011134358.16912-2-mst@redhat.com>
	<3b2a6309-9d21-7172-a581-9f0f1d5c1427@redhat.com>
	<20191012162445-mutt-send-email-mst@kernel.org>
	<fea337ec-7c09-508b-3efa-b75afd6fe33b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fea337ec-7c09-508b-3efa-b75afd6fe33b@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDk6NDM6MjVBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzEwLzEzIOS4iuWNiDQ6MjcsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+IE9uIFNhdCwgT2N0IDEyLCAyMDE5IGF0IDAzOjI4OjQ5UE0gKzA4MDAsIEphc29uIFdh
bmcgd3JvdGU6Cj4gPiA+IE9uIDIwMTkvMTAvMTEg5LiL5Y2IOTo0NSwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+ID4gPiA+IFRoZSBpZGVhIGlzIHRvIHN1cHBvcnQgbXVsdGlwbGUgcmluZyBm
b3JtYXRzIGJ5IGNvbnZlcnRpbmcKPiA+ID4gPiB0byBhIGZvcm1hdC1pbmRlcGVuZGVudCBhcnJh
eSBvZiBkZXNjcmlwdG9ycy4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIGNvc3RzIGV4dHJhIGN5Y2xl
cywgYnV0IHdlIGdhaW4gaW4gYWJpbGl0eQo+ID4gPiA+IHRvIGZldGNoIGEgYmF0Y2ggb2YgZGVz
Y3JpcHRvcnMgaW4gb25lIGdvLCB3aGljaAo+ID4gPiA+IGlzIGdvb2QgZm9yIGNvZGUgY2FjaGUg
bG9jYWxpdHkuCj4gPiA+ID4gCj4gPiA+ID4gVG8gc2ltcGxpZnkgYmVuY2htYXJraW5nLCBJIGtl
cHQgdGhlIG9sZCBjb2RlCj4gPiA+ID4gYXJvdW5kIHNvIG9uZSBjYW4gc3dpdGNoIGJhY2sgYW5k
IGZvcnRoIGJ5Cj4gPiA+ID4gd3JpdGluZyBpbnRvIGEgbW9kdWxlIHBhcmFtZXRlci4KPiA+ID4g
PiBUaGlzIHdpbGwgZ28gYXdheSBpbiB0aGUgZmluYWwgc3VibWlzc2lvbi4KPiA+ID4gPiAKPiA+
ID4gPiBUaGlzIHBhdGNoIGNhdXNlcyBhIG1pbm9yIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLAo+
ID4gPiA+IGl0J3MgYmVlbiBrZXB0IGFzIHNpbXBsZSBhcyBwb3NzaWJsZSBmb3IgZWFzZSBvZiBy
ZXZpZXcuCj4gPiA+ID4gTmV4dCBwYXRjaCBnZXRzIHVzIGJhY2sgdGhlIHBlcmZvcm1hbmNlIGJ5
IGFkZGluZyBiYXRjaGluZy4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgIGRyaXZl
cnMvdmhvc3QvdGVzdC5jICB8ICAxNyArKy0KPiA+ID4gPiAgICBkcml2ZXJzL3Zob3N0L3Zob3N0
LmMgfCAyOTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiA+
ID4gICAgZHJpdmVycy92aG9zdC92aG9zdC5oIHwgIDE2ICsrKwo+ID4gPiA+ICAgIDMgZmlsZXMg
Y2hhbmdlZCwgMzI3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiA+ID4gCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jIGIvZHJpdmVycy92aG9zdC90ZXN0
LmMKPiA+ID4gPiBpbmRleCAwNTYzMDgwMDgyODguLjM5YTAxOGE3YWYyZCAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdmhvc3Qv
dGVzdC5jCj4gPiA+ID4gQEAgLTE4LDYgKzE4LDkgQEAKPiA+ID4gPiAgICAjaW5jbHVkZSAidGVz
dC5oIgo+ID4gPiA+ICAgICNpbmNsdWRlICJ2aG9zdC5oIgo+ID4gPiA+ICtzdGF0aWMgaW50IG5l
d2NvZGUgPSAwOwo+ID4gPiA+ICttb2R1bGVfcGFyYW0obmV3Y29kZSwgaW50LCAwNjQ0KTsKPiA+
ID4gPiArCj4gPiA+ID4gICAgLyogTWF4IG51bWJlciBvZiBieXRlcyB0cmFuc2ZlcnJlZCBiZWZv
cmUgcmVxdWV1ZWluZyB0aGUgam9iLgo+ID4gPiA+ICAgICAqIFVzaW5nIHRoaXMgbGltaXQgcHJl
dmVudHMgb25lIHZpcnRxdWV1ZSBmcm9tIHN0YXJ2aW5nIG90aGVycy4gKi8KPiA+ID4gPiAgICAj
ZGVmaW5lIFZIT1NUX1RFU1RfV0VJR0hUIDB4ODAwMDAKPiA+ID4gPiBAQCAtNTgsMTAgKzYxLDE2
IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV92cShzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikKPiA+ID4gPiAg
ICAJdmhvc3RfZGlzYWJsZV9ub3RpZnkoJm4tPmRldiwgdnEpOwo+ID4gPiA+ICAgIAlmb3IgKDs7
KSB7Cj4gPiA+ID4gLQkJaGVhZCA9IHZob3N0X2dldF92cV9kZXNjKHZxLCB2cS0+aW92LAo+ID4g
PiA+IC0JCQkJCSBBUlJBWV9TSVpFKHZxLT5pb3YpLAo+ID4gPiA+IC0JCQkJCSAmb3V0LCAmaW4s
Cj4gPiA+ID4gLQkJCQkJIE5VTEwsIE5VTEwpOwo+ID4gPiA+ICsJCWlmIChuZXdjb2RlKQo+ID4g
PiA+ICsJCQloZWFkID0gdmhvc3RfZ2V0X3ZxX2Rlc2NfYmF0Y2godnEsIHZxLT5pb3YsCj4gPiA+
ID4gKwkJCQkJCSAgICAgICBBUlJBWV9TSVpFKHZxLT5pb3YpLAo+ID4gPiA+ICsJCQkJCQkgICAg
ICAgJm91dCwgJmluLAo+ID4gPiA+ICsJCQkJCQkgICAgICAgTlVMTCwgTlVMTCk7Cj4gPiA+ID4g
KwkJZWxzZQo+ID4gPiA+ICsJCQloZWFkID0gdmhvc3RfZ2V0X3ZxX2Rlc2ModnEsIHZxLT5pb3Ys
Cj4gPiA+ID4gKwkJCQkJCSBBUlJBWV9TSVpFKHZxLT5pb3YpLAo+ID4gPiA+ICsJCQkJCQkgJm91
dCwgJmluLAo+ID4gPiA+ICsJCQkJCQkgTlVMTCwgTlVMTCk7Cj4gPiA+ID4gICAgCQkvKiBPbiBl
cnJvciwgc3RvcCBoYW5kbGluZyB1bnRpbCB0aGUgbmV4dCBraWNrLiAqLwo+ID4gPiA+ICAgIAkJ
aWYgKHVubGlrZWx5KGhlYWQgPCAwKSkKPiA+ID4gPiAgICAJCQlicmVhazsKPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5jIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4g
PiA+ID4gaW5kZXggMzZjYTJjZjQxOWJmLi4zNjY2MWQ2Y2I1MWYgMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy92aG9zdC92aG9z
dC5jCj4gPiA+ID4gQEAgLTMwMSw2ICszMDEsNyBAQCBzdGF0aWMgdm9pZCB2aG9zdF92cV9yZXNl
dChzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYsCj4gPiA+ID4gICAgCQkJICAgc3RydWN0IHZob3N0X3Zp
cnRxdWV1ZSAqdnEpCj4gPiA+ID4gICAgewo+ID4gPiA+ICAgIAl2cS0+bnVtID0gMTsKPiA+ID4g
PiArCXZxLT5uZGVzY3MgPSAwOwo+ID4gPiA+ICAgIAl2cS0+ZGVzYyA9IE5VTEw7Cj4gPiA+ID4g
ICAgCXZxLT5hdmFpbCA9IE5VTEw7Cj4gPiA+ID4gICAgCXZxLT51c2VkID0gTlVMTDsKPiA+ID4g
PiBAQCAtMzY5LDYgKzM3MCw5IEBAIHN0YXRpYyBpbnQgdmhvc3Rfd29ya2VyKHZvaWQgKmRhdGEp
Cj4gPiA+ID4gICAgc3RhdGljIHZvaWQgdmhvc3RfdnFfZnJlZV9pb3ZlY3Moc3RydWN0IHZob3N0
X3ZpcnRxdWV1ZSAqdnEpCj4gPiA+ID4gICAgewo+ID4gPiA+ICsJa2ZyZWUodnEtPmRlc2NzKTsK
PiA+ID4gPiArCXZxLT5kZXNjcyA9IE5VTEw7Cj4gPiA+ID4gKwl2cS0+bWF4X2Rlc2NzID0gMDsK
PiA+ID4gPiAgICAJa2ZyZWUodnEtPmluZGlyZWN0KTsKPiA+ID4gPiAgICAJdnEtPmluZGlyZWN0
ID0gTlVMTDsKPiA+ID4gPiAgICAJa2ZyZWUodnEtPmxvZyk7Cj4gPiA+ID4gQEAgLTM4NSw2ICsz
ODksMTAgQEAgc3RhdGljIGxvbmcgdmhvc3RfZGV2X2FsbG9jX2lvdmVjcyhzdHJ1Y3Qgdmhvc3Rf
ZGV2ICpkZXYpCj4gPiA+ID4gICAgCWZvciAoaSA9IDA7IGkgPCBkZXYtPm52cXM7ICsraSkgewo+
ID4gPiA+ICAgIAkJdnEgPSBkZXYtPnZxc1tpXTsKPiA+ID4gPiArCQl2cS0+bWF4X2Rlc2NzID0g
ZGV2LT5pb3ZfbGltaXQ7Cj4gPiA+ID4gKwkJdnEtPmRlc2NzID0ga21hbGxvY19hcnJheSh2cS0+
bWF4X2Rlc2NzLAo+ID4gPiA+ICsJCQkJCSAgc2l6ZW9mKCp2cS0+ZGVzY3MpLAo+ID4gPiA+ICsJ
CQkJCSAgR0ZQX0tFUk5FTCk7Cj4gPiA+IAo+ID4gPiBJcyBpb3ZfbGltaXQgdG9vIG11Y2ggaGVy
ZT8gSXQgY2FuIG9idmlvdXNseSBpbmNyZWFzZSB0aGUgZm9vdHByaW50LiBJIGd1ZXNzCj4gPiA+
IHRoZSBiYXRjaGluZyBjYW4gb25seSBiZSBkb25lIGZvciBkZXNjcmlwdG9yIHdpdGhvdXQgaW5k
aXJlY3Qgb3IgbmV4dCBzZXQuCj4gPiA+IFRoZW4gd2UgbWF5IGJhdGNoIDE2IG9yIDY0Lgo+ID4g
PiAKPiA+ID4gVGhhbmtzCj4gPiBZZXMsIG5leHQgcGF0Y2ggb25seSBiYXRjaGVzIHVwIHRvIDY0
LiAgQnV0IHdlIGRvIG5lZWQgaW92X2xpbWl0IGJlY2F1c2UKPiA+IGd1ZXN0IGNhbiBwYXNzIGEg
bG9uZyBjaGFpbiBvZiBzY2F0dGVyL2dhdGhlci4KPiA+IFdlIGFscmVhZHkgaGF2ZSBpb3ZlY3Mg
aW4gYSBodWdlIGFycmF5IHNvIHRoaXMgZG9lcyBub3QgbG9vayBsaWtlCj4gPiBhIGJpZyBkZWFs
LiBJZiB3ZSBldmVyIHRlYWNoIHRoZSBjb2RlIHRvIGF2b2lkIHRoZSBodWdlCj4gPiBpb3YgYXJy
YXlzIGJ5IGhhbmRsaW5nIGh1Z2Ugcy9nIGxpc3RzIHBpZWNlIGJ5IHBpZWNlLAo+ID4gd2UgY2Fu
IG1ha2UgdGhlIGRlc2MgYXJyYXkgc21hbGxlciBhdCB0aGUgc2FtZSBwb2ludC4KPiA+IAo+IAo+
IEFub3RoZXIgcG9zc2libGUgaXNzdWUsIGlmIHdlIHRyeSB0byBiYXRjaCBkZXNjcmlwdG9yIGNo
YWluIHdoZW4gd2UndmUKPiBhbHJlYWR5IGJhdGNoZWQgc29tZSBkZXNjcmlwdG9ycywgd2UgbWF5
IHJlYWNoIHRoZSBsaW1pdCB0aGVuIHNvbWUgb2YgdGhlCj4gZGVzY3JpcHRvcnMgbWlnaHQgbmVl
ZCByZS1yZWFkLgo+IAo+IE9yIHdlIG1heSBuZWVkIGNpcmN1bGFyIGluZGV4IChoZWFkLCB0YWls
KSBpbiB0aGlzIGNhc2U/Cj4gCj4gVGhhbmtzCgpXZSBuZXZlciBzdXBwb3J0ZWQgbW9yZSB0aGFu
IElPVl9NQVggZGVzY3JpcHRvcnMuCkFuZCB3ZSBkb24ndCBiYXRjaCBtb3JlIHRoYW4gaW92X2xp
bWl0IC0gSU9WX01BWC4KCnNvIGJ1ZmZlciBuZXZlciBvdmVyZmxvd3MuCgotLSAKTVNUCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
