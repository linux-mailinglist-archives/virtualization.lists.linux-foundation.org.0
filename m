Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C53AF992
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 11:54:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B4DDA1B26;
	Wed, 11 Sep 2019 09:54:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4F86A1AF1
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:54:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DD97282B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 09:54:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40E9D11A27;
	Wed, 11 Sep 2019 09:54:04 +0000 (UTC)
Received: from [10.72.12.57] (ovpn-12-57.pek2.redhat.com [10.72.12.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54F636012A;
	Wed, 11 Sep 2019 09:53:50 +0000 (UTC)
Subject: Re: [RFC PATCH 3/4] virtio: introudce a mdev based transport
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-4-jasowang@redhat.com>
	<20190910055744-mutt-send-email-mst@kernel.org>
	<572ffc34-3081-8503-d3cc-192edc9b5311@redhat.com>
	<20190910094807-mutt-send-email-mst@kernel.org>
	<390647ae-0a53-5f2b-ccb0-28ed657636e6@redhat.com>
	<20190911053502-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <27fa6786-6e00-a7d3-bd35-7c302514c1b5@redhat.com>
Date: Wed, 11 Sep 2019 17:53:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911053502-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 11 Sep 2019 09:54:04 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, cohuck@redhat.com,
	linux-kernel@vger.kernel.org, kwankhede@nvidia.com,
	xiao.w.wang@intel.com, zhihong.wang@intel.com, maxime.coquelin@redhat.com,
	virtualization@lists.linux-foundation.org,
	haotian.wang@sifive.com, idos@mellanox.com, rob.miller@broadcom.com
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

Ck9uIDIwMTkvOS8xMSDkuIvljYg1OjM2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBTZXAgMTEsIDIwMTkgYXQgMTA6Mzg6MzlBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85LzEwIOS4i+WNiDk6NTIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IE9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDA5OjEzOjAyUE0gKzA4MDAsIEphc29uIFdhbmcgd3Jv
dGU6Cj4+Pj4gT24gMjAxOS85LzEwIOS4i+WNiDY6MDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPj4+Pj4+ICsjaWZuZGVmIF9MSU5VWF9WSVJUSU9fTURFVl9ICj4+Pj4+PiArI2RlZmluZSBf
TElOVVhfVklSVElPX01ERVZfSAo+Pj4+Pj4gKwo+Pj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9pbnRl
cnJ1cHQuaD4KPj4+Pj4+ICsjaW5jbHVkZSA8bGludXgvdnJpbmdoLmg+Cj4+Pj4+PiArI2luY2x1
ZGUgPHVhcGkvbGludXgvdmlydGlvX25ldC5oPgo+Pj4+Pj4gKwo+Pj4+Pj4gKy8qCj4+Pj4+PiAr
ICogSW9jdGxzCj4+Pj4+PiArICovCj4+Pj4+IFBscyBhZGQgYSBiaXQgbW9yZSBjb250ZW50IGhl
cmUuIEl0J3MgcmVkdW5kYW50IHRvIHN0YXRlIHRoZXNlCj4+Pj4+IGFyZSBpb2N0bHMuIE11Y2gg
YmV0dGVyIHRvIGRvY3VtZW50IHdoYXQgZG9lcyBlYWNoIG9uZSBkby4KPj4+PiBPay4KPj4+Pgo+
Pj4+Cj4+Pj4+PiArCj4+Pj4+PiArc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIHsKPj4+Pj4+
ICsJaXJxcmV0dXJuX3QgKCpjYWxsYmFjaykodm9pZCAqKTsKPj4+Pj4+ICsJdm9pZCAqcHJpdmF0
ZTsKPj4+Pj4+ICt9Owo+Pj4+Pj4gKwo+Pj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVYgMHhBRgo+
Pj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZfU0VUX1ZRX0NBTExCQUNLIF9JT1coVklSVElPX01E
RVYsIDB4MDAsIFwKPj4+Pj4+ICsJCQkJCSBzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2spCj4+
Pj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9TRVRfQ09ORklHX0NBTExCQUNLIF9JT1coVklSVElP
X01ERVYsIDB4MDEsIFwKPj4+Pj4+ICsJCQkJCXN0cnVjdCB2aXJ0aW9fbWRldl9jYWxsYmFjaykK
Pj4+Pj4gRnVuY3Rpb24gcG9pbnRlciBpbiBhbiBpb2N0bCBwYXJhbWV0ZXI/IEhvdyBkb2VzIHRo
aXMgZXZlciBtYWtlIHNlbnNlPwo+Pj4+IEkgYWRtaXQgdGhpcyBpcyBoYWNreSAoY2FzdGluZyku
Cj4+Pj4KPj4+Pgo+Pj4+PiBBbmQgY2FuJ3Qgd2UgdXNlIGEgY291cGxlIG9mIHJlZ2lzdGVycyBm
b3IgdGhpcywgYW5kIGF2b2lkIGlvY3Rscz8KPj4+PiBZZXMsIGhvdyBhYm91dCBzb21ldGhpbmcg
bGlrZSBpbnRlcnJ1cHQgbnVtYmVycyBmb3IgZWFjaCB2aXJ0cXVldWUgYW5kCj4+Pj4gY29uZmln
Pwo+Pj4gU2hvdWxkIHdlIGp1c3QgcmV1c2UgVklSVElPX1BDSV9DT01NT05fUV9YWFggdGhlbj8K
Pj4KPj4gWW91IG1lYW4gc29tZXRoaW5nIGxpa2UgVklSVElPX1BDSV9DT01NT05fUV9NU0lYPyBU
aGVuIGl0IGJlY29tZXMgYSBQQ0kKPj4gdHJhbnNwb3J0IGluIGZhY3QuIEFuZCB1c2luZyBlaXRo
ZXIgTVNJWCBvciBpcnEgbnVtYmVyIGlzIGFjdHVhbGx5IGFub3RoZXIKPj4gbGF5ZXIgb2YgaW5k
aXJlY3Rpb24uIFNvIEkgdGhpbmsgd2UgY2FuIGp1c3Qgd3JpdGUgY2FsbGJhY2sgZnVuY3Rpb24g
YW5kCj4+IHBhcmFtZXRlciB0aHJvdWdoIHJlZ2lzdGVycy4KPiBJIGp1c3QgcmVhbGl6ZWQsIGFs
bCB0aGVzZSByZWdpc3RlcnMgYXJlIGp1c3QgZW5jb2RlZCBzbyB5b3UKPiBjYW4gcGFzcyBzdHVm
ZiB0aHJvdWdoIHJlYWQvd3JpdGUuIEJ1dCBpdCBjYW4gaW5zdGVhZCBiZQo+IGp1c3QgYSBub3Jt
YWwgQyBmdW5jdGlvbiBjYWxsIHdpdGggbm8gbWVzc3kgZW5jb2RpbmcuCj4gU28gd2h5IGRvIHdl
IHdhbnQgdG8gZG8gdGhpcyBlbmNvZGluZz8KCgpKdXN0IGJlY2F1c2UgaXQgd2FzIGVhc2llciB0
byBzdGFydCBhcyBhIFBPQyBzaW5jZSBtZGV2X3BhcmVudF9vcHMgaXMgCnRoZSBvbmx5IHdheSB0
byBjb21tdW5pY2F0ZSBiZXR3ZWVuIG1kZXYgZHJpdmVyIGFuZCBtZGV2IGRldmljZSByaWdodCAK
bm93LiBXZSBjYW4gaW52ZW50IHByaXZhdGUgb3BzIGJlc2lkZXMgbWRldl9wYXJlbnRfb3BzLCBl
LmcgYSBwcml2YXRlIApwb2ludGVyIGluIG1kZXZfcGFyZW50X29wcy4gSSBjYW4gdHJ5IHRoaXMg
aW4gbmV4dCB2ZXJzaW9uLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
