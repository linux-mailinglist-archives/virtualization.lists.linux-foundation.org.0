Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FA30C34
	for <lists.virtualization@lfdr.de>; Fri, 31 May 2019 11:57:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C6E51F8C;
	Fri, 31 May 2019 09:57:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 14C1AF82
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 09:56:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8CA84821
	for <virtualization@lists.linux-foundation.org>;
	Fri, 31 May 2019 09:56:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C24539FFDA;
	Fri, 31 May 2019 09:56:48 +0000 (UTC)
Received: from [10.72.12.182] (ovpn-12-182.pek2.redhat.com [10.72.12.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2743A5DA34;
	Fri, 31 May 2019 09:56:40 +0000 (UTC)
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
From: Jason Wang <jasowang@redhat.com>
Message-ID: <dbc9964c-65b1-0993-488b-cb44aea55e90@redhat.com>
Date: Fri, 31 May 2019 17:56:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190531081824.p6ylsgvkrbckhqpx@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 31 May 2019 09:56:49 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
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

Ck9uIDIwMTkvNS8zMSDkuIvljYg0OjE4LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gT24g
VGh1LCBNYXkgMzAsIDIwMTkgYXQgMDc6NTk6MTRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS81LzMwIOS4i+WNiDY6MTAsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90ZToKPj4+
IE9uIFRodSwgTWF5IDMwLCAyMDE5IGF0IDA1OjQ2OjE4UE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS81LzI5IOS4i+WNiDY6NTgsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90
ZToKPj4+Pj4gT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMTE6MjI6NDBBTSArMDgwMCwgSmFzb24g
V2FuZyB3cm90ZToKPj4+Pj4+IE9uIDIwMTkvNS8yOCDkuIvljYg2OjU2LCBTdGVmYW5vIEdhcnph
cmVsbGEgd3JvdGU6Cj4+Pj4+Pj4gQEAgLTY5MCw2ICs2OTMsOSBAQCBzdGF0aWMgdm9pZCB2aXJ0
aW9fdnNvY2tfcmVtb3ZlKHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2KQo+Pj4+Pj4+ICAgICAg
CXZzb2NrLT5ldmVudF9ydW4gPSBmYWxzZTsKPj4+Pj4+PiAgICAgIAltdXRleF91bmxvY2soJnZz
b2NrLT5ldmVudF9sb2NrKTsKPj4+Pj4+PiArCS8qIEZsdXNoIGFsbCBwZW5kaW5nIHdvcmtzICov
Cj4+Pj4+Pj4gKwl2aXJ0aW9fdnNvY2tfZmx1c2hfd29ya3ModnNvY2spOwo+Pj4+Pj4+ICsKPj4+
Pj4+PiAgICAgIAkvKiBGbHVzaCBhbGwgZGV2aWNlIHdyaXRlcyBhbmQgaW50ZXJydXB0cywgZGV2
aWNlIHdpbGwgbm90IHVzZSBhbnkKPj4+Pj4+PiAgICAgIAkgKiBtb3JlIGJ1ZmZlcnMuCj4+Pj4+
Pj4gICAgICAJICovCj4+Pj4+Pj4gQEAgLTcyNiw2ICs3MzIsMTEgQEAgc3RhdGljIHZvaWQgdmly
dGlvX3Zzb2NrX3JlbW92ZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPj4+Pj4+PiAgICAg
IAkvKiBEZWxldGUgdmlydHF1ZXVlcyBhbmQgZmx1c2ggb3V0c3RhbmRpbmcgY2FsbGJhY2tzIGlm
IGFueSAqLwo+Pj4+Pj4+ICAgICAgCXZkZXYtPmNvbmZpZy0+ZGVsX3Zxcyh2ZGV2KTsKPj4+Pj4+
PiArCS8qIE90aGVyIHdvcmtzIGNhbiBiZSBxdWV1ZWQgYmVmb3JlICdjb25maWctPmRlbF92cXMo
KScsIHNvIHdlIGZsdXNoCj4+Pj4+Pj4gKwkgKiBhbGwgd29ya3MgYmVmb3JlIHRvIGZyZWUgdGhl
IHZzb2NrIG9iamVjdCB0byBhdm9pZCB1c2UgYWZ0ZXIgZnJlZS4KPj4+Pj4+PiArCSAqLwo+Pj4+
Pj4+ICsJdmlydGlvX3Zzb2NrX2ZsdXNoX3dvcmtzKHZzb2NrKTsKPj4+Pj4+IFNvbWUgcXVlc3Rp
b25zIGFmdGVyIGEgcXVpY2sgZ2xhbmNlOgo+Pj4+Pj4KPj4+Pj4+IDEpIEl0IGxvb2tzIHRvIG1l
IHRoYXQgdGhlIHdvcmsgY291bGQgYmUgcXVldWVkIGZyb20gdGhlIHBhdGggb2YKPj4+Pj4+IHZz
b2NrX3RyYW5zcG9ydF9jYW5jZWxfcGt0KCkgLiBJcyB0aGF0IHN5bmNocm9uaXplZCBoZXJlPwo+
Pj4+Pj4KPj4+Pj4gQm90aCB2aXJ0aW9fdHJhbnNwb3J0X3NlbmRfcGt0KCkgYW5kIHZzb2NrX3Ry
YW5zcG9ydF9jYW5jZWxfcGt0KCkgY2FuCj4+Pj4+IHF1ZXVlIHdvcmsgZnJvbSB0aGUgdXBwZXIg
bGF5ZXIgKHNvY2tldCkuCj4+Pj4+Cj4+Pj4+IFNldHRpbmcgdGhlX3ZpcnRpb192c29jayB0byBO
VUxMLCBzaG91bGQgc3luY2hyb25pemUsIGJ1dCBhZnRlciBhIGNhcmVmdWwgbG9vawo+Pj4+PiBh
IHJhcmUgaXNzdWUgY291bGQgaGFwcGVuOgo+Pj4+PiB3ZSBhcmUgc2V0dGluZyB0aGVfdmlydGlv
X3Zzb2NrIHRvIE5VTEwgYXQgdGhlIHN0YXJ0IG9mIC5yZW1vdmUoKSBhbmQgd2UKPj4+Pj4gYXJl
IGZyZWVpbmcgdGhlIG9iamVjdCBwb2ludGVkIGJ5IGl0IGF0IHRoZSBlbmQgb2YgLnJlbW92ZSgp
LCBzbwo+Pj4+PiB2aXJ0aW9fdHJhbnNwb3J0X3NlbmRfcGt0KCkgb3IgdnNvY2tfdHJhbnNwb3J0
X2NhbmNlbF9wa3QoKSBtYXkgc3RpbGwgYmUKPj4+Pj4gcnVubmluZywgYWNjZXNzaW5nIHRoZSBv
YmplY3QgdGhhdCB3ZSBhcmUgZnJlZWQuCj4+Pj4gWWVzLCB0aGF0J3MgbXkgcG9pbnQuCj4+Pj4K
Pj4+Pgo+Pj4+PiBTaG91bGQgSSB1c2Ugc29tZXRoaW5nIGxpa2UgUkNVIHRvIHByZXZlbnQgdGhp
cyBpc3N1ZT8KPj4+Pj4KPj4+Pj4gICAgICAgIHZpcnRpb190cmFuc3BvcnRfc2VuZF9wa3QoKSBh
bmQgdnNvY2tfdHJhbnNwb3J0X2NhbmNlbF9wa3QoKQo+Pj4+PiAgICAgICAgewo+Pj4+PiAgICAg
ICAgICAgIHJjdV9yZWFkX2xvY2soKTsKPj4+Pj4gICAgICAgICAgICB2c29jayA9IHJjdV9kZXJl
ZmVyZW5jZSh0aGVfdmlydGlvX3Zzb2NrX211dGV4KTsKPj4+PiBSQ1UgaXMgcHJvYmFibHkgYSB3
YXkgdG8gZ28uIChMaWtlIHdoYXQgdmhvc3RfdHJhbnNwb3J0X3NlbmRfcGt0KCkgZGlkKS4KPj4+
Pgo+Pj4gT2theSwgSSdtIGdvaW5nIHRoaXMgd2F5Lgo+Pj4KPj4+Pj4gICAgICAgICAgICAuLi4K
Pj4+Pj4gICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPj4+Pj4gICAgICAgIH0KPj4+Pj4K
Pj4+Pj4gICAgICAgIHZpcnRpb192c29ja19yZW1vdmUoKQo+Pj4+PiAgICAgICAgewo+Pj4+PiAg
ICAgICAgICAgIHJjdV9hc3NpZ25fcG9pbnRlcih0aGVfdmlydGlvX3Zzb2NrX211dGV4LCBOVUxM
KTsKPj4+Pj4gICAgICAgICAgICBzeW5jaHJvbml6ZV9yY3UoKTsKPj4+Pj4KPj4+Pj4gICAgICAg
ICAgICAuLi4KPj4+Pj4KPj4+Pj4gICAgICAgICAgICBmcmVlKHZzb2NrKTsKPj4+Pj4gICAgICAg
IH0KPj4+Pj4KPj4+Pj4gQ291bGQgdGhlcmUgYmUgYSBiZXR0ZXIgYXBwcm9hY2g/Cj4+Pj4+Cj4+
Pj4+Cj4+Pj4+PiAyKSBJZiB3ZSBkZWNpZGUgdG8gZmx1c2ggYWZ0ZXIgZGV2X3ZxcygpLCBpcyB0
eF9ydW4vcnhfcnVuL2V2ZW50X3J1biBzdGlsbAo+Pj4+Pj4gbmVlZGVkPyBJdCBsb29rcyB0byBt
ZSB3ZSd2ZSBhbHJlYWR5IGRvbmUgZXhjZXB0IHRoYXQgd2UgbmVlZCBmbHVzaCByeF93b3JrCj4+
Pj4+PiBpbiB0aGUgZW5kIHNpbmNlIHNlbmRfcGt0X3dvcmsgY2FuIHJlcXVldWUgcnhfd29yay4K
Pj4+Pj4gVGhlIG1haW4gcmVhc29uIG9mIHR4X3J1bi9yeF9ydW4vZXZlbnRfcnVuIGlzIHRvIHBy
ZXZlbnQgdGhhdCBhIHdvcmtlcgo+Pj4+PiBmdW5jdGlvbiBpcyBydW5uaW5nIHdoaWxlIHdlIGFy
ZSBjYWxsaW5nIGNvbmZpZy0+cmVzZXQoKS4KPj4+Pj4KPj4+Pj4gRS5nLiBpZiBhbiBpbnRlcnJ1
cHQgY29tZXMgYmV0d2VlbiB2aXJ0aW9fdnNvY2tfZmx1c2hfd29ya3MoKSBhbmQKPj4+Pj4gY29u
ZmlnLT5yZXNldCgpLCBpdCBjYW4gcXVldWUgbmV3IHdvcmtzIHRoYXQgY2FuIGFjY2VzcyB0aGUg
ZGV2aWNlIHdoaWxlCj4+Pj4+IHdlIGFyZSBpbiBjb25maWctPnJlc2V0KCkuCj4+Pj4+Cj4+Pj4+
IElNSE8gdGhleSBhcmUgc3RpbGwgbmVlZGVkLgo+Pj4+Pgo+Pj4+PiBXaGF0IGRvIHlvdSB0aGlu
az8KPj4+PiBJIG1lYW4gY291bGQgd2Ugc2ltcGx5IGRvIGZsdXNoIGFmdGVyIHJlc2V0IG9uY2Ug
YW5kIHdpdGhvdXQgdHhfcngvcnhfcnVuCj4+Pj4gdHJpY2tzPwo+Pj4+Cj4+Pj4gcmVzdCgpOwo+
Pj4+Cj4+Pj4gdmlydGlvX3Zzb2NrX2ZsdXNoX3dvcmsoKTsKPj4+Pgo+Pj4+IHZpcnRpb192c29j
a19mcmVlX2J1ZigpOwo+Pj4gTXkgb25seSBkb3VidCBpczoKPj4+IGlzIGl0IHNhZmUgdG8gY2Fs
bCBjb25maWctPnJlc2V0KCkgd2hpbGUgYSB3b3JrZXIgZnVuY3Rpb24gY291bGQgYWNjZXNzCj4+
PiB0aGUgZGV2aWNlPwo+Pj4KPj4+IEkgaGFkIHRoaXMgZG91YnQgcmVhZGluZyB0aGUgTWljaGFl
bCdzIGFkdmljZVsxXSBhbmQgbG9va2luZyBhdAo+Pj4gdmlydG5ldF9yZW1vdmUoKSB3aGVyZSB0
aGVyZSBhcmUgdGhlc2UgbGluZXMgYmVmb3JlIHRoZSBjb25maWctPnJlc2V0KCk6Cj4+Pgo+Pj4g
CS8qIE1ha2Ugc3VyZSBubyB3b3JrIGhhbmRsZXIgaXMgYWNjZXNzaW5nIHRoZSBkZXZpY2UuICov
Cj4+PiAJZmx1c2hfd29yaygmdmktPmNvbmZpZ193b3JrKTsKPj4+Cj4+PiBUaGFua3MsCj4+PiBT
dGVmYW5vCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8yMDE5MDUy
MTA1NTY1MC1tdXR0LXNlbmQtZW1haWwtbXN0QGtlcm5lbC5vcmcKPj4KPj4gR29vZCBwb2ludC4g
VGhlbiBJIGFncmVlIHdpdGggeW91LiBCdXQgaWYgd2UgY2FuIHVzZSB0aGUgUkNVIHRvIGRldGVj
dCB0aGUKPj4gZGV0YWNoIG9mIGRldmljZSBmcm9tIHNvY2tldCBmb3IgdGhlc2UsIGl0IHdvdWxk
IGJlIGV2ZW4gYmV0dGVyLgo+Pgo+IFdoYXQgYWJvdXQgY2hlY2tpbmcgJ3RoZV92aXJ0aW9fdnNv
Y2snIGluIHRoZSB3b3JrZXIgZnVuY3Rpb25zIGluIGEgUkNVCj4gY3JpdGljYWwgc2VjdGlvbj8K
PiBJbiB0aGlzIHdheSwgSSBjYW4gcmVtb3ZlIHRoZSByeF9ydW4vdHhfcnVuL2V2ZW50X3J1bi4K
Pgo+IERvIHlvdSB0aGluayBpdCdzIGNsZWFuZXI/CgoKWWVzLCBJIHRoaW5rIHNvLgoKVGhhbmtz
CgoKPgo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2gsCj4gU3RlZmFubwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QK
VmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5s
aW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
