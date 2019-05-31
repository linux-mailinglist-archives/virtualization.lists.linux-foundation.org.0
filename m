Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E147B30A1B
	for <lists.virtualization@lfdr.de>; Fri, 31 May 2019 10:19:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D4E67EB9;
	Fri, 31 May 2019 08:19:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 82537EB1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 08:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC7925F4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 08:18:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so5892626wrt.1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 01:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=BIz1bv11HMjHB1Hu4xZnOc0yPIRdRCqcQguEpfnn82A=;
	b=cKYoP32YVpMfwPgxtI5ZCfsuz40ejEFnLkKk2beaWabQzug0qmkm9KSMagyao5RXeN
	fWlF2bP8ZZ3UZnJIqq1VghGjNXOx69kxn7UslG6k9szjYzQODG/UiBKLrz1h0O4NVhZl
	Mjohn00M3WNNjsVa/gBZWnnS/MM/AqVwe3qXO7EPHVc6t7pfP0yqI+SSZa6ihVzFodQX
	bNZZ1YiFssG7+hpV/VD1RUEoJhmZplp3YghjYlz0oWMvLsr0pVjdLGCklv7NLoKtgORD
	Vz+OIrGF5ByUR6bBaploTxQdP2nDiVrtV6pZGF0nNz/Jcbtrv7wp96AimFK2GxlSZFO+
	hIvA==
X-Gm-Message-State: APjAAAVqFmsTC5bNQNpckjH5OgkHGRYX16VmRcy9NMmqyCoHKzrC0/h8
	dKbJnTdq0/xofC1I47U3tsNMTg==
X-Google-Smtp-Source: APXvYqye/QQLh7SIvvpoJvA/hOy1L+4fNdxw49tgzQO5LNakbcjr0yAiG43fF/BFitqAfrP4xKJycg==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr5685635wrr.317.1559290707447; 
	Fri, 31 May 2019 01:18:27 -0700 (PDT)
Received: from steredhat (host253-229-dynamic.248-95-r.retail.telecomitalia.it.
	[95.248.229.253])
	by smtp.gmail.com with ESMTPSA id n7sm3575495wrw.64.2019.05.31.01.18.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 01:18:26 -0700 (PDT)
Date: Fri, 31 May 2019 10:18:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/4] vsock/virtio: fix flush of works during the .remove()
Message-ID: <20190531081824.p6ylsgvkrbckhqpx@steredhat>
References: <20190528105623.27983-1-sgarzare@redhat.com>
	<20190528105623.27983-4-sgarzare@redhat.com>
	<9ac9fc4b-5c39-2503-dfbb-660a7bdcfbfd@redhat.com>
	<20190529105832.oz3sagbne5teq3nt@steredhat>
	<8c9998c8-1b9c-aac6-42eb-135fcb966187@redhat.com>
	<20190530101036.wnjphmajrz6nz6zc@steredhat.homenet.telecomitalia.it>
	<4c881585-8fee-0a53-865c-05d41ffb8ed1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c881585-8fee-0a53-865c-05d41ffb8ed1@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
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

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDc6NTk6MTRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzUvMzAg5LiL5Y2INjoxMCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3Rl
Ogo+ID4gT24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDU6NDY6MThQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS81LzI5IOS4i+WNiDY6NTgsIFN0ZWZhbm8gR2FyemFyZWxs
YSB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAxMToyMjo0MEFNICswODAw
LCBKYXNvbiBXYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gMjAxOS81LzI4IOS4i+WNiDY6NTYsIFN0
ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPiA+ID4gPiA+ID4gQEAgLTY5MCw2ICs2OTMsOSBAQCBz
dGF0aWMgdm9pZCB2aXJ0aW9fdnNvY2tfcmVtb3ZlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2
KQo+ID4gPiA+ID4gPiAgICAgCXZzb2NrLT5ldmVudF9ydW4gPSBmYWxzZTsKPiA+ID4gPiA+ID4g
ICAgIAltdXRleF91bmxvY2soJnZzb2NrLT5ldmVudF9sb2NrKTsKPiA+ID4gPiA+ID4gKwkvKiBG
bHVzaCBhbGwgcGVuZGluZyB3b3JrcyAqLwo+ID4gPiA+ID4gPiArCXZpcnRpb192c29ja19mbHVz
aF93b3Jrcyh2c29jayk7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gICAgIAkvKiBGbHVzaCBh
bGwgZGV2aWNlIHdyaXRlcyBhbmQgaW50ZXJydXB0cywgZGV2aWNlIHdpbGwgbm90IHVzZSBhbnkK
PiA+ID4gPiA+ID4gICAgIAkgKiBtb3JlIGJ1ZmZlcnMuCj4gPiA+ID4gPiA+ICAgICAJICovCj4g
PiA+ID4gPiA+IEBAIC03MjYsNiArNzMyLDExIEBAIHN0YXRpYyB2b2lkIHZpcnRpb192c29ja19y
ZW1vdmUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCj4gPiA+ID4gPiA+ICAgICAJLyogRGVs
ZXRlIHZpcnRxdWV1ZXMgYW5kIGZsdXNoIG91dHN0YW5kaW5nIGNhbGxiYWNrcyBpZiBhbnkgKi8K
PiA+ID4gPiA+ID4gICAgIAl2ZGV2LT5jb25maWctPmRlbF92cXModmRldik7Cj4gPiA+ID4gPiA+
ICsJLyogT3RoZXIgd29ya3MgY2FuIGJlIHF1ZXVlZCBiZWZvcmUgJ2NvbmZpZy0+ZGVsX3Zxcygp
Jywgc28gd2UgZmx1c2gKPiA+ID4gPiA+ID4gKwkgKiBhbGwgd29ya3MgYmVmb3JlIHRvIGZyZWUg
dGhlIHZzb2NrIG9iamVjdCB0byBhdm9pZCB1c2UgYWZ0ZXIgZnJlZS4KPiA+ID4gPiA+ID4gKwkg
Ki8KPiA+ID4gPiA+ID4gKwl2aXJ0aW9fdnNvY2tfZmx1c2hfd29ya3ModnNvY2spOwo+ID4gPiA+
ID4gU29tZSBxdWVzdGlvbnMgYWZ0ZXIgYSBxdWljayBnbGFuY2U6Cj4gPiA+ID4gPiAKPiA+ID4g
PiA+IDEpIEl0IGxvb2tzIHRvIG1lIHRoYXQgdGhlIHdvcmsgY291bGQgYmUgcXVldWVkIGZyb20g
dGhlIHBhdGggb2YKPiA+ID4gPiA+IHZzb2NrX3RyYW5zcG9ydF9jYW5jZWxfcGt0KCkgLiBJcyB0
aGF0IHN5bmNocm9uaXplZCBoZXJlPwo+ID4gPiA+ID4gCj4gPiA+ID4gQm90aCB2aXJ0aW9fdHJh
bnNwb3J0X3NlbmRfcGt0KCkgYW5kIHZzb2NrX3RyYW5zcG9ydF9jYW5jZWxfcGt0KCkgY2FuCj4g
PiA+ID4gcXVldWUgd29yayBmcm9tIHRoZSB1cHBlciBsYXllciAoc29ja2V0KS4KPiA+ID4gPiAK
PiA+ID4gPiBTZXR0aW5nIHRoZV92aXJ0aW9fdnNvY2sgdG8gTlVMTCwgc2hvdWxkIHN5bmNocm9u
aXplLCBidXQgYWZ0ZXIgYSBjYXJlZnVsIGxvb2sKPiA+ID4gPiBhIHJhcmUgaXNzdWUgY291bGQg
aGFwcGVuOgo+ID4gPiA+IHdlIGFyZSBzZXR0aW5nIHRoZV92aXJ0aW9fdnNvY2sgdG8gTlVMTCBh
dCB0aGUgc3RhcnQgb2YgLnJlbW92ZSgpIGFuZCB3ZQo+ID4gPiA+IGFyZSBmcmVlaW5nIHRoZSBv
YmplY3QgcG9pbnRlZCBieSBpdCBhdCB0aGUgZW5kIG9mIC5yZW1vdmUoKSwgc28KPiA+ID4gPiB2
aXJ0aW9fdHJhbnNwb3J0X3NlbmRfcGt0KCkgb3IgdnNvY2tfdHJhbnNwb3J0X2NhbmNlbF9wa3Qo
KSBtYXkgc3RpbGwgYmUKPiA+ID4gPiBydW5uaW5nLCBhY2Nlc3NpbmcgdGhlIG9iamVjdCB0aGF0
IHdlIGFyZSBmcmVlZC4KPiA+ID4gCj4gPiA+IFllcywgdGhhdCdzIG15IHBvaW50Lgo+ID4gPiAK
PiA+ID4gCj4gPiA+ID4gU2hvdWxkIEkgdXNlIHNvbWV0aGluZyBsaWtlIFJDVSB0byBwcmV2ZW50
IHRoaXMgaXNzdWU/Cj4gPiA+ID4gCj4gPiA+ID4gICAgICAgdmlydGlvX3RyYW5zcG9ydF9zZW5k
X3BrdCgpIGFuZCB2c29ja190cmFuc3BvcnRfY2FuY2VsX3BrdCgpCj4gPiA+ID4gICAgICAgewo+
ID4gPiA+ICAgICAgICAgICByY3VfcmVhZF9sb2NrKCk7Cj4gPiA+ID4gICAgICAgICAgIHZzb2Nr
ID0gcmN1X2RlcmVmZXJlbmNlKHRoZV92aXJ0aW9fdnNvY2tfbXV0ZXgpOwo+ID4gPiAKPiA+ID4g
UkNVIGlzIHByb2JhYmx5IGEgd2F5IHRvIGdvLiAoTGlrZSB3aGF0IHZob3N0X3RyYW5zcG9ydF9z
ZW5kX3BrdCgpIGRpZCkuCj4gPiA+IAo+ID4gT2theSwgSSdtIGdvaW5nIHRoaXMgd2F5Lgo+ID4g
Cj4gPiA+ID4gICAgICAgICAgIC4uLgo+ID4gPiA+ICAgICAgICAgICByY3VfcmVhZF91bmxvY2so
KTsKPiA+ID4gPiAgICAgICB9Cj4gPiA+ID4gCj4gPiA+ID4gICAgICAgdmlydGlvX3Zzb2NrX3Jl
bW92ZSgpCj4gPiA+ID4gICAgICAgewo+ID4gPiA+ICAgICAgICAgICByY3VfYXNzaWduX3BvaW50
ZXIodGhlX3ZpcnRpb192c29ja19tdXRleCwgTlVMTCk7Cj4gPiA+ID4gICAgICAgICAgIHN5bmNo
cm9uaXplX3JjdSgpOwo+ID4gPiA+IAo+ID4gPiA+ICAgICAgICAgICAuLi4KPiA+ID4gPiAKPiA+
ID4gPiAgICAgICAgICAgZnJlZSh2c29jayk7Cj4gPiA+ID4gICAgICAgfQo+ID4gPiA+IAo+ID4g
PiA+IENvdWxkIHRoZXJlIGJlIGEgYmV0dGVyIGFwcHJvYWNoPwo+ID4gPiA+IAo+ID4gPiA+IAo+
ID4gPiA+ID4gMikgSWYgd2UgZGVjaWRlIHRvIGZsdXNoIGFmdGVyIGRldl92cXMoKSwgaXMgdHhf
cnVuL3J4X3J1bi9ldmVudF9ydW4gc3RpbGwKPiA+ID4gPiA+IG5lZWRlZD8gSXQgbG9va3MgdG8g
bWUgd2UndmUgYWxyZWFkeSBkb25lIGV4Y2VwdCB0aGF0IHdlIG5lZWQgZmx1c2ggcnhfd29yawo+
ID4gPiA+ID4gaW4gdGhlIGVuZCBzaW5jZSBzZW5kX3BrdF93b3JrIGNhbiByZXF1ZXVlIHJ4X3dv
cmsuCj4gPiA+ID4gVGhlIG1haW4gcmVhc29uIG9mIHR4X3J1bi9yeF9ydW4vZXZlbnRfcnVuIGlz
IHRvIHByZXZlbnQgdGhhdCBhIHdvcmtlcgo+ID4gPiA+IGZ1bmN0aW9uIGlzIHJ1bm5pbmcgd2hp
bGUgd2UgYXJlIGNhbGxpbmcgY29uZmlnLT5yZXNldCgpLgo+ID4gPiA+IAo+ID4gPiA+IEUuZy4g
aWYgYW4gaW50ZXJydXB0IGNvbWVzIGJldHdlZW4gdmlydGlvX3Zzb2NrX2ZsdXNoX3dvcmtzKCkg
YW5kCj4gPiA+ID4gY29uZmlnLT5yZXNldCgpLCBpdCBjYW4gcXVldWUgbmV3IHdvcmtzIHRoYXQg
Y2FuIGFjY2VzcyB0aGUgZGV2aWNlIHdoaWxlCj4gPiA+ID4gd2UgYXJlIGluIGNvbmZpZy0+cmVz
ZXQoKS4KPiA+ID4gPiAKPiA+ID4gPiBJTUhPIHRoZXkgYXJlIHN0aWxsIG5lZWRlZC4KPiA+ID4g
PiAKPiA+ID4gPiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+ID4gCj4gPiA+IEkgbWVhbiBjb3VsZCB3
ZSBzaW1wbHkgZG8gZmx1c2ggYWZ0ZXIgcmVzZXQgb25jZSBhbmQgd2l0aG91dCB0eF9yeC9yeF9y
dW4KPiA+ID4gdHJpY2tzPwo+ID4gPiAKPiA+ID4gcmVzdCgpOwo+ID4gPiAKPiA+ID4gdmlydGlv
X3Zzb2NrX2ZsdXNoX3dvcmsoKTsKPiA+ID4gCj4gPiA+IHZpcnRpb192c29ja19mcmVlX2J1Zigp
Owo+ID4gTXkgb25seSBkb3VidCBpczoKPiA+IGlzIGl0IHNhZmUgdG8gY2FsbCBjb25maWctPnJl
c2V0KCkgd2hpbGUgYSB3b3JrZXIgZnVuY3Rpb24gY291bGQgYWNjZXNzCj4gPiB0aGUgZGV2aWNl
Pwo+ID4gCj4gPiBJIGhhZCB0aGlzIGRvdWJ0IHJlYWRpbmcgdGhlIE1pY2hhZWwncyBhZHZpY2Vb
MV0gYW5kIGxvb2tpbmcgYXQKPiA+IHZpcnRuZXRfcmVtb3ZlKCkgd2hlcmUgdGhlcmUgYXJlIHRo
ZXNlIGxpbmVzIGJlZm9yZSB0aGUgY29uZmlnLT5yZXNldCgpOgo+ID4gCj4gPiAJLyogTWFrZSBz
dXJlIG5vIHdvcmsgaGFuZGxlciBpcyBhY2Nlc3NpbmcgdGhlIGRldmljZS4gKi8KPiA+IAlmbHVz
aF93b3JrKCZ2aS0+Y29uZmlnX3dvcmspOwo+ID4gCj4gPiBUaGFua3MsCj4gPiBTdGVmYW5vCj4g
PiAKPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMjAxOTA1MjEwNTU2NTAt
bXV0dC1zZW5kLWVtYWlsLW1zdEBrZXJuZWwub3JnCj4gCj4gCj4gR29vZCBwb2ludC4gVGhlbiBJ
IGFncmVlIHdpdGggeW91LiBCdXQgaWYgd2UgY2FuIHVzZSB0aGUgUkNVIHRvIGRldGVjdCB0aGUK
PiBkZXRhY2ggb2YgZGV2aWNlIGZyb20gc29ja2V0IGZvciB0aGVzZSwgaXQgd291bGQgYmUgZXZl
biBiZXR0ZXIuCj4gCgpXaGF0IGFib3V0IGNoZWNraW5nICd0aGVfdmlydGlvX3Zzb2NrJyBpbiB0
aGUgd29ya2VyIGZ1bmN0aW9ucyBpbiBhIFJDVQpjcml0aWNhbCBzZWN0aW9uPwpJbiB0aGlzIHdh
eSwgSSBjYW4gcmVtb3ZlIHRoZSByeF9ydW4vdHhfcnVuL2V2ZW50X3J1bi4KCkRvIHlvdSB0aGlu
ayBpdCdzIGNsZWFuZXI/CgpUaGFuayB5b3UgdmVyeSBtdWNoLApTdGVmYW5vCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
