Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F145C0171
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 10:48:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 92395C4E;
	Fri, 27 Sep 2019 08:48:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 61CFFBBC
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:48:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BABBEB0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:48:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24E34300C72B;
	Fri, 27 Sep 2019 08:48:00 +0000 (UTC)
Received: from [10.72.12.30] (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1FD85D6A7;
	Fri, 27 Sep 2019 08:47:45 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: Tiwei Bie <tiwei.bie@intel.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<20190927045438.GA17152@___>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <05ab395e-6677-e8c3-becf-57bc1529921f@redhat.com>
Date: Fri, 27 Sep 2019 16:47:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927045438.GA17152@___>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 27 Sep 2019 08:48:00 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8yNyDkuIvljYgxMjo1NCwgVGl3ZWkgQmllIHdyb3RlOgo+IE9uIEZyaSwgU2Vw
IDI3LCAyMDE5IGF0IDExOjQ2OjA2QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+IE9uIDIw
MTkvOS8yNiDkuIvljYgxMjo1NCwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4gKwo+Pj4gK3N0YXRpYyBs
b25nIHZob3N0X21kZXZfc3RhcnQoc3RydWN0IHZob3N0X21kZXYgKm0pCj4+PiArewo+Pj4gKwlz
dHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYgPSBtLT5tZGV2Owo+Pj4gKwljb25zdCBzdHJ1Y3Qgdmly
dGlvX21kZXZfZGV2aWNlX29wcyAqb3BzID0gbWRldl9nZXRfZGV2X29wcyhtZGV2KTsKPj4+ICsJ
c3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIGNiOwo+Pj4gKwlzdHJ1Y3Qgdmhvc3RfdmlydHF1
ZXVlICp2cTsKPj4+ICsJaW50IGlkeDsKPj4+ICsKPj4+ICsJb3BzLT5zZXRfZmVhdHVyZXMobWRl
diwgbS0+YWNrZWRfZmVhdHVyZXMpOwo+Pj4gKwo+Pj4gKwltZGV2X2FkZF9zdGF0dXMobWRldiwg
VklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09LKTsKPj4+ICsJaWYgKCEobWRldl9nZXRfc3RhdHVz
KG1kZXYpICYgVklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09LKSkKPj4+ICsJCWdvdG8gcmVzZXQ7
Cj4+PiArCj4+PiArCWZvciAoaWR4ID0gMDsgaWR4IDwgbS0+bnZxczsgaWR4KyspIHsKPj4+ICsJ
CXZxID0gJm0tPnZxc1tpZHhdOwo+Pj4gKwo+Pj4gKwkJaWYgKCF2cS0+ZGVzYyB8fCAhdnEtPmF2
YWlsIHx8ICF2cS0+dXNlZCkKPj4+ICsJCQlicmVhazsKPj4+ICsKPj4+ICsJCWlmIChvcHMtPnNl
dF92cV9zdGF0ZShtZGV2LCBpZHgsIHZxLT5sYXN0X2F2YWlsX2lkeCkpCj4+PiArCQkJZ290byBy
ZXNldDsKPj4gSWYgd2UgZG8gc2V0X3ZxX3N0YXRlKCkgaW4gU0VUX1ZSSU5HX0JBU0UsIHdlIHdv
bid0IG5lZWQgdGhpcyBzdGVwIGhlcmUuCj4gWWVhaCwgSSBwbGFuIHRvIGRvIGl0IGluIHRoZSBu
ZXh0IHZlcnNpb24uCj4KPj4+ICsKPj4+ICsJCS8qCj4+PiArCQkgKiBJbiB2aG9zdC1tZGV2LCB1
c2Vyc3BhY2Ugc2hvdWxkIHBhc3MgcmluZyBhZGRyZXNzZXMKPj4+ICsJCSAqIGluIGd1ZXN0IHBo
eXNpY2FsIGFkZHJlc3NlcyB3aGVuIElPTU1VIGlzIGRpc2FibGVkIG9yCj4+PiArCQkgKiBJT1ZB
cyB3aGVuIElPTU1VIGlzIGVuYWJsZWQuCj4+PiArCQkgKi8KPj4gQSBxdWVzdGlvbiBoZXJlLCBj
b25zaWRlciB3ZSdyZSB1c2luZyBub2lvbW11IG1vZGUuIElmIGd1ZXN0IHBoeXNpY2FsCj4+IGFk
ZHJlc3MgaXMgcGFzc2VkIGhlcmUsIGhvdyBjYW4gYSBkZXZpY2UgdXNlIHRoYXQ/Cj4+Cj4+IEkg
YmVsaWV2ZSB5b3UgbWVhbnQgImhvc3QgcGh5c2ljYWwgYWRkcmVzcyIgaGVyZT8gQW5kIGl0IGFs
c28gaGF2ZSB0aGUKPj4gaW1wbGljYXRpb24gdGhhdCB0aGUgSFBBIHNob3VsZCBiZSBjb250aW51
b3VzIChlLmcgdXNpbmcgaHVnZXRsYmZzKS4KPiBUaGUgY29tbWVudCBpcyB0YWxraW5nIGFib3V0
IHRoZSB2aXJ0dWFsIElPTU1VIChpLmUuIGlvdGxiIGluIHZob3N0KS4KPiBJdCBzaG91bGQgYmUg
cmVwaHJhc2VkIHRvIGNvdmVyIHRoZSBub2lvbW11IGNhc2UgYXMgd2VsbC4gVGhhbmtzIGZvcgo+
IHNwb3R0aW5nIHRoaXMuCj4KPgo+Pj4gKwo+Pj4gKwlzd2l0Y2ggKGNtZCkgewo+Pj4gKwljYXNl
IFZIT1NUX01ERVZfU0VUX1NUQVRFOgo+Pj4gKwkJciA9IHZob3N0X3NldF9zdGF0ZShtLCBhcmdw
KTsKPj4+ICsJCWJyZWFrOwo+Pj4gKwljYXNlIFZIT1NUX0dFVF9GRUFUVVJFUzoKPj4+ICsJCXIg
PSB2aG9zdF9nZXRfZmVhdHVyZXMobSwgYXJncCk7Cj4+PiArCQlicmVhazsKPj4+ICsJY2FzZSBW
SE9TVF9TRVRfRkVBVFVSRVM6Cj4+PiArCQlyID0gdmhvc3Rfc2V0X2ZlYXR1cmVzKG0sIGFyZ3Ap
Owo+Pj4gKwkJYnJlYWs7Cj4+PiArCWNhc2UgVkhPU1RfR0VUX1ZSSU5HX0JBU0U6Cj4+PiArCQly
ID0gdmhvc3RfZ2V0X3ZyaW5nX2Jhc2UobSwgYXJncCk7Cj4+PiArCQlicmVhazsKPj4gRG9lcyBp
dCBtZWFuIHRoZSBTRVRfVlJJTkdfQkFTRSBtYXkgb25seSB0YWtlIGFmZmVjdCBhZnRlcgo+PiBW
SE9TVF9NRVZfU0VUX1NUQVRFPwo+IFllYWgsIGluIHRoaXMgdmVyc2lvbiwgU0VUX1ZSSU5HX0JB
U0Ugd29uJ3Qgc2V0IHRoZSBiYXNlIHRvIHRoZQo+IGRldmljZSBkaXJlY3RseS4gQnV0IEkgcGxh
biB0byBub3QgZGVsYXkgdGhpcyBhbnltb3JlIGluIHRoZSBuZXh0Cj4gdmVyc2lvbiB0byBzdXBw
b3J0IHRoZSBTRVRfU1RBVFVTLgo+Cj4+PiArCWRlZmF1bHQ6Cj4+PiArCQlyID0gdmhvc3RfZGV2
X2lvY3RsKCZtLT5kZXYsIGNtZCwgYXJncCk7Cj4+PiArCQlpZiAociA9PSAtRU5PSU9DVExDTUQp
Cj4+PiArCQkJciA9IHZob3N0X3ZyaW5nX2lvY3RsKCZtLT5kZXYsIGNtZCwgYXJncCk7Cj4+PiAr
CX0KPj4+ICsKPj4+ICsJbXV0ZXhfdW5sb2NrKCZtLT5tdXRleCk7Cj4+PiArCXJldHVybiByOwo+
Pj4gK30KPj4+ICsKPj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fZGV2aWNlX29wcyB2Zmlv
X3Zob3N0X21kZXZfZGV2X29wcyA9IHsKPj4+ICsJLm5hbWUJCT0gInZmaW8tdmhvc3QtbWRldiIs
Cj4+PiArCS5vcGVuCQk9IHZob3N0X21kZXZfb3BlbiwKPj4+ICsJLnJlbGVhc2UJPSB2aG9zdF9t
ZGV2X3JlbGVhc2UsCj4+PiArCS5pb2N0bAkJPSB2aG9zdF9tZGV2X3VubG9ja2VkX2lvY3RsLAo+
Pj4gK307Cj4+PiArCj4+PiArc3RhdGljIGludCB2aG9zdF9tZGV2X3Byb2JlKHN0cnVjdCBkZXZp
Y2UgKmRldikKPj4+ICt7Cj4+PiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG1kZXZfZnJv
bV9kZXYoZGV2KTsKPj4+ICsJY29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9w
cyA9IG1kZXZfZ2V0X2Rldl9vcHMobWRldik7Cj4+PiArCXN0cnVjdCB2aG9zdF9tZGV2ICptOwo+
Pj4gKwlpbnQgbnZxcywgcjsKPj4+ICsKPj4+ICsJbSA9IGt6YWxsb2Moc2l6ZW9mKCptKSwgR0ZQ
X0tFUk5FTCB8IF9fR0ZQX1JFVFJZX01BWUZBSUwpOwo+Pj4gKwlpZiAoIW0pCj4+PiArCQlyZXR1
cm4gLUVOT01FTTsKPj4+ICsKPj4+ICsJbXV0ZXhfaW5pdCgmbS0+bXV0ZXgpOwo+Pj4gKwo+Pj4g
KwludnFzID0gb3BzLT5nZXRfcXVldWVfbWF4KG1kZXYpOwo+Pj4gKwltLT5udnFzID0gbnZxczsK
Pj4gVGhlIG5hbWUgY291bGQgYmUgY29uZnVzaW5nLCBnZXRfcXVldWVfbWF4KCkgaXMgdG8gZ2V0
IHRoZSBtYXhpbXVtIG51bWJlciBvZgo+PiBlbnRyaWVzIGZvciBhIHZpcnRxdWV1ZSBzdXBwb3J0
ZWQgYnkgdGhpcyBkZXZpY2UuCj4gT0suIEl0IG1pZ2h0IGJlIGJldHRlciB0byByZW5hbWUgaXQg
dG8gc29tZXRoaW5nIGxpa2U6Cj4KPiAJZ2V0X3ZxX251bV9tYXgoKQo+Cj4gd2hpY2ggaXMgbW9y
ZSBjb25zaXN0ZW50IHdpdGggdGhlIHNldF92cV9udW0oKS4KPgo+PiBJdCBsb29rcyB0byBtZSB0
aGF0IHdlIG5lZWQgYW5vdGhlciBBUEkgdG8gcXVlcnkgdGhlIG1heGltdW0gbnVtYmVyIG9mCj4+
IHZpcnRxdWV1ZXMgc3VwcG9ydGVkIGJ5IHRoZSBkZXZpY2UuCj4gWWVhaC4KPgo+IFRoYW5rcywK
PiBUaXdlaQoKCk9uZSBwcm9ibGVtIGhlcmU6CgpDb25zaWRlciBpZiB3ZSB3YW50IHRvIHN1cHBv
cnQgbXVsdGlxdWV1ZSwgaG93IGRpZCB1c2Vyc3BhY2Uga25vdyBhYm91dCAKdGhpcz8gTm90ZSB0
aGlzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGZldGNoZWQgZnJvbSBnZXRfY29uZmlnKCkgdmlhIGEg
CmRldmljZSBzcGVjaWZpYyB3YXksIGRvIHdlIHdhbnQgaW9jdGwgZm9yIGFjY2Vzc2luZyB0aGF0
IGFyZWE/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
