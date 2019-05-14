Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F052A1CCD6
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 18:21:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E5B44E29;
	Tue, 14 May 2019 16:21:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 67AC2E29
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 16:21:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C8E1087C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 16:21:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so19895359wro.10
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 09:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=BOCFSrhgfdaeCsPqx/9Z23ucW5WFX+NmToiNV2PrBeE=;
	b=PdTJEk3rJkl5/Q6BMdYWyY+mLh3Je9k8aRd3+eId2ZmDrpuiSkwkbwhCYluD1v2L/Y
	E7i5HD5hal8RIqQ9k/RZamXB/t2iqrg7mgdW5F8onLmMA2ZtDpJFZaqBzXbuVeigD8h2
	PfS6ZvOfghPRtJxeO6nRc99dFaL88S2k3Lwx7TLiSuzGPzqzgM4ImHTSweAdGXGJMgWX
	B2rWyEuSm3oakvvwKOzfcMm3gQ79f3YiGh7FGZCWIE6/seaRJD4YWKWBOQcbb2gwEZAD
	8L2YPJsCkwewLO4WOZWN9iX5I9DtETpYHFTi7Sxr+D1IWcRawfGCmWSlqScd0bRM27C+
	JoSg==
X-Gm-Message-State: APjAAAUP2Ffb4N3T/Dv9Tdsv1X0lD/t9X2agA6SatFMPBcqkxgFA0n/t
	NAzvlqPuIKxq+CuPl1W9ieABNA==
X-Google-Smtp-Source: APXvYqyscd4jQz6/42rGahRh0erb6xOt/MMNshG64dkL9Ee+1e2OY4Rd80gvnBFmXC+AkJhQaflnLg==
X-Received: by 2002:adf:afcd:: with SMTP id y13mr21348543wrd.270.1557850859484;
	Tue, 14 May 2019 09:20:59 -0700 (PDT)
Received: from steredhat (host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151])
	by smtp.gmail.com with ESMTPSA id g3sm4407851wmf.9.2019.05.14.09.20.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 09:20:58 -0700 (PDT)
Date: Tue, 14 May 2019 18:20:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v2 7/8] vsock/virtio: increase RX buffer size to 64 KiB
Message-ID: <20190514162056.5aotcuzsi6e6wya7@steredhat>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-8-sgarzare@redhat.com>
	<bf0416f1-0e69-722d-75ce-3d101e6d7d71@redhat.com>
	<20190513175138.4yycad2xi65komw6@steredhat>
	<fd934a4c-f7d2-8a04-ed93-a3b690ed0d79@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fd934a4c-f7d2-8a04-ed93-a3b690ed0d79@redhat.com>
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

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTE6Mzg6MDVBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzUvMTQg5LiK5Y2IMTo1MSwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3Rl
Ogo+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDY6MDE6NTJQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS81LzEwIOS4i+WNiDg6NTgsIFN0ZWZhbm8gR2FyemFyZWxs
YSB3cm90ZToKPiA+ID4gPiBJbiBvcmRlciB0byBpbmNyZWFzZSBob3N0IC0+IGd1ZXN0IHRocm91
Z2hwdXQgd2l0aCBsYXJnZSBwYWNrZXRzLAo+ID4gPiA+IHdlIGNhbiB1c2UgNjQgS2lCIFJYIGJ1
ZmZlcnMuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxh
IDxzZ2FyemFyZUByZWRoYXQuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICAgIGluY2x1ZGUvbGlu
dXgvdmlydGlvX3Zzb2NrLmggfCAyICstCj4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvdmlydGlvX3Zzb2NrLmggYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb192c29jay5o
Cj4gPiA+ID4gaW5kZXggODRiNzIwMjZkMzI3Li41YTlkMjViZTcyZGYgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9fdnNvY2suaAo+ID4gPiA+ICsrKyBiL2luY2x1ZGUv
bGludXgvdmlydGlvX3Zzb2NrLmgKPiA+ID4gPiBAQCAtMTAsNyArMTAsNyBAQAo+ID4gPiA+ICAg
ICNkZWZpbmUgVklSVElPX1ZTT0NLX0RFRkFVTFRfTUlOX0JVRl9TSVpFCTEyOAo+ID4gPiA+ICAg
ICNkZWZpbmUgVklSVElPX1ZTT0NLX0RFRkFVTFRfQlVGX1NJWkUJCSgxMDI0ICogMjU2KQo+ID4g
PiA+ICAgICNkZWZpbmUgVklSVElPX1ZTT0NLX0RFRkFVTFRfTUFYX0JVRl9TSVpFCSgxMDI0ICog
MjU2KQo+ID4gPiA+IC0jZGVmaW5lIFZJUlRJT19WU09DS19ERUZBVUxUX1JYX0JVRl9TSVpFCSgx
MDI0ICogNCkKPiA+ID4gPiArI2RlZmluZSBWSVJUSU9fVlNPQ0tfREVGQVVMVF9SWF9CVUZfU0la
RQkoMTAyNCAqIDY0KQo+ID4gPiA+ICAgICNkZWZpbmUgVklSVElPX1ZTT0NLX01BWF9CVUZfU0la
RQkJMHhGRkZGRkZGRlVMCj4gPiA+ID4gICAgI2RlZmluZSBWSVJUSU9fVlNPQ0tfTUFYX1BLVF9C
VUZfU0laRQkJKDEwMjQgKiA2NCkKPiA+ID4gCj4gPiA+IFdlIHByb2JhYmx5IGRvbid0IHdhbnQg
c3VjaCBoaWdoIG9yZGVyIGFsbG9jYXRpb24uIEl0J3MgYmV0dGVyIHRvIHN3aXRjaCB0bwo+ID4g
PiB1c2Ugb3JkZXIgMCBwYWdlcyBpbiB0aGlzIGNhc2UuIFNlZSBhZGRfcmVjdmJ1Zl9iaWcoKSBm
b3IgdmlydGlvLW5ldC4gSWYgd2UKPiA+ID4gZ2V0IGRhdGFwYXRoIHVuaWZpZWQsIHdlIHdpbGwg
Z2V0IG1vcmUgc3R1ZmZzIHNldC4KPiA+IElJVUMsIHlvdSBhcmUgc3VnZ2VzdGluZyB0byBhbGxv
Y2F0ZSBvbmx5IHBhZ2VzIGFuZCBwdXQgdGhlbSBpbiBhCj4gPiBzY2F0dGVybGlzdCwgdGhlbiBh
ZGQgdGhlbSB0byB0aGUgdmlydHF1ZXVlLgo+ID4gCj4gPiBJcyBpdCBjb3JyZWN0Pwo+IAo+IAo+
IFllcyBzaW5jZSB5b3UgYXJlIHVzaW5nOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwa3QtPmJ1ZiA9IGttYWxsb2MoYnVmX2xlbiwgR0ZQX0tFUk5FTCk7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcGt0LT5idWYpIHsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZpcnRpb190cmFuc3BvcnRfZnJlZV9wa3Qo
cGt0KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJy
ZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gVGhpcyBpcyBsaWtl
bHkgdG8gZmFpbCB3aGVuIHRoZSBtZW1vcnkgaXMgZnJhZ21lbnRlZCB3aGljaCBpcyBraW5kIG9m
Cj4gZnJhZ2lsZS4KPiAKPiAKClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuCgo+ID4gCj4g
PiBUaGUgaXNzdWUgdGhhdCBJIGhhdmUgaGVyZSwgaXMgdGhhdCB0aGUgdmlydGlvLXZzb2NrIGd1
ZXN0IGRyaXZlciwgc2VlCj4gPiB2aXJ0aW9fdnNvY2tfcnhfZmlsbCgpLCBhbGxvY2F0ZXMgYSBz
dHJ1Y3QgdmlydGlvX3Zzb2NrX3BrdCB0aGF0Cj4gPiBjb250YWlucyB0aGUgcm9vbSBmb3IgdGhl
IGhlYWRlciwgdGhlbiBhbGxvY2F0ZXMgdGhlIGJ1ZmZlciBmb3IgdGhlIHBheWxvYWQuCj4gPiBB
dCB0aGlzIHBvaW50IGl0IGZpbGxzIHRoZSBzY2F0dGVybGlzdCB3aXRoIHRoZSAmdmlydGlvX3Zz
b2NrX3BrdC5oZHIgYW5kIHRoZQo+ID4gYnVmZmVyIGZvciB0aGUgcGF5bG9hZC4KPiAKPiAKPiBU
aGlzIHBhcnQgc2hvdWxkIGJlIGZpbmUgc2luY2Ugd2hhdCBpcyBuZWVkZWQgaXMganVzdCBhZGRp
bmcgbW9yZSBwYWdlcyB0bwo+IHNnW10gYW5kIGNhbGwgdmlydHVxZXVldV9hZGRfc2coKS4KPiAK
PiAKClllcywgSSBhZ3JlZS4KCj4gPiAKPiA+IENoYW5naW5nIHRoaXMgd2lsbCByZXF1aXJlIHNl
dmVyYWwgbW9kaWZpY2F0aW9ucywgYW5kIGlmIHdlIGdldCBkYXRhcGF0aAo+ID4gdW5pZmllZCwg
SSdtIG5vdCBzdXJlIGl0J3Mgd29ydGggaXQuCj4gPiBPZiBjb3Vyc2UsIGlmIHdlIGxlYXZlIHRo
ZSBkYXRhcGF0aHMgc2VwYXJhdGVkLCBJJ2QgbGlrZSB0byBkbyB0aGF0IGxhdGVyLgo+ID4gCj4g
PiBXaGF0IGRvIHlvdSB0aGluaz8KPiAKPiAKPiBGb3IgdGhlIGRyaXZlciBpdCBzZWxmLCBpdCBz
aG91bGQgbm90IGJlIGhhcmQuIEJ1dCBJIHRoaW5rIHlvdSBtZWFuIHRoZQo+IGlzc3VlIG9mIGUu
ZyB2aXJ0aW9fdnNvY2tfcGt0IGl0c2VsZiB3aGljaCBkb2Vzbid0IHN1cHBvcnQgc2cuIEZvciBz
aG9ydAo+IHRpbWUsIG1heWJlIHdlIGNhbiB1c2Uga3ZlYyBpbnN0ZWFkLgoKSSdsbCB0cnkgdG8g
dXNlIGt2ZWMgaW4gdGhlIHZpcnRpb192c29ja19wa3QuCgpTaW5jZSB0aGlzIHN0cnVjdCBpcyBz
aGFyZWQgYWxzbyB3aXRoIHRoZSBob3N0IGRyaXZlciAodmhvc3QtdnNvY2spLApJIGhvcGUgdGhl
IGNoYW5nZXMgY291bGQgYmUgbGltaXRlZCwgb3RoZXJ3aXNlIHdlIGNhbiByZW1vdmUgdGhlIGxh
c3QgMgpwYXRjaGVzIG9mIHRoZSBzZXJpZXMgZm9yIG5vdywgbGVhdmluZyB0aGUgUlggYnVmZmVy
IHNpemUgdG8gNEtCLgoKVGhhbmtzLApTdGVmYW5vCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
