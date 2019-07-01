Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDF43473
	for <lists.virtualization@lfdr.de>; Thu, 13 Jun 2019 10:57:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B6B5F137A;
	Thu, 13 Jun 2019 08:57:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6C02D1363
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:57:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D919B63D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 08:57:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1179030872E7;
	Thu, 13 Jun 2019 08:57:25 +0000 (UTC)
Received: from [10.72.12.64] (ovpn-12-64.pek2.redhat.com [10.72.12.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9501880C0;
	Thu, 13 Jun 2019 08:57:16 +0000 (UTC)
Subject: Re: [PATCH 3/4] vsock/virtio: fix flush of works during the .remove()
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190528105623.27983-1-sgarzare@redhat.com>
	<20190528105623.27983-4-sgarzare@redhat.com>
	<9ac9fc4b-5c39-2503-dfbb-660a7bdcfbfd@redhat.com>
	<20190529105832.oz3sagbne5teq3nt@steredhat>
	<8c9998c8-1b9c-aac6-42eb-135fcb966187@redhat.com>
	<20190530101036.wnjphmajrz6nz6zc@steredhat.homenet.telecomitalia.it>
	<4c881585-8fee-0a53-865c-05d41ffb8ed1@redhat.com>
	<20190531081824.p6ylsgvkrbckhqpx@steredhat>
	<dbc9964c-65b1-0993-488b-cb44aea55e90@redhat.com>
	<20190606081109.gdx4rsly5i6gtg57@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b1fa0b2f-f7d0-8117-0bde-0cb78d1a3d07@redhat.com>
Date: Thu, 13 Jun 2019 16:57:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606081109.gdx4rsly5i6gtg57@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 13 Jun 2019 08:57:30 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvNi82IOS4i+WNiDQ6MTEsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPiBPbiBG
cmksIE1heSAzMSwgMjAxOSBhdCAwNTo1NjozOVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDE5LzUvMzEg5LiL5Y2INDoxOCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+Pj4g
T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDc6NTk6MTRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPj4+PiBPbiAyMDE5LzUvMzAg5LiL5Y2INjoxMCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3Rl
Ogo+Pj4+PiBPbiBUaHUsIE1heSAzMCwgMjAxOSBhdCAwNTo0NjoxOFBNICswODAwLCBKYXNvbiBX
YW5nIHdyb3RlOgo+Pj4+Pj4gT24gMjAxOS81LzI5IOS4i+WNiDY6NTgsIFN0ZWZhbm8gR2FyemFy
ZWxsYSB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAxMToyMjo0MEFNICsw
ODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyMDE5LzUvMjgg5LiL5Y2INjo1Niwg
U3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+Pj4+Pj4+Pj4gQEAgLTY5MCw2ICs2OTMsOSBAQCBz
dGF0aWMgdm9pZCB2aXJ0aW9fdnNvY2tfcmVtb3ZlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2
KQo+Pj4+Pj4+Pj4gICAgICAgCXZzb2NrLT5ldmVudF9ydW4gPSBmYWxzZTsKPj4+Pj4+Pj4+ICAg
ICAgIAltdXRleF91bmxvY2soJnZzb2NrLT5ldmVudF9sb2NrKTsKPj4+Pj4+Pj4+ICsJLyogRmx1
c2ggYWxsIHBlbmRpbmcgd29ya3MgKi8KPj4+Pj4+Pj4+ICsJdmlydGlvX3Zzb2NrX2ZsdXNoX3dv
cmtzKHZzb2NrKTsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICAgICAgIAkvKiBGbHVzaCBhbGwgZGV2
aWNlIHdyaXRlcyBhbmQgaW50ZXJydXB0cywgZGV2aWNlIHdpbGwgbm90IHVzZSBhbnkKPj4+Pj4+
Pj4+ICAgICAgIAkgKiBtb3JlIGJ1ZmZlcnMuCj4+Pj4+Pj4+PiAgICAgICAJICovCj4+Pj4+Pj4+
PiBAQCAtNzI2LDYgKzczMiwxMSBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fdnNvY2tfcmVtb3ZlKHN0
cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+Pj4+Pj4+Pj4gICAgICAgCS8qIERlbGV0ZSB2aXJ0
cXVldWVzIGFuZCBmbHVzaCBvdXRzdGFuZGluZyBjYWxsYmFja3MgaWYgYW55ICovCj4+Pj4+Pj4+
PiAgICAgICAJdmRldi0+Y29uZmlnLT5kZWxfdnFzKHZkZXYpOwo+Pj4+Pj4+Pj4gKwkvKiBPdGhl
ciB3b3JrcyBjYW4gYmUgcXVldWVkIGJlZm9yZSAnY29uZmlnLT5kZWxfdnFzKCknLCBzbyB3ZSBm
bHVzaAo+Pj4+Pj4+Pj4gKwkgKiBhbGwgd29ya3MgYmVmb3JlIHRvIGZyZWUgdGhlIHZzb2NrIG9i
amVjdCB0byBhdm9pZCB1c2UgYWZ0ZXIgZnJlZS4KPj4+Pj4+Pj4+ICsJICovCj4+Pj4+Pj4+PiAr
CXZpcnRpb192c29ja19mbHVzaF93b3Jrcyh2c29jayk7Cj4+Pj4+Pj4+IFNvbWUgcXVlc3Rpb25z
IGFmdGVyIGEgcXVpY2sgZ2xhbmNlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAxKSBJdCBsb29rcyB0byBt
ZSB0aGF0IHRoZSB3b3JrIGNvdWxkIGJlIHF1ZXVlZCBmcm9tIHRoZSBwYXRoIG9mCj4+Pj4+Pj4+
IHZzb2NrX3RyYW5zcG9ydF9jYW5jZWxfcGt0KCkgLiBJcyB0aGF0IHN5bmNocm9uaXplZCBoZXJl
Pwo+Pj4+Pj4+Pgo+Pj4+Pj4+IEJvdGggdmlydGlvX3RyYW5zcG9ydF9zZW5kX3BrdCgpIGFuZCB2
c29ja190cmFuc3BvcnRfY2FuY2VsX3BrdCgpIGNhbgo+Pj4+Pj4+IHF1ZXVlIHdvcmsgZnJvbSB0
aGUgdXBwZXIgbGF5ZXIgKHNvY2tldCkuCj4+Pj4+Pj4KPj4+Pj4+PiBTZXR0aW5nIHRoZV92aXJ0
aW9fdnNvY2sgdG8gTlVMTCwgc2hvdWxkIHN5bmNocm9uaXplLCBidXQgYWZ0ZXIgYSBjYXJlZnVs
IGxvb2sKPj4+Pj4+PiBhIHJhcmUgaXNzdWUgY291bGQgaGFwcGVuOgo+Pj4+Pj4+IHdlIGFyZSBz
ZXR0aW5nIHRoZV92aXJ0aW9fdnNvY2sgdG8gTlVMTCBhdCB0aGUgc3RhcnQgb2YgLnJlbW92ZSgp
IGFuZCB3ZQo+Pj4+Pj4+IGFyZSBmcmVlaW5nIHRoZSBvYmplY3QgcG9pbnRlZCBieSBpdCBhdCB0
aGUgZW5kIG9mIC5yZW1vdmUoKSwgc28KPj4+Pj4+PiB2aXJ0aW9fdHJhbnNwb3J0X3NlbmRfcGt0
KCkgb3IgdnNvY2tfdHJhbnNwb3J0X2NhbmNlbF9wa3QoKSBtYXkgc3RpbGwgYmUKPj4+Pj4+PiBy
dW5uaW5nLCBhY2Nlc3NpbmcgdGhlIG9iamVjdCB0aGF0IHdlIGFyZSBmcmVlZC4KPj4+Pj4+IFll
cywgdGhhdCdzIG15IHBvaW50Lgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+Pj4gU2hvdWxkIEkgdXNlIHNv
bWV0aGluZyBsaWtlIFJDVSB0byBwcmV2ZW50IHRoaXMgaXNzdWU/Cj4+Pj4+Pj4KPj4+Pj4+PiAg
ICAgICAgIHZpcnRpb190cmFuc3BvcnRfc2VuZF9wa3QoKSBhbmQgdnNvY2tfdHJhbnNwb3J0X2Nh
bmNlbF9wa3QoKQo+Pj4+Pj4+ICAgICAgICAgewo+Pj4+Pj4+ICAgICAgICAgICAgIHJjdV9yZWFk
X2xvY2soKTsKPj4+Pj4+PiAgICAgICAgICAgICB2c29jayA9IHJjdV9kZXJlZmVyZW5jZSh0aGVf
dmlydGlvX3Zzb2NrX211dGV4KTsKPj4+Pj4+IFJDVSBpcyBwcm9iYWJseSBhIHdheSB0byBnby4g
KExpa2Ugd2hhdCB2aG9zdF90cmFuc3BvcnRfc2VuZF9wa3QoKSBkaWQpLgo+Pj4+Pj4KPj4+Pj4g
T2theSwgSSdtIGdvaW5nIHRoaXMgd2F5Lgo+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgICAgIC4uLgo+
Pj4+Pj4+ICAgICAgICAgICAgIHJjdV9yZWFkX3VubG9jaygpOwo+Pj4+Pj4+ICAgICAgICAgfQo+
Pj4+Pj4+Cj4+Pj4+Pj4gICAgICAgICB2aXJ0aW9fdnNvY2tfcmVtb3ZlKCkKPj4+Pj4+PiAgICAg
ICAgIHsKPj4+Pj4+PiAgICAgICAgICAgICByY3VfYXNzaWduX3BvaW50ZXIodGhlX3ZpcnRpb192
c29ja19tdXRleCwgTlVMTCk7Cj4+Pj4+Pj4gICAgICAgICAgICAgc3luY2hyb25pemVfcmN1KCk7
Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgICAgICAgICAuLi4KPj4+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAg
ICAgIGZyZWUodnNvY2spOwo+Pj4+Pj4+ICAgICAgICAgfQo+Pj4+Pj4+Cj4+Pj4+Pj4gQ291bGQg
dGhlcmUgYmUgYSBiZXR0ZXIgYXBwcm9hY2g/Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+PiAyKSBJ
ZiB3ZSBkZWNpZGUgdG8gZmx1c2ggYWZ0ZXIgZGV2X3ZxcygpLCBpcyB0eF9ydW4vcnhfcnVuL2V2
ZW50X3J1biBzdGlsbAo+Pj4+Pj4+PiBuZWVkZWQ/IEl0IGxvb2tzIHRvIG1lIHdlJ3ZlIGFscmVh
ZHkgZG9uZSBleGNlcHQgdGhhdCB3ZSBuZWVkIGZsdXNoIHJ4X3dvcmsKPj4+Pj4+Pj4gaW4gdGhl
IGVuZCBzaW5jZSBzZW5kX3BrdF93b3JrIGNhbiByZXF1ZXVlIHJ4X3dvcmsuCj4+Pj4+Pj4gVGhl
IG1haW4gcmVhc29uIG9mIHR4X3J1bi9yeF9ydW4vZXZlbnRfcnVuIGlzIHRvIHByZXZlbnQgdGhh
dCBhIHdvcmtlcgo+Pj4+Pj4+IGZ1bmN0aW9uIGlzIHJ1bm5pbmcgd2hpbGUgd2UgYXJlIGNhbGxp
bmcgY29uZmlnLT5yZXNldCgpLgo+Pj4+Pj4+Cj4+Pj4+Pj4gRS5nLiBpZiBhbiBpbnRlcnJ1cHQg
Y29tZXMgYmV0d2VlbiB2aXJ0aW9fdnNvY2tfZmx1c2hfd29ya3MoKSBhbmQKPj4+Pj4+PiBjb25m
aWctPnJlc2V0KCksIGl0IGNhbiBxdWV1ZSBuZXcgd29ya3MgdGhhdCBjYW4gYWNjZXNzIHRoZSBk
ZXZpY2Ugd2hpbGUKPj4+Pj4+PiB3ZSBhcmUgaW4gY29uZmlnLT5yZXNldCgpLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gSU1ITyB0aGV5IGFyZSBzdGlsbCBuZWVkZWQuCj4+Pj4+Pj4KPj4+Pj4+PiBXaGF0IGRv
IHlvdSB0aGluaz8KPj4+Pj4+IEkgbWVhbiBjb3VsZCB3ZSBzaW1wbHkgZG8gZmx1c2ggYWZ0ZXIg
cmVzZXQgb25jZSBhbmQgd2l0aG91dCB0eF9yeC9yeF9ydW4KPj4+Pj4+IHRyaWNrcz8KPj4+Pj4+
Cj4+Pj4+PiByZXN0KCk7Cj4+Pj4+Pgo+Pj4+Pj4gdmlydGlvX3Zzb2NrX2ZsdXNoX3dvcmsoKTsK
Pj4+Pj4+Cj4+Pj4+PiB2aXJ0aW9fdnNvY2tfZnJlZV9idWYoKTsKPj4+Pj4gTXkgb25seSBkb3Vi
dCBpczoKPj4+Pj4gaXMgaXQgc2FmZSB0byBjYWxsIGNvbmZpZy0+cmVzZXQoKSB3aGlsZSBhIHdv
cmtlciBmdW5jdGlvbiBjb3VsZCBhY2Nlc3MKPj4+Pj4gdGhlIGRldmljZT8KPj4+Pj4KPj4+Pj4g
SSBoYWQgdGhpcyBkb3VidCByZWFkaW5nIHRoZSBNaWNoYWVsJ3MgYWR2aWNlWzFdIGFuZCBsb29r
aW5nIGF0Cj4+Pj4+IHZpcnRuZXRfcmVtb3ZlKCkgd2hlcmUgdGhlcmUgYXJlIHRoZXNlIGxpbmVz
IGJlZm9yZSB0aGUgY29uZmlnLT5yZXNldCgpOgo+Pj4+Pgo+Pj4+PiAJLyogTWFrZSBzdXJlIG5v
IHdvcmsgaGFuZGxlciBpcyBhY2Nlc3NpbmcgdGhlIGRldmljZS4gKi8KPj4+Pj4gCWZsdXNoX3dv
cmsoJnZpLT5jb25maWdfd29yayk7Cj4+Pj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4gU3RlZmFubwo+
Pj4+Pgo+Pj4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMTkwNTIxMDU1
NjUwLW11dHQtc2VuZC1lbWFpbC1tc3RAa2VybmVsLm9yZwo+Pj4+IEdvb2QgcG9pbnQuIFRoZW4g
SSBhZ3JlZSB3aXRoIHlvdS4gQnV0IGlmIHdlIGNhbiB1c2UgdGhlIFJDVSB0byBkZXRlY3QgdGhl
Cj4+Pj4gZGV0YWNoIG9mIGRldmljZSBmcm9tIHNvY2tldCBmb3IgdGhlc2UsIGl0IHdvdWxkIGJl
IGV2ZW4gYmV0dGVyLgo+Pj4+Cj4+PiBXaGF0IGFib3V0IGNoZWNraW5nICd0aGVfdmlydGlvX3Zz
b2NrJyBpbiB0aGUgd29ya2VyIGZ1bmN0aW9ucyBpbiBhIFJDVQo+Pj4gY3JpdGljYWwgc2VjdGlv
bj8KPj4+IEluIHRoaXMgd2F5LCBJIGNhbiByZW1vdmUgdGhlIHJ4X3J1bi90eF9ydW4vZXZlbnRf
cnVuLgo+Pj4KPj4+IERvIHlvdSB0aGluayBpdCdzIGNsZWFuZXI/Cj4+Cj4+IFllcywgSSB0aGlu
ayBzby4KPj4KPiBIaSBKYXNvbiwKPiB3aGlsZSBJIHdhcyB0cnlpbmcgdG8gdXNlIFJDVSBhbHNv
IGZvciB3b3JrZXJzLCBJIGRpc2NvdmVyZWQgdGhhdCBpdCBjYW4KPiBub3QgYmUgdXNlZCBpZiB3
ZSBjYW4gc2xlZXAuIChXb3JrZXJzIGhhdmUgbXV0ZXgsIG1lbW9yeSBhbGxvY2F0aW9uLCBldGMu
KS4KPiBUaGVyZSBpcyBTUkNVLCBidXQgSSB0aGluayB0aGUgcnhfcnVuL3R4X3J1bi9ldmVudF9y
dW4gaXMgY2xlYW5lci4KPgo+IFNvLCBpZiB5b3UgYWdyZWUgSSdkIHNlbmQgYSB2MiB1c2luZyBS
Q1Ugb25seSBmb3IgdGhlCj4gdmlydGlvX3RyYW5zcG9ydF9zZW5kX3BrdCgpIG9yIHZzb2NrX3Ry
YW5zcG9ydF9jYW5jZWxfcGt0KCksIGFuZCBsZWF2ZQo+IHRoaXMgcGF0Y2ggYXMgaXMgdG8gYmUg
c3VyZSB0aGF0IG5vIG9uZSBpcyBhY2Nlc3NpbmcgdGhlIGRldmljZSB3aGlsZSB3ZQo+IGNhbGwg
Y29uZmlnLT5yZXNldCgpLgo+Cj4gVGhhbmtzLAo+IFN0ZWZhbm8KCgpJZiBpdCB3b3JrLCBJIGRv
bid0IG9iamVjdCB0byB1c2UgdGhhdCBjb25zaWRlciBpdCB3YXMgc3VnZ2VzdGVkIGJ5IApNaWNo
YWVsLiBZb3UgY2FuIGdvIHRoaXMgd2F5IGFuZCBsZXQncyBzZWUuCgpQZXJzb25hbGx5IEkgd291
bGQgbGlrZSBzb21ldGhpbmcgbW9yZSBjbGVhbmVyLiBFLmcgUkNVICsgc29tZSBraW5kIG9mIApy
ZWZlcmVuY2UgY291bnQgKGtyZWY/KS4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
