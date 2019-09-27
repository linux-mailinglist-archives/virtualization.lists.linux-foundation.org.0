Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 18943C04F5
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 14:16:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1AF611097;
	Fri, 27 Sep 2019 12:15:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 625891090
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 12:15:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 531018A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 12:15:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96CF22D7E1;
	Fri, 27 Sep 2019 12:15:55 +0000 (UTC)
Received: from [10.72.12.24] (ovpn-12-24.pek2.redhat.com [10.72.12.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC722608C2;
	Fri, 27 Sep 2019 12:15:43 +0000 (UTC)
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<20190927045438.GA17152@___>
	<05ab395e-6677-e8c3-becf-57bc1529921f@redhat.com>
	<20190927053829-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <552fc91c-2eb6-8870-3077-e808e7e0917b@redhat.com>
Date: Fri, 27 Sep 2019 20:15:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927053829-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 27 Sep 2019 12:15:55 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, lingshan.zhu@intel.com
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

Ck9uIDIwMTkvOS8yNyDkuIvljYg1OjM4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
RnJpLCBTZXAgMjcsIDIwMTkgYXQgMDQ6NDc6NDNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAxOS85LzI3IOS4i+WNiDEyOjU0LCBUaXdlaSBCaWUgd3JvdGU6Cj4+PiBPbiBGcmks
IFNlcCAyNywgMjAxOSBhdCAxMTo0NjowNkFNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+
IE9uIDIwMTkvOS8yNiDkuIvljYgxMjo1NCwgVGl3ZWkgQmllIHdyb3RlOgo+Pj4+PiArCj4+Pj4+
ICtzdGF0aWMgbG9uZyB2aG9zdF9tZGV2X3N0YXJ0KHN0cnVjdCB2aG9zdF9tZGV2ICptKQo+Pj4+
PiArewo+Pj4+PiArCXN0cnVjdCBtZGV2X2RldmljZSAqbWRldiA9IG0tPm1kZXY7Cj4+Pj4+ICsJ
Y29uc3Qgc3RydWN0IHZpcnRpb19tZGV2X2RldmljZV9vcHMgKm9wcyA9IG1kZXZfZ2V0X2Rldl9v
cHMobWRldik7Cj4+Pj4+ICsJc3RydWN0IHZpcnRpb19tZGV2X2NhbGxiYWNrIGNiOwo+Pj4+PiAr
CXN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxOwo+Pj4+PiArCWludCBpZHg7Cj4+Pj4+ICsKPj4+
Pj4gKwlvcHMtPnNldF9mZWF0dXJlcyhtZGV2LCBtLT5hY2tlZF9mZWF0dXJlcyk7Cj4+Pj4+ICsK
Pj4+Pj4gKwltZGV2X2FkZF9zdGF0dXMobWRldiwgVklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09L
KTsKPj4+Pj4gKwlpZiAoIShtZGV2X2dldF9zdGF0dXMobWRldikgJiBWSVJUSU9fQ09ORklHX1Nf
RkVBVFVSRVNfT0spKQo+Pj4+PiArCQlnb3RvIHJlc2V0Owo+Pj4+PiArCj4+Pj4+ICsJZm9yIChp
ZHggPSAwOyBpZHggPCBtLT5udnFzOyBpZHgrKykgewo+Pj4+PiArCQl2cSA9ICZtLT52cXNbaWR4
XTsKPj4+Pj4gKwo+Pj4+PiArCQlpZiAoIXZxLT5kZXNjIHx8ICF2cS0+YXZhaWwgfHwgIXZxLT51
c2VkKQo+Pj4+PiArCQkJYnJlYWs7Cj4+Pj4+ICsKPj4+Pj4gKwkJaWYgKG9wcy0+c2V0X3ZxX3N0
YXRlKG1kZXYsIGlkeCwgdnEtPmxhc3RfYXZhaWxfaWR4KSkKPj4+Pj4gKwkJCWdvdG8gcmVzZXQ7
Cj4+Pj4gSWYgd2UgZG8gc2V0X3ZxX3N0YXRlKCkgaW4gU0VUX1ZSSU5HX0JBU0UsIHdlIHdvbid0
IG5lZWQgdGhpcyBzdGVwIGhlcmUuCj4+PiBZZWFoLCBJIHBsYW4gdG8gZG8gaXQgaW4gdGhlIG5l
eHQgdmVyc2lvbi4KPj4+Cj4+Pj4+ICsKPj4+Pj4gKwkJLyoKPj4+Pj4gKwkJICogSW4gdmhvc3Qt
bWRldiwgdXNlcnNwYWNlIHNob3VsZCBwYXNzIHJpbmcgYWRkcmVzc2VzCj4+Pj4+ICsJCSAqIGlu
IGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3NlcyB3aGVuIElPTU1VIGlzIGRpc2FibGVkIG9yCj4+Pj4+
ICsJCSAqIElPVkFzIHdoZW4gSU9NTVUgaXMgZW5hYmxlZC4KPj4+Pj4gKwkJICovCj4+Pj4gQSBx
dWVzdGlvbiBoZXJlLCBjb25zaWRlciB3ZSdyZSB1c2luZyBub2lvbW11IG1vZGUuIElmIGd1ZXN0
IHBoeXNpY2FsCj4+Pj4gYWRkcmVzcyBpcyBwYXNzZWQgaGVyZSwgaG93IGNhbiBhIGRldmljZSB1
c2UgdGhhdD8KPj4+Pgo+Pj4+IEkgYmVsaWV2ZSB5b3UgbWVhbnQgImhvc3QgcGh5c2ljYWwgYWRk
cmVzcyIgaGVyZT8gQW5kIGl0IGFsc28gaGF2ZSB0aGUKPj4+PiBpbXBsaWNhdGlvbiB0aGF0IHRo
ZSBIUEEgc2hvdWxkIGJlIGNvbnRpbnVvdXMgKGUuZyB1c2luZyBodWdldGxiZnMpLgo+Pj4gVGhl
IGNvbW1lbnQgaXMgdGFsa2luZyBhYm91dCB0aGUgdmlydHVhbCBJT01NVSAoaS5lLiBpb3RsYiBp
biB2aG9zdCkuCj4+PiBJdCBzaG91bGQgYmUgcmVwaHJhc2VkIHRvIGNvdmVyIHRoZSBub2lvbW11
IGNhc2UgYXMgd2VsbC4gVGhhbmtzIGZvcgo+Pj4gc3BvdHRpbmcgdGhpcy4KPj4+Cj4+Pgo+Pj4+
PiArCj4+Pj4+ICsJc3dpdGNoIChjbWQpIHsKPj4+Pj4gKwljYXNlIFZIT1NUX01ERVZfU0VUX1NU
QVRFOgo+Pj4+PiArCQlyID0gdmhvc3Rfc2V0X3N0YXRlKG0sIGFyZ3ApOwo+Pj4+PiArCQlicmVh
azsKPj4+Pj4gKwljYXNlIFZIT1NUX0dFVF9GRUFUVVJFUzoKPj4+Pj4gKwkJciA9IHZob3N0X2dl
dF9mZWF0dXJlcyhtLCBhcmdwKTsKPj4+Pj4gKwkJYnJlYWs7Cj4+Pj4+ICsJY2FzZSBWSE9TVF9T
RVRfRkVBVFVSRVM6Cj4+Pj4+ICsJCXIgPSB2aG9zdF9zZXRfZmVhdHVyZXMobSwgYXJncCk7Cj4+
Pj4+ICsJCWJyZWFrOwo+Pj4+PiArCWNhc2UgVkhPU1RfR0VUX1ZSSU5HX0JBU0U6Cj4+Pj4+ICsJ
CXIgPSB2aG9zdF9nZXRfdnJpbmdfYmFzZShtLCBhcmdwKTsKPj4+Pj4gKwkJYnJlYWs7Cj4+Pj4g
RG9lcyBpdCBtZWFuIHRoZSBTRVRfVlJJTkdfQkFTRSBtYXkgb25seSB0YWtlIGFmZmVjdCBhZnRl
cgo+Pj4+IFZIT1NUX01FVl9TRVRfU1RBVEU/Cj4+PiBZZWFoLCBpbiB0aGlzIHZlcnNpb24sIFNF
VF9WUklOR19CQVNFIHdvbid0IHNldCB0aGUgYmFzZSB0byB0aGUKPj4+IGRldmljZSBkaXJlY3Rs
eS4gQnV0IEkgcGxhbiB0byBub3QgZGVsYXkgdGhpcyBhbnltb3JlIGluIHRoZSBuZXh0Cj4+PiB2
ZXJzaW9uIHRvIHN1cHBvcnQgdGhlIFNFVF9TVEFUVVMuCj4+Pgo+Pj4+PiArCWRlZmF1bHQ6Cj4+
Pj4+ICsJCXIgPSB2aG9zdF9kZXZfaW9jdGwoJm0tPmRldiwgY21kLCBhcmdwKTsKPj4+Pj4gKwkJ
aWYgKHIgPT0gLUVOT0lPQ1RMQ01EKQo+Pj4+PiArCQkJciA9IHZob3N0X3ZyaW5nX2lvY3RsKCZt
LT5kZXYsIGNtZCwgYXJncCk7Cj4+Pj4+ICsJfQo+Pj4+PiArCj4+Pj4+ICsJbXV0ZXhfdW5sb2Nr
KCZtLT5tdXRleCk7Cj4+Pj4+ICsJcmV0dXJuIHI7Cj4+Pj4+ICt9Cj4+Pj4+ICsKPj4+Pj4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgdmZpb19kZXZpY2Vfb3BzIHZmaW9fdmhvc3RfbWRldl9kZXZfb3Bz
ID0gewo+Pj4+PiArCS5uYW1lCQk9ICJ2ZmlvLXZob3N0LW1kZXYiLAo+Pj4+PiArCS5vcGVuCQk9
IHZob3N0X21kZXZfb3BlbiwKPj4+Pj4gKwkucmVsZWFzZQk9IHZob3N0X21kZXZfcmVsZWFzZSwK
Pj4+Pj4gKwkuaW9jdGwJCT0gdmhvc3RfbWRldl91bmxvY2tlZF9pb2N0bCwKPj4+Pj4gK307Cj4+
Pj4+ICsKPj4+Pj4gK3N0YXRpYyBpbnQgdmhvc3RfbWRldl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4+Pj4+ICt7Cj4+Pj4+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbWRldl9mcm9t
X2RldihkZXYpOwo+Pj4+PiArCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpv
cHMgPSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOwo+Pj4+PiArCXN0cnVjdCB2aG9zdF9tZGV2ICpt
Owo+Pj4+PiArCWludCBudnFzLCByOwo+Pj4+PiArCj4+Pj4+ICsJbSA9IGt6YWxsb2Moc2l6ZW9m
KCptKSwgR0ZQX0tFUk5FTCB8IF9fR0ZQX1JFVFJZX01BWUZBSUwpOwo+Pj4+PiArCWlmICghbSkK
Pj4+Pj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+Pj4+ICsKPj4+Pj4gKwltdXRleF9pbml0KCZtLT5t
dXRleCk7Cj4+Pj4+ICsKPj4+Pj4gKwludnFzID0gb3BzLT5nZXRfcXVldWVfbWF4KG1kZXYpOwo+
Pj4+PiArCW0tPm52cXMgPSBudnFzOwo+Pj4+IFRoZSBuYW1lIGNvdWxkIGJlIGNvbmZ1c2luZywg
Z2V0X3F1ZXVlX21heCgpIGlzIHRvIGdldCB0aGUgbWF4aW11bSBudW1iZXIgb2YKPj4+PiBlbnRy
aWVzIGZvciBhIHZpcnRxdWV1ZSBzdXBwb3J0ZWQgYnkgdGhpcyBkZXZpY2UuCj4+PiBPSy4gSXQg
bWlnaHQgYmUgYmV0dGVyIHRvIHJlbmFtZSBpdCB0byBzb21ldGhpbmcgbGlrZToKPj4+Cj4+PiAJ
Z2V0X3ZxX251bV9tYXgoKQo+Pj4KPj4+IHdoaWNoIGlzIG1vcmUgY29uc2lzdGVudCB3aXRoIHRo
ZSBzZXRfdnFfbnVtKCkuCj4+Pgo+Pj4+IEl0IGxvb2tzIHRvIG1lIHRoYXQgd2UgbmVlZCBhbm90
aGVyIEFQSSB0byBxdWVyeSB0aGUgbWF4aW11bSBudW1iZXIgb2YKPj4+PiB2aXJ0cXVldWVzIHN1
cHBvcnRlZCBieSB0aGUgZGV2aWNlLgo+Pj4gWWVhaC4KPj4+Cj4+PiBUaGFua3MsCj4+PiBUaXdl
aQo+Pgo+PiBPbmUgcHJvYmxlbSBoZXJlOgo+Pgo+PiBDb25zaWRlciBpZiB3ZSB3YW50IHRvIHN1
cHBvcnQgbXVsdGlxdWV1ZSwgaG93IGRpZCB1c2Vyc3BhY2Uga25vdyBhYm91dAo+PiB0aGlzPwo+
IFRoZXJlJ3MgYSBmZWF0dXJlIGJpdCBmb3IgdGhpcywgaXNuJ3QgdGhlcmU/CgoKWWVzLCBidXQg
aXQgbmVlZHMgdG8ga25vdyBob3cgbWFueSBxdWV1ZSBwYWlycyBhcmUgYXZhaWxhYmxlLgoKVGhh
bmtzCgoKPgo+PiBOb3RlIHRoaXMgaW5mb3JtYXRpb24gY291bGQgYmUgZmV0Y2hlZCBmcm9tIGdl
dF9jb25maWcoKSB2aWEgYSBkZXZpY2UKPj4gc3BlY2lmaWMgd2F5LCBkbyB3ZSB3YW50IGlvY3Rs
IGZvciBhY2Nlc3NpbmcgdGhhdCBhcmVhPwo+Pgo+PiBUaGFua3MKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
