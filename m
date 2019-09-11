Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 63488AF45D
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 04:39:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AD1FAB09;
	Wed, 11 Sep 2019 02:39:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F1070A95
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 02:39:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6D40382B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 02:39:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A76076543;
	Wed, 11 Sep 2019 02:38:59 +0000 (UTC)
Received: from [10.72.12.57] (ovpn-12-57.pek2.redhat.com [10.72.12.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6119C60BE1;
	Wed, 11 Sep 2019 02:38:41 +0000 (UTC)
Subject: Re: [RFC PATCH 3/4] virtio: introudce a mdev based transport
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-4-jasowang@redhat.com>
	<20190910055744-mutt-send-email-mst@kernel.org>
	<572ffc34-3081-8503-d3cc-192edc9b5311@redhat.com>
	<20190910094807-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <390647ae-0a53-5f2b-ccb0-28ed657636e6@redhat.com>
Date: Wed, 11 Sep 2019 10:38:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910094807-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 11 Sep 2019 02:38:59 +0000 (UTC)
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

Ck9uIDIwMTkvOS8xMCDkuIvljYg5OjUyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VHVlLCBTZXAgMTAsIDIwMTkgYXQgMDk6MTM6MDJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85LzEwIOS4i+WNiDY6MDEsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
PiArI2lmbmRlZiBfTElOVVhfVklSVElPX01ERVZfSAo+Pj4+ICsjZGVmaW5lIF9MSU5VWF9WSVJU
SU9fTURFVl9ICj4+Pj4gKwo+Pj4+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4+Pj4g
KyNpbmNsdWRlIDxsaW51eC92cmluZ2guaD4KPj4+PiArI2luY2x1ZGUgPHVhcGkvbGludXgvdmly
dGlvX25ldC5oPgo+Pj4+ICsKPj4+PiArLyoKPj4+PiArICogSW9jdGxzCj4+Pj4gKyAqLwo+Pj4g
UGxzIGFkZCBhIGJpdCBtb3JlIGNvbnRlbnQgaGVyZS4gSXQncyByZWR1bmRhbnQgdG8gc3RhdGUg
dGhlc2UKPj4+IGFyZSBpb2N0bHMuIE11Y2ggYmV0dGVyIHRvIGRvY3VtZW50IHdoYXQgZG9lcyBl
YWNoIG9uZSBkby4KPj4KPj4gT2suCj4+Cj4+Cj4+Pj4gKwo+Pj4+ICtzdHJ1Y3QgdmlydGlvX21k
ZXZfY2FsbGJhY2sgewo+Pj4+ICsJaXJxcmV0dXJuX3QgKCpjYWxsYmFjaykodm9pZCAqKTsKPj4+
PiArCXZvaWQgKnByaXZhdGU7Cj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICsjZGVmaW5lIFZJUlRJT19N
REVWIDB4QUYKPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9TRVRfVlFfQ0FMTEJBQ0sgX0lPVyhW
SVJUSU9fTURFViwgMHgwMCwgXAo+Pj4+ICsJCQkJCSBzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJh
Y2spCj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZfU0VUX0NPTkZJR19DQUxMQkFDSyBfSU9XKFZJ
UlRJT19NREVWLCAweDAxLCBcCj4+Pj4gKwkJCQkJc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNr
KQo+Pj4gRnVuY3Rpb24gcG9pbnRlciBpbiBhbiBpb2N0bCBwYXJhbWV0ZXI/IEhvdyBkb2VzIHRo
aXMgZXZlciBtYWtlIHNlbnNlPwo+Pgo+PiBJIGFkbWl0IHRoaXMgaXMgaGFja3kgKGNhc3Rpbmcp
Lgo+Pgo+Pgo+Pj4gQW5kIGNhbid0IHdlIHVzZSBhIGNvdXBsZSBvZiByZWdpc3RlcnMgZm9yIHRo
aXMsIGFuZCBhdm9pZCBpb2N0bHM/Cj4+Cj4+IFllcywgaG93IGFib3V0IHNvbWV0aGluZyBsaWtl
IGludGVycnVwdCBudW1iZXJzIGZvciBlYWNoIHZpcnRxdWV1ZSBhbmQKPj4gY29uZmlnPwo+IFNo
b3VsZCB3ZSBqdXN0IHJldXNlIFZJUlRJT19QQ0lfQ09NTU9OX1FfWFhYIHRoZW4/CgoKWW91IG1l
YW4gc29tZXRoaW5nIGxpa2UgVklSVElPX1BDSV9DT01NT05fUV9NU0lYPyBUaGVuIGl0IGJlY29t
ZXMgYSBQQ0kgCnRyYW5zcG9ydCBpbiBmYWN0LiBBbmQgdXNpbmcgZWl0aGVyIE1TSVggb3IgaXJx
IG51bWJlciBpcyBhY3R1YWxseSAKYW5vdGhlciBsYXllciBvZiBpbmRpcmVjdGlvbi4gU28gSSB0
aGluayB3ZSBjYW4ganVzdCB3cml0ZSBjYWxsYmFjayAKZnVuY3Rpb24gYW5kIHBhcmFtZXRlciB0
aHJvdWdoIHJlZ2lzdGVycy4KCgo+Cj4KPj4+PiArCj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZf
REVWSUNFX0FQSV9TVFJJTkcJCSJ2aXJ0aW8tbWRldiIKPj4+PiArCj4+Pj4gKy8qCj4+Pj4gKyAq
IENvbnRyb2wgcmVnaXN0ZXJzCj4+Pj4gKyAqLwo+Pj4+ICsKPj4+PiArLyogTWFnaWMgdmFsdWUg
KCJ2aXJ0IiBzdHJpbmcpIC0gUmVhZCBPbmx5ICovCj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZf
TUFHSUNfVkFMVUUJCTB4MDAwCj4+Pj4gKwo+Pj4+ICsvKiBWaXJ0aW8gZGV2aWNlIHZlcnNpb24g
LSBSZWFkIE9ubHkgKi8KPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9WRVJTSU9OCQkweDAwNAo+
Pj4+ICsKPj4+PiArLyogVmlydGlvIGRldmljZSBJRCAtIFJlYWQgT25seSAqLwo+Pj4+ICsjZGVm
aW5lIFZJUlRJT19NREVWX0RFVklDRV9JRAkJMHgwMDgKPj4+PiArCj4+Pj4gKy8qIFZpcnRpbyB2
ZW5kb3IgSUQgLSBSZWFkIE9ubHkgKi8KPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9WRU5ET1Jf
SUQJCTB4MDBjCj4+Pj4gKwo+Pj4+ICsvKiBCaXRtYXNrIG9mIHRoZSBmZWF0dXJlcyBzdXBwb3J0
ZWQgYnkgdGhlIGRldmljZSAoaG9zdCkKPj4+PiArICogKDMyIGJpdHMgcGVyIHNldCkgLSBSZWFk
IE9ubHkgKi8KPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9ERVZJQ0VfRkVBVFVSRVMJMHgwMTAK
Pj4+PiArCj4+Pj4gKy8qIERldmljZSAoaG9zdCkgZmVhdHVyZXMgc2V0IHNlbGVjdG9yIC0gV3Jp
dGUgT25seSAqLwo+Pj4+ICsjZGVmaW5lIFZJUlRJT19NREVWX0RFVklDRV9GRUFUVVJFU19TRUwJ
MHgwMTQKPj4+PiArCj4+Pj4gKy8qIEJpdG1hc2sgb2YgZmVhdHVyZXMgYWN0aXZhdGVkIGJ5IHRo
ZSBkcml2ZXIgKGd1ZXN0KQo+Pj4+ICsgKiAoMzIgYml0cyBwZXIgc2V0KSAtIFdyaXRlIE9ubHkg
Ki8KPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9EUklWRVJfRkVBVFVSRVMJMHgwMjAKPj4+PiAr
Cj4+Pj4gKy8qIEFjdGl2YXRlZCBmZWF0dXJlcyBzZXQgc2VsZWN0b3IgLSBXcml0ZSBPbmx5ICov
Cj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZfRFJJVkVSX0ZFQVRVUkVTX1NFTAkweDAyNAo+Pj4+
ICsKPj4+PiArLyogUXVldWUgc2VsZWN0b3IgLSBXcml0ZSBPbmx5ICovCj4+Pj4gKyNkZWZpbmUg
VklSVElPX01ERVZfUVVFVUVfU0VMCQkweDAzMAo+Pj4+ICsKPj4+PiArLyogTWF4aW11bSBzaXpl
IG9mIHRoZSBjdXJyZW50bHkgc2VsZWN0ZWQgcXVldWUgLSBSZWFkIE9ubHkgKi8KPj4+PiArI2Rl
ZmluZSBWSVJUSU9fTURFVl9RVUVVRV9OVU1fTUFYCTB4MDM0Cj4+Pj4gKwo+Pj4+ICsvKiBRdWV1
ZSBzaXplIGZvciB0aGUgY3VycmVudGx5IHNlbGVjdGVkIHF1ZXVlIC0gV3JpdGUgT25seSAqLwo+
Pj4+ICsjZGVmaW5lIFZJUlRJT19NREVWX1FVRVVFX05VTQkJMHgwMzgKPj4+PiArCj4+Pj4gKy8q
IFJlYWR5IGJpdCBmb3IgdGhlIGN1cnJlbnRseSBzZWxlY3RlZCBxdWV1ZSAtIFJlYWQgV3JpdGUg
Ki8KPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9SRUFEWQkJMHgwNDQKPj4+IElzIHRo
aXMgc2FtZSBhcyBzdGFydGVkPwo+Pgo+PiBEbyB5b3UgbWVhbiAic3RhdHVzIj8KPiBJIHJlYWxs
eSBtZWFudCAiZW5hYmxlZCIsIGRpZG4ndCByZW1lbWJlciB0aGUgY29ycmVjdCBuYW1lLgo+IEFz
IGluOiAgVklSVElPX1BDSV9DT01NT05fUV9FTkFCTEUKCgpZZXMsIGl0J3MgdGhlIHNhbWUuCgpU
aGFua3MKCgo+Cj4+Pj4gKwo+Pj4+ICsvKiBBbGlnbm1lbnQgb2YgdmlydHF1ZXVlIC0gUmVhZCBP
bmx5ICovCj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZfUVVFVUVfQUxJR04JCTB4MDQ4Cj4+Pj4g
Kwo+Pj4+ICsvKiBRdWV1ZSBub3RpZmllciAtIFdyaXRlIE9ubHkgKi8KPj4+PiArI2RlZmluZSBW
SVJUSU9fTURFVl9RVUVVRV9OT1RJRlkJMHgwNTAKPj4+PiArCj4+Pj4gKy8qIERldmljZSBzdGF0
dXMgcmVnaXN0ZXIgLSBSZWFkIFdyaXRlICovCj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZfU1RB
VFVTCQkweDA2MAo+Pj4+ICsKPj4+PiArLyogU2VsZWN0ZWQgcXVldWUncyBEZXNjcmlwdG9yIFRh
YmxlIGFkZHJlc3MsIDY0IGJpdHMgaW4gdHdvIGhhbHZlcyAqLwo+Pj4+ICsjZGVmaW5lIFZJUlRJ
T19NREVWX1FVRVVFX0RFU0NfTE9XCTB4MDgwCj4+Pj4gKyNkZWZpbmUgVklSVElPX01ERVZfUVVF
VUVfREVTQ19ISUdICTB4MDg0Cj4+Pj4gKwo+Pj4+ICsvKiBTZWxlY3RlZCBxdWV1ZSdzIEF2YWls
YWJsZSBSaW5nIGFkZHJlc3MsIDY0IGJpdHMgaW4gdHdvIGhhbHZlcyAqLwo+Pj4+ICsjZGVmaW5l
IFZJUlRJT19NREVWX1FVRVVFX0FWQUlMX0xPVwkweDA5MAo+Pj4+ICsjZGVmaW5lIFZJUlRJT19N
REVWX1FVRVVFX0FWQUlMX0hJR0gJMHgwOTQKPj4+PiArCj4+Pj4gKy8qIFNlbGVjdGVkIHF1ZXVl
J3MgVXNlZCBSaW5nIGFkZHJlc3MsIDY0IGJpdHMgaW4gdHdvIGhhbHZlcyAqLwo+Pj4+ICsjZGVm
aW5lIFZJUlRJT19NREVWX1FVRVVFX1VTRURfTE9XCTB4MGEwCj4+Pj4gKyNkZWZpbmUgVklSVElP
X01ERVZfUVVFVUVfVVNFRF9ISUdICTB4MGE0Cj4+Pj4gKwo+Pj4+ICsvKiBDb25maWd1cmF0aW9u
IGF0b21pY2l0eSB2YWx1ZSAqLwo+Pj4+ICsjZGVmaW5lIFZJUlRJT19NREVWX0NPTkZJR19HRU5F
UkFUSU9OCTB4MGZjCj4+Pj4gKwo+Pj4+ICsvKiBUaGUgY29uZmlnIHNwYWNlIGlzIGRlZmluZWQg
YnkgZWFjaCBkcml2ZXIgYXMKPj4+PiArICogdGhlIHBlci1kcml2ZXIgY29uZmlndXJhdGlvbiBz
cGFjZSAtIFJlYWQgV3JpdGUgKi8KPj4+PiArI2RlZmluZSBWSVJUSU9fTURFVl9DT05GSUcJCTB4
MTAwCj4+PiBNaXhpbmcgZGV2aWNlIGFuZCBnZW5lcmljIGNvbmZpZyBzcGFjZSBpcyB3aGF0IHZp
cnRpbyBwY2kgZGlkLAo+Pj4gY2F1c2VkIGxvdHMgb2YgcHJvYmxlbXMgd2l0aCBleHRlbnNpb25z
Lgo+Pj4gSXQgd291bGQgYmUgYmV0dGVyIHRvIHJlc2VydmUgbXVjaCBtb3JlIHNwYWNlLgo+Pgo+
PiBJIHNlZSwgd2lsbCBkbyB0aGlzLgo+Pgo+PiBUaGFua3MKPj4KPj4KPj4+Cj4+Pj4gKwo+Pj4+
ICsjZW5kaWYKPj4+PiArCj4+Pj4gKwo+Pj4+ICsvKiBSZWFkeSBiaXQgZm9yIHRoZSBjdXJyZW50
bHkgc2VsZWN0ZWQgcXVldWUgLSBSZWFkIFdyaXRlICovCj4+Pj4gLS0gCj4+Pj4gMi4xOS4xCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
