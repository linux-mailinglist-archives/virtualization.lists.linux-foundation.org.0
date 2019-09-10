Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 84165AEB36
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 15:13:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA450D9F;
	Tue, 10 Sep 2019 13:13:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9BF20D83
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 13:13:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 29DC28A2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 13:13:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B5FB300DA3A;
	Tue, 10 Sep 2019 13:13:16 +0000 (UTC)
Received: from [10.72.12.23] (ovpn-12-23.pek2.redhat.com [10.72.12.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B145A6012A;
	Tue, 10 Sep 2019 13:13:01 +0000 (UTC)
Subject: Re: [RFC PATCH 3/4] virtio: introudce a mdev based transport
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190910081935.30516-1-jasowang@redhat.com>
	<20190910081935.30516-4-jasowang@redhat.com>
	<20190910055744-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <572ffc34-3081-8503-d3cc-192edc9b5311@redhat.com>
Date: Tue, 10 Sep 2019 21:13:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190910055744-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 10 Sep 2019 13:13:16 +0000 (UTC)
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

Ck9uIDIwMTkvOS8xMCDkuIvljYg2OjAxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+ICsj
aWZuZGVmIF9MSU5VWF9WSVJUSU9fTURFVl9ICj4+ICsjZGVmaW5lIF9MSU5VWF9WSVJUSU9fTURF
Vl9ICj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPj4gKyNpbmNsdWRlIDxs
aW51eC92cmluZ2guaD4KPj4gKyNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19uZXQuaD4KPj4g
Kwo+PiArLyoKPj4gKyAqIElvY3Rscwo+PiArICovCj4gUGxzIGFkZCBhIGJpdCBtb3JlIGNvbnRl
bnQgaGVyZS4gSXQncyByZWR1bmRhbnQgdG8gc3RhdGUgdGhlc2UKPiBhcmUgaW9jdGxzLiBNdWNo
IGJldHRlciB0byBkb2N1bWVudCB3aGF0IGRvZXMgZWFjaCBvbmUgZG8uCgoKT2suCgoKPgo+PiAr
Cj4+ICtzdHJ1Y3QgdmlydGlvX21kZXZfY2FsbGJhY2sgewo+PiArCWlycXJldHVybl90ICgqY2Fs
bGJhY2spKHZvaWQgKik7Cj4+ICsJdm9pZCAqcHJpdmF0ZTsKPj4gK307Cj4+ICsKPj4gKyNkZWZp
bmUgVklSVElPX01ERVYgMHhBRgo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9TRVRfVlFfQ0FMTEJB
Q0sgX0lPVyhWSVJUSU9fTURFViwgMHgwMCwgXAo+PiArCQkJCQkgc3RydWN0IHZpcnRpb19tZGV2
X2NhbGxiYWNrKQo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9TRVRfQ09ORklHX0NBTExCQUNLIF9J
T1coVklSVElPX01ERVYsIDB4MDEsIFwKPj4gKwkJCQkJc3RydWN0IHZpcnRpb19tZGV2X2NhbGxi
YWNrKQo+IEZ1bmN0aW9uIHBvaW50ZXIgaW4gYW4gaW9jdGwgcGFyYW1ldGVyPyBIb3cgZG9lcyB0
aGlzIGV2ZXIgbWFrZSBzZW5zZT8KCgpJIGFkbWl0IHRoaXMgaXMgaGFja3kgKGNhc3RpbmcpLgoK
Cj4gQW5kIGNhbid0IHdlIHVzZSBhIGNvdXBsZSBvZiByZWdpc3RlcnMgZm9yIHRoaXMsIGFuZCBh
dm9pZCBpb2N0bHM/CgoKWWVzLCBob3cgYWJvdXQgc29tZXRoaW5nIGxpa2UgaW50ZXJydXB0IG51
bWJlcnMgZm9yIGVhY2ggdmlydHF1ZXVlIGFuZCAKY29uZmlnPwoKCj4KPj4gKwo+PiArI2RlZmlu
ZSBWSVJUSU9fTURFVl9ERVZJQ0VfQVBJX1NUUklORwkJInZpcnRpby1tZGV2Igo+PiArCj4+ICsv
Kgo+PiArICogQ29udHJvbCByZWdpc3RlcnMKPj4gKyAqLwo+PiArCj4+ICsvKiBNYWdpYyB2YWx1
ZSAoInZpcnQiIHN0cmluZykgLSBSZWFkIE9ubHkgKi8KPj4gKyNkZWZpbmUgVklSVElPX01ERVZf
TUFHSUNfVkFMVUUJCTB4MDAwCj4+ICsKPj4gKy8qIFZpcnRpbyBkZXZpY2UgdmVyc2lvbiAtIFJl
YWQgT25seSAqLwo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9WRVJTSU9OCQkweDAwNAo+PiArCj4+
ICsvKiBWaXJ0aW8gZGV2aWNlIElEIC0gUmVhZCBPbmx5ICovCj4+ICsjZGVmaW5lIFZJUlRJT19N
REVWX0RFVklDRV9JRAkJMHgwMDgKPj4gKwo+PiArLyogVmlydGlvIHZlbmRvciBJRCAtIFJlYWQg
T25seSAqLwo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9WRU5ET1JfSUQJCTB4MDBjCj4+ICsKPj4g
Ky8qIEJpdG1hc2sgb2YgdGhlIGZlYXR1cmVzIHN1cHBvcnRlZCBieSB0aGUgZGV2aWNlIChob3N0
KQo+PiArICogKDMyIGJpdHMgcGVyIHNldCkgLSBSZWFkIE9ubHkgKi8KPj4gKyNkZWZpbmUgVklS
VElPX01ERVZfREVWSUNFX0ZFQVRVUkVTCTB4MDEwCj4+ICsKPj4gKy8qIERldmljZSAoaG9zdCkg
ZmVhdHVyZXMgc2V0IHNlbGVjdG9yIC0gV3JpdGUgT25seSAqLwo+PiArI2RlZmluZSBWSVJUSU9f
TURFVl9ERVZJQ0VfRkVBVFVSRVNfU0VMCTB4MDE0Cj4+ICsKPj4gKy8qIEJpdG1hc2sgb2YgZmVh
dHVyZXMgYWN0aXZhdGVkIGJ5IHRoZSBkcml2ZXIgKGd1ZXN0KQo+PiArICogKDMyIGJpdHMgcGVy
IHNldCkgLSBXcml0ZSBPbmx5ICovCj4+ICsjZGVmaW5lIFZJUlRJT19NREVWX0RSSVZFUl9GRUFU
VVJFUwkweDAyMAo+PiArCj4+ICsvKiBBY3RpdmF0ZWQgZmVhdHVyZXMgc2V0IHNlbGVjdG9yIC0g
V3JpdGUgT25seSAqLwo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9EUklWRVJfRkVBVFVSRVNfU0VM
CTB4MDI0Cj4+ICsKPj4gKy8qIFF1ZXVlIHNlbGVjdG9yIC0gV3JpdGUgT25seSAqLwo+PiArI2Rl
ZmluZSBWSVJUSU9fTURFVl9RVUVVRV9TRUwJCTB4MDMwCj4+ICsKPj4gKy8qIE1heGltdW0gc2l6
ZSBvZiB0aGUgY3VycmVudGx5IHNlbGVjdGVkIHF1ZXVlIC0gUmVhZCBPbmx5ICovCj4+ICsjZGVm
aW5lIFZJUlRJT19NREVWX1FVRVVFX05VTV9NQVgJMHgwMzQKPj4gKwo+PiArLyogUXVldWUgc2l6
ZSBmb3IgdGhlIGN1cnJlbnRseSBzZWxlY3RlZCBxdWV1ZSAtIFdyaXRlIE9ubHkgKi8KPj4gKyNk
ZWZpbmUgVklSVElPX01ERVZfUVVFVUVfTlVNCQkweDAzOAo+PiArCj4+ICsvKiBSZWFkeSBiaXQg
Zm9yIHRoZSBjdXJyZW50bHkgc2VsZWN0ZWQgcXVldWUgLSBSZWFkIFdyaXRlICovCj4+ICsjZGVm
aW5lIFZJUlRJT19NREVWX1FVRVVFX1JFQURZCQkweDA0NAo+IElzIHRoaXMgc2FtZSBhcyBzdGFy
dGVkPwoKCkRvIHlvdSBtZWFuICJzdGF0dXMiPwoKCj4KPj4gKwo+PiArLyogQWxpZ25tZW50IG9m
IHZpcnRxdWV1ZSAtIFJlYWQgT25seSAqLwo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9B
TElHTgkJMHgwNDgKPj4gKwo+PiArLyogUXVldWUgbm90aWZpZXIgLSBXcml0ZSBPbmx5ICovCj4+
ICsjZGVmaW5lIFZJUlRJT19NREVWX1FVRVVFX05PVElGWQkweDA1MAo+PiArCj4+ICsvKiBEZXZp
Y2Ugc3RhdHVzIHJlZ2lzdGVyIC0gUmVhZCBXcml0ZSAqLwo+PiArI2RlZmluZSBWSVJUSU9fTURF
Vl9TVEFUVVMJCTB4MDYwCj4+ICsKPj4gKy8qIFNlbGVjdGVkIHF1ZXVlJ3MgRGVzY3JpcHRvciBU
YWJsZSBhZGRyZXNzLCA2NCBiaXRzIGluIHR3byBoYWx2ZXMgKi8KPj4gKyNkZWZpbmUgVklSVElP
X01ERVZfUVVFVUVfREVTQ19MT1cJMHgwODAKPj4gKyNkZWZpbmUgVklSVElPX01ERVZfUVVFVUVf
REVTQ19ISUdICTB4MDg0Cj4+ICsKPj4gKy8qIFNlbGVjdGVkIHF1ZXVlJ3MgQXZhaWxhYmxlIFJp
bmcgYWRkcmVzcywgNjQgYml0cyBpbiB0d28gaGFsdmVzICovCj4+ICsjZGVmaW5lIFZJUlRJT19N
REVWX1FVRVVFX0FWQUlMX0xPVwkweDA5MAo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9B
VkFJTF9ISUdICTB4MDk0Cj4+ICsKPj4gKy8qIFNlbGVjdGVkIHF1ZXVlJ3MgVXNlZCBSaW5nIGFk
ZHJlc3MsIDY0IGJpdHMgaW4gdHdvIGhhbHZlcyAqLwo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9R
VUVVRV9VU0VEX0xPVwkweDBhMAo+PiArI2RlZmluZSBWSVJUSU9fTURFVl9RVUVVRV9VU0VEX0hJ
R0gJMHgwYTQKPj4gKwo+PiArLyogQ29uZmlndXJhdGlvbiBhdG9taWNpdHkgdmFsdWUgKi8KPj4g
KyNkZWZpbmUgVklSVElPX01ERVZfQ09ORklHX0dFTkVSQVRJT04JMHgwZmMKPj4gKwo+PiArLyog
VGhlIGNvbmZpZyBzcGFjZSBpcyBkZWZpbmVkIGJ5IGVhY2ggZHJpdmVyIGFzCj4+ICsgKiB0aGUg
cGVyLWRyaXZlciBjb25maWd1cmF0aW9uIHNwYWNlIC0gUmVhZCBXcml0ZSAqLwo+PiArI2RlZmlu
ZSBWSVJUSU9fTURFVl9DT05GSUcJCTB4MTAwCj4gTWl4aW5nIGRldmljZSBhbmQgZ2VuZXJpYyBj
b25maWcgc3BhY2UgaXMgd2hhdCB2aXJ0aW8gcGNpIGRpZCwKPiBjYXVzZWQgbG90cyBvZiBwcm9i
bGVtcyB3aXRoIGV4dGVuc2lvbnMuCj4gSXQgd291bGQgYmUgYmV0dGVyIHRvIHJlc2VydmUgbXVj
aCBtb3JlIHNwYWNlLgoKCkkgc2VlLCB3aWxsIGRvIHRoaXMuCgpUaGFua3MKCgo+Cj4KPj4gKwo+
PiArI2VuZGlmCj4+ICsKPj4gKwo+PiArLyogUmVhZHkgYml0IGZvciB0aGUgY3VycmVudGx5IHNl
bGVjdGVkIHF1ZXVlIC0gUmVhZCBXcml0ZSAqLwo+PiAtLSAKPj4gMi4xOS4xCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
